package com.dormmom.flutter_mapbox_navigation.activity

import android.content.BroadcastReceiver
import android.content.Context
import android.content.SharedPreferences
import android.location.Location
import android.os.Bundle
import android.preference.PreferenceManager
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.annotation.Nullable
import androidx.appcompat.app.AppCompatDelegate
import androidx.fragment.app.Fragment
import com.dormmom.flutter_mapbox_navigation.FlutterMapboxNavigationPlugin
import com.dormmom.flutter_mapbox_navigation.R
import com.dormmom.flutter_mapbox_navigation.models.MapBoxEvents
import com.dormmom.flutter_mapbox_navigation.models.MapBoxLocation
import com.dormmom.flutter_mapbox_navigation.models.MapBoxRouteProgressEvent
import com.dormmom.flutter_mapbox_navigation.utilities.PluginUtilities

import com.mapbox.api.directions.v5.DirectionsCriteria
import com.mapbox.api.directions.v5.models.*
import com.mapbox.geojson.Point
import com.mapbox.mapboxsdk.Mapbox
import com.mapbox.mapboxsdk.camera.CameraPosition
import com.mapbox.mapboxsdk.geometry.LatLng
import com.mapbox.mapboxsdk.location.modes.RenderMode
import com.mapbox.mapboxsdk.maps.Style
import com.mapbox.navigation.base.internal.extensions.coordinates
import com.mapbox.navigation.base.trip.model.RouteLegProgress
import com.mapbox.navigation.base.trip.model.RouteProgress
import com.mapbox.navigation.core.MapboxNavigation
import com.mapbox.navigation.core.arrival.ArrivalObserver
import com.mapbox.navigation.core.directions.session.RoutesObserver
import com.mapbox.navigation.core.directions.session.RoutesRequestCallback
import com.mapbox.navigation.core.fasterroute.FasterRouteObserver
import com.mapbox.navigation.core.reroute.RerouteController
import com.mapbox.navigation.core.reroute.RerouteState
import com.mapbox.navigation.core.trip.session.LocationObserver
import com.mapbox.navigation.core.trip.session.OffRouteObserver
import com.mapbox.navigation.core.trip.session.RouteProgressObserver
import com.mapbox.navigation.ui.NavigationView
import com.mapbox.navigation.ui.NavigationViewOptions
import com.mapbox.navigation.ui.OnNavigationReadyCallback
import com.mapbox.navigation.ui.listeners.BannerInstructionsListener
import com.mapbox.navigation.ui.listeners.NavigationListener
import com.mapbox.navigation.ui.listeners.SpeechAnnouncementListener
import com.mapbox.navigation.ui.map.NavigationMapboxMap

import retrofit2.Call
import retrofit2.Response


// TODO: Rename parameter arguments, choose names that match
// the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
private const val ARG_ROUTE = "route"
private const val ARG_WAYPOINTS = "waypoints"

/**
 * A simple [Fragment] subclass.
 * Use the [NavigationFragment.newInstance] factory method to
 * create an instance of this fragment.
 */
class NavigationFragment : Fragment(), OnNavigationReadyCallback,
        NavigationListener,
        RouteProgressObserver,
        RoutesObserver,
        BannerInstructionsListener,
        SpeechAnnouncementListener,
        ArrivalObserver,
        LocationObserver {

    var receiver: BroadcastReceiver? = null

    private var navigationView: NavigationView? = null
    private lateinit var navigationMapboxMap: NavigationMapboxMap
    private lateinit var mapboxNavigation: MapboxNavigation
    private var dropoffDialogShown = false
    private var lastKnownLocation: Location? = null

    private var route: DirectionsRoute? = null
    private var points: MutableList<Point> = mutableListOf()

    private var currentDestination: Point? = null;

    val offRouteObserver = object : OffRouteObserver {
        override fun onOffRouteStateChanged(offRoute: Boolean) {
            PluginUtilities.sendEvent(MapBoxEvents.USER_OFF_ROUTE, offRoute.toString())
        }
    }

    val fasterRouteObserver = object : FasterRouteObserver {

        override fun restartAfterMillis() = FasterRouteObserver.DEFAULT_INTERVAL_MILLIS

        override fun onFasterRoute(currentRoute: DirectionsRoute, alternatives: List<DirectionsRoute>, isAlternativeFaster: Boolean) {
            PluginUtilities.sendEvent(MapBoxEvents.FASTER_ROUTE_FOUND, currentRoute.toJson())
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {

        super.onCreate(savedInstanceState)
        arguments?.let {
            route = it.getSerializable(ARG_ROUTE) as? DirectionsRoute
            var p = it.getSerializable(ARG_WAYPOINTS) as? MutableList<Point>
            if(p != null)
            {
                points = p
            }
        }

    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?,
                              savedInstanceState: Bundle?): View? {
        this.activity?.applicationContext?.let {
            val accessToken = PluginUtilities.getResourceFromContext(it, "mapbox_access_token")
            Mapbox.getInstance(it, accessToken)
        }

        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_navigation, container, false)
    }

    override fun onViewCreated(view: View, @Nullable savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        updateNightMode()
        navigationView = view.findViewById(R.id.navigation_fragment_frame)
        navigationView?.onCreate(savedInstanceState)
        navigationView?.initialize(
                this,
                getInitialCameraPosition()
        )
    }

    companion object {
        /**
         * Use this factory method to create a new instance of
         * this fragment using the provided parameters.
         *
         * @param param1 Parameter 1.
         * @param param2 Parameter 2.
         * @return A new instance of fragment NavigationFragment.
         */
        // TODO: Rename and change types and number of parameters
        @JvmStatic
        fun newInstance(param1: String, param2: String) =
                NavigationFragment().apply {
                    arguments = Bundle().apply {
                        putString(ARG_ROUTE, param1)
                        putString(ARG_WAYPOINTS, param2)
                    }
                }
    }

    private fun fetchRoute(origin: Point, destination: Point) {

        val accessToken = Mapbox.getAccessToken()
        if (accessToken == null) {
            Toast.makeText(this.context, "Access Token is Required", Toast.LENGTH_SHORT).show()
            return
        }

        this.activity?.applicationContext?.let {
            mapboxNavigation.requestRoutes(
            RouteOptions.builder()
                .accessToken(accessToken)
                    .coordinates(origin, destination = destination)
                .alternatives(FlutterMapboxNavigationPlugin.showAlternateRoutes)
                .profile(FlutterMapboxNavigationPlugin.navigationMode)
                .language(FlutterMapboxNavigationPlugin.navigationLanguage)
                .voiceUnits(FlutterMapboxNavigationPlugin.navigationVoiceUnits)
                .continueStraight(!FlutterMapboxNavigationPlugin.allowsUTurnsAtWayPoints)
                .annotations(DirectionsCriteria.ANNOTATION_DISTANCE)
                .build(),
                    object : RoutesRequestCallback {
                        override fun onRoutesReady(routes: List<DirectionsRoute>) {
                            if (routes.isNotEmpty()) buildAndStartNavigation(routes[0]) else {
                                PluginUtilities.sendEvent(MapBoxEvents.ROUTE_BUILD_NO_ROUTES_FOUND)
                            }
                        }
                        override fun onRoutesRequestFailure(throwable: Throwable, routeOptions: RouteOptions) {
                            val message = throwable.localizedMessage
                            PluginUtilities.sendEvent(MapBoxEvents.ROUTE_BUILD_FAILED, message!!)
                        }
                        override fun onRoutesRequestCanceled(routeOptions: RouteOptions) {
                            PluginUtilities.sendEvent(MapBoxEvents.ROUTE_BUILD_CANCELLED)
                        }
                    })
        }
    }

    private fun buildAndStartNavigation(directionsRoute: DirectionsRoute) {

        dropoffDialogShown = false

        navigationView?.retrieveNavigationMapboxMap()?.let {navigationMap ->

            if(FlutterMapboxNavigationPlugin.mapStyleUrlDay != null)
                navigationMap.retrieveMap().setStyle(Style.Builder().fromUri(FlutterMapboxNavigationPlugin.mapStyleUrlDay as String))

            if(FlutterMapboxNavigationPlugin.mapStyleUrlNight != null)
                navigationMap.retrieveMap().setStyle(Style.Builder().fromUri(FlutterMapboxNavigationPlugin.mapStyleUrlNight as String))

            this.navigationMapboxMap = navigationMap
            this.navigationMapboxMap.updateLocationLayerRenderMode(RenderMode.NORMAL)
            navigationView?.retrieveMapboxNavigation()?.let {
                this.mapboxNavigation = it

                mapboxNavigation.registerOffRouteObserver(offRouteObserver)
                mapboxNavigation.attachFasterRouteObserver(fasterRouteObserver)
                mapboxNavigation.getRerouteController()?.registerRerouteStateObserver(object : RerouteController.RerouteStateObserver {

                    override fun onRerouteStateChanged(rerouteState: RerouteState) {
                        if (rerouteState is RerouteState.Failed){
                            PluginUtilities.sendEvent(MapBoxEvents.FAILED_TO_REROUTE, rerouteState.message)
                        }
                        else if (rerouteState is RerouteState.RouteFetched){

                        }
                    }

                    fun onRerouteAlong(directionsRoute: DirectionsRoute?) {
                        PluginUtilities.sendEvent(MapBoxEvents.REROUTE_ALONG, "${directionsRoute?.toJson()}")
                    }

                    fun allowRerouteFrom(offRoutePoint: Point?): Boolean {
                        return true
                    }

                    fun onOffRoute(offRoutePoint: Point?) {
                        PluginUtilities.sendEvent(MapBoxEvents.USER_OFF_ROUTE,
                                MapBoxLocation(
                                        latitude = offRoutePoint?.latitude(),
                                        longitude = offRoutePoint?.longitude()
                                ).toString())
                        if(offRoutePoint != null)
                            fetchRoute(offRoutePoint, getCurrentDestination());
                        else
                            fetchRoute(getLastKnownLocation(), getCurrentDestination());
                    }

                })
            }

            // Custom map style has been loaded and map is now ready
            val options =
                    NavigationViewOptions.builder(this.context!!)
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

        }
        //navigationView!!.startNavigation(navigationViewOptions)
    }

    private fun getLastKnownLocation(): Point {
        return Point.fromLngLat(lastKnownLocation?.longitude!!, lastKnownLocation?.latitude!!)
    }

    private fun getCurrentDestination(): Point {
        return Point.fromLngLat(currentDestination?.longitude()!!, currentDestination?.latitude()!!)
    }

    private fun getInitialCameraPosition(): CameraPosition {
        if(route == null)
            return CameraPosition.DEFAULT;

        val originCoordinate = route?.routeOptions()?.coordinates()?.get(0)
        return CameraPosition.Builder()
                .target(LatLng(originCoordinate!!.latitude(), originCoordinate.longitude()))
                .zoom(FlutterMapboxNavigationPlugin.zoom)
                .bearing(FlutterMapboxNavigationPlugin.bearing)
                .tilt(FlutterMapboxNavigationPlugin.tilt)
                .build()
    }

    private fun startNavigation() {
        if (route == null) {
            return
        }
        val options = NavigationViewOptions.builder(this.context!!)
                .routeProgressObserver(this)
                .locationObserver(this)
                .arrivalObserver(this)
                .navigationListener(this)
                .speechAnnouncementListener(this)
                .bannerInstructionsListener(this)
                .directionsRoute(route)
                .shouldSimulateRoute(FlutterMapboxNavigationPlugin.simulateRoute)
                .build()
        navigationView!!.startNavigation(options)
    }

    private fun stopNavigation() {
        /*
        val activity = activity
        if (activity != null && activity is FragmentNavigationActivity) {
            val fragmentNavigationActivity: FragmentNavigationActivity = activity as FragmentNavigationActivity
            fragmentNavigationActivity.showPlaceholderFragment()
            fragmentNavigationActivity.showNavigationFab()
            updateWasNavigationStopped(true)
            updateWasInTunnel(false)
        }

         */
    }

    private fun updateNightMode() {
        if (wasNavigationStopped()) {
            updateWasNavigationStopped(false)
            AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_FOLLOW_SYSTEM)
            activity!!.recreate()
        }
    }

    private fun wasNavigationStopped(): Boolean {
        val context: Context? = activity
        val preferences: SharedPreferences = PreferenceManager.getDefaultSharedPreferences(context)
        return preferences.getBoolean(getString(R.string.was_navigation_stopped), false)
    }

    fun updateWasNavigationStopped(wasNavigationStopped: Boolean) {
        val context: Context? = activity
        val preferences = PreferenceManager.getDefaultSharedPreferences(context)
        val editor = preferences.edit()
        editor.putBoolean(getString(R.string.was_navigation_stopped), wasNavigationStopped)
        editor.apply()
    }


    override fun onNavigationReady(isRunning: Boolean) {

        if (isRunning && ::navigationMapboxMap.isInitialized) {
            return
        }

        if(points.count() > 0)
        {
            fetchRoute(points.removeAt(0), points.removeAt(0))
        }

    }
    override fun onCancelNavigation() {
        PluginUtilities.sendEvent(MapBoxEvents.NAVIGATION_CANCELLED)
        navigationView?.stopNavigation()
        FlutterMapboxNavigationPlugin.eventSink = null
        stopNavigation()
    }

    override fun onNavigationFinished() {
        PluginUtilities.sendEvent(MapBoxEvents.NAVIGATION_FINISHED)
    }

    override fun onNavigationRunning() {
        PluginUtilities.sendEvent(MapBoxEvents.NAVIGATION_RUNNING)
    }

    override fun onRouteProgressChanged(routeProgress: RouteProgress) {
        val progressEvent = MapBoxRouteProgressEvent(routeProgress)
        FlutterMapboxNavigationPlugin.distanceRemaining = routeProgress.distanceRemaining
        FlutterMapboxNavigationPlugin.durationRemaining = routeProgress.durationRemaining
        PluginUtilities.sendEvent(progressEvent)
    }

    override fun onEnhancedLocationChanged(enhancedLocation: Location, keyPoints: List<Location>) {
        lastKnownLocation = enhancedLocation
    }

    override fun onRawLocationChanged(rawLocation: Location) {
        lastKnownLocation = rawLocation
    }

    override fun willVoice(announcement: VoiceInstructions?): VoiceInstructions {

        PluginUtilities.sendEvent(MapBoxEvents.SPEECH_ANNOUNCEMENT,
                "${announcement?.announcement()}")
        return announcement!!
    }

    override fun willDisplay(instructions: BannerInstructions?): BannerInstructions {
        PluginUtilities.sendEvent(MapBoxEvents.BANNER_INSTRUCTION,
                "${instructions?.primary()?.text()}")
        return instructions!!
    }

    //onArrival
    override fun onFinalDestinationArrival(routeProgress: RouteProgress) {
        PluginUtilities.sendEvent(MapBoxEvents.ON_ARRIVAL)
        if (points.isNotEmpty()) {
            fetchRoute(getLastKnownLocation(), points.removeAt(0))
        }
        else
        {
            FlutterMapboxNavigationPlugin.eventSink = null
        }
    }

    override fun onNextRouteLegStart(routeLegProgress: RouteLegProgress) {
        TODO("Not yet implemented")
    }

    override fun onRoutesChanged(routes: List<DirectionsRoute>) {
        TODO("Not yet implemented")
    }
}