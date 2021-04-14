package com.dormmom.flutter_mapbox_navigation.activity

import android.content.*
import android.location.Location
import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity

import com.dormmom.flutter_mapbox_navigation.FlutterMapboxNavigationPlugin
import com.dormmom.flutter_mapbox_navigation.R
import com.dormmom.flutter_mapbox_navigation.models.MapBoxEvents
import com.dormmom.flutter_mapbox_navigation.models.MapBoxLocation
import com.dormmom.flutter_mapbox_navigation.models.MapBoxMileStone
import com.dormmom.flutter_mapbox_navigation.models.MapBoxRouteProgressEvent
import com.dormmom.flutter_mapbox_navigation.utilities.PluginUtilities
import com.dormmom.flutter_mapbox_navigation.utilities.PluginUtilities.Companion.sendEvent
import com.mapbox.android.core.location.LocationEngine
import com.mapbox.android.core.location.LocationEngineProvider

import com.mapbox.api.directions.v5.DirectionsCriteria
import com.mapbox.api.directions.v5.models.*

import com.mapbox.geojson.Point
import com.mapbox.mapboxsdk.Mapbox
import com.mapbox.mapboxsdk.camera.CameraPosition
import com.mapbox.mapboxsdk.geometry.LatLng
import com.mapbox.mapboxsdk.location.modes.RenderMode
import com.mapbox.mapboxsdk.maps.Style
import com.mapbox.navigation.base.internal.extensions.applyDefaultParams
import com.mapbox.navigation.base.internal.extensions.coordinates
import com.mapbox.navigation.base.trip.model.RouteLegProgress
import com.mapbox.navigation.base.trip.model.RouteProgress
import com.mapbox.navigation.core.MapboxNavigation
import com.mapbox.navigation.core.MapboxNavigationProvider
import com.mapbox.navigation.core.arrival.ArrivalObserver
import com.mapbox.navigation.core.directions.session.RoutesObserver
import com.mapbox.navigation.core.directions.session.RoutesRequestCallback
import com.mapbox.navigation.core.fasterroute.FasterRouteObserver
import com.mapbox.navigation.core.replay.MapboxReplayer
import com.mapbox.navigation.core.replay.ReplayLocationEngine
import com.mapbox.navigation.core.replay.route.ReplayProgressObserver
import com.mapbox.navigation.core.reroute.RerouteController
import com.mapbox.navigation.core.reroute.RerouteState
import com.mapbox.navigation.core.trip.session.LocationObserver
import com.mapbox.navigation.core.trip.session.OffRouteObserver
import com.mapbox.navigation.core.trip.session.RouteProgressObserver
import com.mapbox.navigation.core.trip.session.VoiceInstructionsObserver
import com.mapbox.navigation.ui.NavigationView
import com.mapbox.navigation.ui.NavigationViewOptions
import com.mapbox.navigation.ui.OnNavigationReadyCallback
import com.mapbox.navigation.ui.listeners.BannerInstructionsListener
import com.mapbox.navigation.ui.listeners.NavigationListener
import com.mapbox.navigation.ui.listeners.SpeechAnnouncementListener
import com.mapbox.navigation.ui.map.NavigationMapboxMap

class NavigationActivity : AppCompatActivity(),
        OnNavigationReadyCallback,
        NavigationListener,
        RouteProgressObserver,
        RoutesObserver,
        BannerInstructionsListener,
        SpeechAnnouncementListener,
        ArrivalObserver,
        LocationObserver {

    override fun onCreate(savedInstanceState: Bundle?) {

        receiver = object : BroadcastReceiver() {
            override fun onReceive(context: Context, intent: Intent) {
                finish()
            }
        }
        registerReceiver(receiver, IntentFilter(NavigationLauncher.KEY_STOP_NAVIGATION))
        super.onCreate(savedInstanceState)
        setTheme(R.style.Theme_AppCompat_NoActionBar)

        val accessToken = PluginUtilities.getResourceFromContext(this.applicationContext, "mapbox_access_token")
        Mapbox.getInstance(this.applicationContext, accessToken)
        setContentView(R.layout.activity_navigation)
        val p = intent.getSerializableExtra("waypoints") as? MutableList<Point>
        if(p != null) points = p

        navigationView = findViewById(R.id.navigationView)
        navigationView?.onCreate(savedInstanceState)
        navigationView?.initialize(this, getInitialCameraPosition())
    }

    override fun onNavigationReady(isRunning: Boolean) {

        if (isRunning && ::navigationMapboxMap.isInitialized) {
            return
        }

        fetchRoute()
    }

    private fun fetchRoute() {

        val accessToken = Mapbox.getAccessToken()
        if (accessToken == null || accessToken == "MAPBOX_ACCESS_TOKEN_HERE") {
            sendEvent(MapBoxEvents.ROUTE_BUILD_FAILED, "Access Token is Required")
            finish()
            return
        }

        val navigationOptions = MapboxNavigation.defaultNavigationOptionsBuilder(this, accessToken).locationEngine(getLocationEngine()).build()
        mapboxNavigation = MapboxNavigationProvider.create(navigationOptions)
        mapboxNavigation.registerOffRouteObserver(offRouteObserver)
        mapboxNavigation.attachFasterRouteObserver(fasterRouteObserver)
        mapboxNavigation.registerVoiceInstructionsObserver(voiceInstructionsObserver)
        //mapboxNavigation.getRerouteController()?.registerRerouteStateObserver(rerouteStateObserver)

        //mapboxNavigation.startTripSession()
        //return
        mapboxNavigation.requestRoutes(
                RouteOptions.builder()
                        .accessToken(accessToken)
                        .coordinates(points)
                        .applyDefaultParams()
                        .alternatives(FlutterMapboxNavigationPlugin.showAlternateRoutes)
                        .profile(FlutterMapboxNavigationPlugin.navigationMode)
                        .language(FlutterMapboxNavigationPlugin.navigationLanguage)
                        .voiceUnits(FlutterMapboxNavigationPlugin.navigationVoiceUnits)
                        .continueStraight(!FlutterMapboxNavigationPlugin.allowsUTurnsAtWayPoints)
                        .annotations(DirectionsCriteria.ANNOTATION_DISTANCE)
                        .build(), routeRequestCallBack)

    }

    private fun buildAndStartNavigation(directionsRoute: DirectionsRoute) {
        currentRoute = directionsRoute
        navigationView?.retrieveNavigationMapboxMap()?.let {navigationMap ->

            if(FlutterMapboxNavigationPlugin.mapStyleUrlDay != null)
                navigationMap.retrieveMap().setStyle(Style.Builder().fromUri(FlutterMapboxNavigationPlugin.mapStyleUrlDay as String))

            if(FlutterMapboxNavigationPlugin.mapStyleUrlNight != null)
                navigationMap.retrieveMap().setStyle(Style.Builder().fromUri(FlutterMapboxNavigationPlugin.mapStyleUrlNight as String))


            this.navigationMapboxMap = navigationMap
            this.navigationMapboxMap.updateLocationLayerRenderMode(RenderMode.NORMAL)

            // Custom map style has been loaded and map is now ready
            val options =
                    NavigationViewOptions.builder(this)
                            .routeProgressObserver(this)
                            .locationObserver(this)
                            .arrivalObserver(this)
                            .navigationListener(this)
                            .speechAnnouncementListener(this)
                            .bannerInstructionsListener(this)
                            .directionsRoute(directionsRoute)
                            .shouldSimulateRoute(FlutterMapboxNavigationPlugin.simulateRoute)
                            .build()

            navigationView?.startNavigation(options)

            if(FlutterMapboxNavigationPlugin.simulateRoute)
            {
                mapboxNavigation
                        ?.registerRouteProgressObserver(ReplayProgressObserver(mapboxReplayer))
                mapboxReplayer.pushRealLocation(this, 0.0)
                mapboxReplayer.play()
            }

        }
    }

    override fun onRouteProgressChanged(routeProgress: RouteProgress) {
        val progressEvent = MapBoxRouteProgressEvent(routeProgress)
        FlutterMapboxNavigationPlugin.distanceRemaining = routeProgress.distanceRemaining
        FlutterMapboxNavigationPlugin.durationRemaining = routeProgress.durationRemaining
        sendEvent(progressEvent)
    }

    override fun onEnhancedLocationChanged(enhancedLocation: Location, keyPoints: List<Location>) {
        lastKnownLocation = enhancedLocation
    }

    override fun onRawLocationChanged(rawLocation: Location) {
        lastKnownLocation = rawLocation
    }

    override fun onRoutesChanged(routes: List<DirectionsRoute>) {
        TODO("Not yet implemented")
    }

    override fun onNavigationFinished() {
        sendEvent(MapBoxEvents.NAVIGATION_FINISHED)
    }

    override fun onNavigationRunning() {
        sendEvent(MapBoxEvents.NAVIGATION_RUNNING)
    }

    override fun onCancelNavigation() {
        sendEvent(MapBoxEvents.NAVIGATION_CANCELLED)
        navigationView?.stopNavigation()
        FlutterMapboxNavigationPlugin.eventSink = null
        NavigationLauncher.stopNavigation(this)
        finish()
        
    }

    override fun willVoice(announcement: VoiceInstructions?): VoiceInstructions {

        sendEvent(MapBoxEvents.SPEECH_ANNOUNCEMENT,
                "${announcement?.announcement()}")
        return announcement!!
    }

    override fun willDisplay(instructions: BannerInstructions?): BannerInstructions {
        sendEvent(MapBoxEvents.BANNER_INSTRUCTION,
                "${instructions?.primary()?.text()}")
        return instructions!!
    }

    //onArrival
    override fun onFinalDestinationArrival(routeProgress: RouteProgress) {
        sendEvent(MapBoxEvents.ON_ARRIVAL)
        FlutterMapboxNavigationPlugin.eventSink = null
    }

    override fun onNextRouteLegStart(routeLegProgress: RouteLegProgress) {
        TODO("Not yet implemented")
    }

    override fun onLowMemory() {
        super.onLowMemory()
        navigationView?.onLowMemory()
    }

    override fun onStart() {
        super.onStart()
        navigationView?.onStart()
        //mapboxNavigation.registerOffRouteObserver(offRouteObserver)
    }

    override fun onResume() {
        super.onResume()
        navigationView?.onResume()
    }

    override fun onStop() {
        super.onStop()
        navigationView?.onStop()
        mapboxNavigation.unregisterOffRouteObserver(offRouteObserver)
        mapboxNavigation.detachFasterRouteObserver()
    }

    override fun onPause() {
        super.onPause()
        navigationView?.onPause()
    }

    override fun onDestroy() {
        navigationView?.onDestroy()
        unregisterReceiver(receiver)
        super.onDestroy()
    }

    override fun onBackPressed() {
        // If the navigation view didn't need to do anything, call super
        if (!navigationView?.onBackPressed()!!) {
            super.onBackPressed()
        }
    }

    override fun onSaveInstanceState(outState: Bundle) {
        navigationView?.onSaveInstanceState(outState)
        super.onSaveInstanceState(outState)
    }

    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        navigationView?.onRestoreInstanceState(savedInstanceState)
    }

    private fun getLastKnownLocation(): Point {
        return Point.fromLngLat(lastKnownLocation?.longitude!!, lastKnownLocation?.latitude!!)
    }

    private fun getLocationEngine(): LocationEngine {
        return if (FlutterMapboxNavigationPlugin.simulateRoute) {
            ReplayLocationEngine(mapboxReplayer)
        } else {
            LocationEngineProvider.getBestLocationEngine(this)
        }
    }

    private fun getInitialCameraPosition(): CameraPosition {
        if(currentRoute == null)
            return CameraPosition.DEFAULT;

        val originCoordinate = currentRoute?.routeOptions()?.coordinates()?.get(0)
        return CameraPosition.Builder()
                .target(LatLng(originCoordinate!!.latitude(), originCoordinate.longitude()))
                .zoom(FlutterMapboxNavigationPlugin.zoom)
                .bearing(FlutterMapboxNavigationPlugin.bearing)
                .tilt(FlutterMapboxNavigationPlugin.tilt)
                .build()
    }

    //MARK: Instance variables

    var receiver: BroadcastReceiver? = null

    private var navigationView: NavigationView? = null
    private lateinit var navigationMapboxMap: NavigationMapboxMap
    private lateinit var mapboxNavigation: MapboxNavigation
    private val mapboxReplayer = MapboxReplayer()

    private var lastKnownLocation: Location? = null

    private val route by lazy { intent.getSerializableExtra("route") as? DirectionsRoute }
    private var currentRoute: DirectionsRoute? = null

    private var points: MutableList<Point> = mutableListOf()

    private val offRouteObserver = object : OffRouteObserver {
        override fun onOffRouteStateChanged(offRoute: Boolean) {
            sendEvent(MapBoxEvents.USER_OFF_ROUTE, offRoute.toString())
        }
    }

    private val fasterRouteObserver = object : FasterRouteObserver {

        override fun restartAfterMillis() = FasterRouteObserver.DEFAULT_INTERVAL_MILLIS

        override fun onFasterRoute(currentRoute: DirectionsRoute, alternatives: List<DirectionsRoute>, isAlternativeFaster: Boolean) {
            sendEvent(MapBoxEvents.FASTER_ROUTE_FOUND, currentRoute.toJson())
        }
    }

    private val voiceInstructionsObserver = object : VoiceInstructionsObserver {
        override fun onNewVoiceInstructions(voiceInstructions: VoiceInstructions) {

        }
    }

    private val routeRequestCallBack = object : RoutesRequestCallback {
        override fun onRoutesReady(routes: List<DirectionsRoute>) {
            if (routes.isNotEmpty()) buildAndStartNavigation(routes[0]) else {
                sendEvent(MapBoxEvents.ROUTE_BUILD_NO_ROUTES_FOUND)
            }
        }
        override fun onRoutesRequestFailure(throwable: Throwable, routeOptions: RouteOptions) {
            val message = throwable.localizedMessage
            sendEvent(MapBoxEvents.ROUTE_BUILD_FAILED, message!!)
            finish()
        }
        override fun onRoutesRequestCanceled(routeOptions: RouteOptions) {
            sendEvent(MapBoxEvents.ROUTE_BUILD_CANCELLED)
            finish()
        }
    }

    private val rerouteStateObserver = object : RerouteController.RerouteStateObserver {

        override fun onRerouteStateChanged(rerouteState: RerouteState) {

            if (rerouteState is RerouteState.Failed){
                sendEvent(MapBoxEvents.FAILED_TO_REROUTE, rerouteState.message)
            }
            else if (rerouteState is RerouteState.RouteFetched){

            }
        }

        fun onRerouteAlong(directionsRoute: DirectionsRoute?) {
            sendEvent(MapBoxEvents.REROUTE_ALONG, "${directionsRoute?.toJson()}")
        }

        fun allowRerouteFrom(offRoutePoint: Point?): Boolean {
            return true
        }

        fun onOffRoute(offRoutePoint: Point?) {
            sendEvent(MapBoxEvents.USER_OFF_ROUTE,
                    MapBoxLocation(
                            latitude = offRoutePoint?.latitude(),
                            longitude = offRoutePoint?.longitude()
                    ).toString())

        }

    }


}