package com.dormmom.flutter_mapbox_navigation.factory

import android.app.Activity
import android.app.Application
import android.content.Context
import android.graphics.BitmapFactory
import android.graphics.Color
import android.location.Location
import android.os.Build
import android.os.Bundle
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import androidx.annotation.DrawableRes
import androidx.annotation.NonNull
import com.dormmom.flutter_mapbox_navigation.FlutterMapboxNavigationPlugin

import com.dormmom.flutter_mapbox_navigation.utilities.PluginUtilities
import com.dormmom.flutter_mapbox_navigation.R
import com.dormmom.flutter_mapbox_navigation.models.MapBoxEvents
import com.dormmom.flutter_mapbox_navigation.models.MapBoxLocation
import com.dormmom.flutter_mapbox_navigation.models.MapBoxMileStone
import com.dormmom.flutter_mapbox_navigation.models.MapBoxRouteProgressEvent
import com.dormmom.flutter_mapbox_navigation.utilities.MapUtilities
import com.mapbox.android.core.location.LocationEngine
import com.mapbox.android.core.permissions.PermissionsManager
import com.mapbox.api.directions.v5.DirectionsCriteria
import com.mapbox.api.directions.v5.models.BannerInstructions
import com.mapbox.api.directions.v5.models.DirectionsResponse
import com.mapbox.api.directions.v5.models.DirectionsRoute
import com.mapbox.geojson.Point
import com.mapbox.mapboxsdk.Mapbox
import com.mapbox.mapboxsdk.camera.CameraPosition
import com.mapbox.mapboxsdk.camera.CameraUpdateFactory
import com.mapbox.mapboxsdk.geometry.LatLng
import com.mapbox.mapboxsdk.location.LocationComponentActivationOptions
import com.mapbox.mapboxsdk.location.LocationComponentOptions
import com.mapbox.mapboxsdk.location.modes.CameraMode
import com.mapbox.mapboxsdk.location.modes.RenderMode
import com.mapbox.mapboxsdk.maps.*
import com.mapbox.mapboxsdk.plugins.markerview.MarkerView
import com.mapbox.mapboxsdk.plugins.markerview.MarkerViewManager
import com.mapbox.mapboxsdk.style.layers.LineLayer
import com.mapbox.mapboxsdk.style.layers.Property.LINE_CAP_ROUND
import com.mapbox.mapboxsdk.style.layers.Property.LINE_JOIN_ROUND
import com.mapbox.mapboxsdk.style.layers.PropertyFactory
import com.mapbox.mapboxsdk.style.layers.PropertyFactory.*
import com.mapbox.mapboxsdk.style.layers.SymbolLayer
import com.mapbox.mapboxsdk.style.sources.GeoJsonSource
import com.mapbox.services.android.navigation.ui.v5.listeners.BannerInstructionsListener
import com.mapbox.services.android.navigation.ui.v5.listeners.NavigationListener
import com.mapbox.services.android.navigation.ui.v5.listeners.RouteListener
import com.mapbox.services.android.navigation.ui.v5.listeners.SpeechAnnouncementListener
import com.mapbox.services.android.navigation.ui.v5.route.NavigationMapRoute
import com.mapbox.services.android.navigation.ui.v5.voice.SpeechAnnouncement
import com.mapbox.services.android.navigation.v5.location.replay.ReplayRouteLocationEngine
import com.mapbox.services.android.navigation.v5.milestone.Milestone
import com.mapbox.services.android.navigation.v5.milestone.MilestoneEventListener
import com.mapbox.services.android.navigation.v5.navigation.*
import com.mapbox.services.android.navigation.v5.offroute.OffRouteListener
import com.mapbox.services.android.navigation.v5.route.FasterRouteListener
import com.mapbox.services.android.navigation.v5.routeprogress.ProgressChangeListener
import com.mapbox.services.android.navigation.v5.routeprogress.RouteProgress

import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.platform.PlatformView
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import timber.log.Timber
import java.util.*

class FlutterMapViewFactory  :
        PlatformView,
        MethodCallHandler,
        Application.ActivityLifecycleCallbacks,
        OnMapReadyCallback,
        ProgressChangeListener,
        OffRouteListener,
        MilestoneEventListener,
        NavigationEventListener,
        NavigationListener,
        FasterRouteListener,
        SpeechAnnouncementListener,
        BannerInstructionsListener,
        RouteListener,
        RefreshCallback, EventChannel.StreamHandler {

    constructor(cxt: Context, messenger: BinaryMessenger, accessToken: String, viewId: Int,  act: Activity,  args: Any?)
    {
        context = cxt
        activity = act
        val arguments = args as? Map<String, Any>
        if(arguments != null)
            setOptions(arguments)

        methodChannel = MethodChannel(messenger, "flutter_mapbox_navigation/${viewId}")
        eventChannel = EventChannel(messenger, "flutter_mapbox_navigation/${viewId}/events")
        eventChannel.setStreamHandler(this)
        options = MapboxMapOptions.createFromAttributes(context)
                .compassEnabled(false)
                .logoEnabled(true)
        mapView = MapView(context, options)
        navigation = MapboxNavigation(
                context,
                accessToken,
                navigationOptions
        )

        activity.application.registerActivityLifecycleCallbacks(this)
        methodChannel.setMethodCallHandler(this)
        mapView.getMapAsync(this)
    }

    private val activity: Activity
    private val context: Context
    private val methodChannel: MethodChannel
    private val eventChannel: EventChannel
    //private var eventSink: EventChannel.EventSink? = null

    private val options: MapboxMapOptions
    private var locationEngine: LocationEngine? = null
    private var mapView: MapView
    private var mapBoxMap: MapboxMap? = null
    private var currentRoute: DirectionsRoute? = null
    private val routeRefresh = RouteRefresh(Mapbox.getAccessToken()!!)
    private var navigationMapRoute: NavigationMapRoute? = null
    private val navigationOptions = MapboxNavigationOptions.Builder()
            .build()
    private var navigation: MapboxNavigation
    private var mapReady = false
    private lateinit var markerViewManager: MarkerViewManager
    private var initialMarkerView: MarkerView? = null
    private var locationMarkerView: MarkerView? = null

    private var isDisposed = false
    private var isRefreshing = false
    private var isBuildingRoute = false
    private var isNavigationInProgress = false
    private var isNavigationCanceled = false

    companion object {

        //Config
        var initialLat = 0.0
        var initialLong = 0.0

        val wayPoints: MutableList<Point> = mutableListOf()
        var navigationMode =  DirectionsCriteria.PROFILE_DRIVING_TRAFFIC
        var simulateRoute = false
        var mapStyleURL: String? = null
        var navigationLanguage = Locale("en")
        var navigationVoiceUnits = DirectionsCriteria.IMPERIAL
        var zoom = 8.0
        var bearing = 0.0
        var tilt = 0.0
        var distanceRemaining: Double? = null
        var durationRemaining: Double? = null

        var alternatives = true

        var continueStraight = false
        var enableRefresh = false
        var voiceInstructions = true
        var bannerInstructions = true

        var originPoint: Point? = null
        var destinationPoint: Point? = null
    }

    override fun getView(): View {
        return mapView
    }

    override fun onMethodCall(methodCall: MethodCall, result: MethodChannel.Result) {
        when (methodCall.method) {

            "buildRoute" -> {
                buildRoute(methodCall, result)
            }
            "clearRoute" -> {
                clearRoute(methodCall, result)
            }
            "startNavigation" -> {
                startNavigation(methodCall, result)
            }
            "finishNavigation" -> {
                cancelNavigation(methodCall, result)
            }
            "getDistanceRemaining" -> {
                getFormattedDistance(methodCall, result)
            }
            "getDurationRemaining" -> {
                getFormattedDuration(methodCall, result)
            }
            else -> result.notImplemented()
        }
    }

    override fun dispose() {
        isDisposed = true
        mapReady = false
        mapView.onStop()
        mapView.onDestroy()
    }

    private fun clearRoute(methodCall: MethodCall, result: MethodChannel.Result) {
        result.error("TODO", "Not Implemented in Android","will implement soon")
    }

    private fun buildRoute(methodCall: MethodCall, result: MethodChannel.Result) {
        isNavigationCanceled = false
        isNavigationInProgress = false
        val arguments = methodCall.arguments as? Map<String, Any>
        if(arguments != null)
            setOptions(arguments)

        if (mapReady) {
            wayPoints.clear()

            mapStyleURL = arguments?.get("mapStyleURL") as? String

            var points = arguments?.get("wayPoints") as HashMap<Int, Any>
            for (item in points)
            {
                val point = item.value as HashMap<*, *>
                val latitude = point["Latitude"] as Double
                val longitude = point["Longitude"] as Double
                wayPoints.add(Point.fromLngLat(longitude, latitude))
            }
            getRoute(context)
            result.success("Building route.")
        } else {
            result.success("Unable to build route, map is not ready. Try again.")
        }
    }

    private fun setOptions(arguments: Map<String, Any>)
    {
        val navMode = arguments?.get("mode") as? String
        if(navMode != null)
        {
            if(navMode == "walking")
                navigationMode = DirectionsCriteria.PROFILE_WALKING;
            else if(navMode == "cycling")
                navigationMode = DirectionsCriteria.PROFILE_CYCLING;
            else if(navMode == "driving")
                navigationMode = DirectionsCriteria.PROFILE_DRIVING;
        }

        val simulated = arguments?.get("simulateRoute") as? Boolean
        if (simulated != null) {
            simulateRoute = simulated
        }

        var language = arguments?.get("language") as? String
        if(language != null)
            navigationLanguage = Locale(language)

        var units = arguments?.get("units") as? String

        if(units != null)
        {
            if(units == "imperial")
                navigationVoiceUnits = DirectionsCriteria.IMPERIAL
            else if(units == "metric")
                navigationVoiceUnits = DirectionsCriteria.METRIC
        }

        mapStyleURL = arguments?.get("mapStyleURL") as? String
    }

    override fun onMapReady(mapboxMap1: MapboxMap) {

        this.mapReady = true
        this.mapBoxMap = mapboxMap1
        locationEngine = ReplayRouteLocationEngine()

        mapBoxMap?.setStyle(context.getString(R.string.navigation_guidance_day)) { style ->
            context.addDestinationIconSymbolLayer(style)
            enableLocationComponent(style)

            val routeLineLayer = LineLayer("line-layer-id", "source-id")
            routeLineLayer.setProperties(
                    lineWidth(9f),
                    lineColor(Color.RED),
                    lineCap(LINE_CAP_ROUND),
                    lineJoin(LINE_JOIN_ROUND)
            )
            style.addLayer(routeLineLayer)
        }

        markerViewManager = MarkerViewManager(mapView, mapBoxMap)
        moveCamera(LatLng(initialLat, initialLong))

        PluginUtilities.sendEvent(MapBoxEvents.MAP_READY)
    }

    fun Context.addDestinationIconSymbolLayer(loadedMapStyle: Style) {
        loadedMapStyle.addImage("destination-icon-id",
                BitmapFactory.decodeResource(this.resources, R.drawable.mapbox_marker_icon_default))
        val geoJsonSource = GeoJsonSource("destination-source-id")
        loadedMapStyle.addSource(geoJsonSource)
        val destinationSymbolLayer = SymbolLayer("destination-symbol-layer-id", "destination-source-id")
        destinationSymbolLayer.withProperties(
                PropertyFactory.iconImage("destination-icon-id"),
                PropertyFactory.iconAllowOverlap(true),
                PropertyFactory.iconIgnorePlacement(true)
        )
        loadedMapStyle.addLayer(destinationSymbolLayer)
    }

    private fun moveCamera(location: LatLng) {
        val cameraPosition = CameraPosition.Builder()
                .target(location)
                .zoom(zoom)
                .bearing(bearing)
                .tilt(tilt)
                .build()

        mapBoxMap?.animateCamera(CameraUpdateFactory
                .newCameraPosition(cameraPosition), 3000)
    }

    private fun addCustomMarker(location: LatLng, @DrawableRes markerIcon: Int, rotationFrom: Double? = null, rotationTo: Double? = null) {
        if (initialMarkerView != null) {
            markerViewManager.removeMarker(initialMarkerView!!)
        }

        val markerView = ImageView(context)
        markerView.setImageResource(markerIcon)
        markerView.layoutParams = ViewGroup.LayoutParams(100, 100)

        rotationTo?.let {
            markerView.rotation = rotationTo.toFloat()
            /*rotationFrom?.let {
                val rotate = RotateAnimation(rotationFrom.toFloat(), rotationTo.toFloat(), Animation.RELATIVE_TO_SELF, 0.5f, Animation.RELATIVE_TO_SELF, 0.5f)
                rotate.duration = 800
                rotate.interpolator = LinearInterpolator()
                rotate.isFillEnabled = true
                //rotate.fillAfter = true
                markerView.startAnimation(rotate)
            }*/
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            markerView.elevation = 16.0f
        }
        initialMarkerView = MarkerView(location, markerView)
        initialMarkerView?.let {
            markerViewManager.addMarker(it)
        }
    }

    private fun addLocationMarker(location: LatLng, @DrawableRes markerIcon: Int) {
        if (locationMarkerView != null) {
            markerViewManager.removeMarker(locationMarkerView!!)
        }

        val markerView = ImageView(context)
        markerView.setImageResource(markerIcon)
        markerView.layoutParams = ViewGroup.LayoutParams(100, 100)

        locationMarkerView = MarkerView(location, markerView)
        locationMarkerView?.let {
            markerViewManager.addMarker(it)
        }
    }


    private fun getRoute(context: Context) {

        //TODO Remove for Offline Routing
        if (!PluginUtilities.isNetworkAvailable(context)) {
            PluginUtilities.sendEvent(MapBoxEvents.ROUTE_BUILD_FAILED, "No Internet Connection")
            return
        }

        PluginUtilities.sendEvent(MapBoxEvents.ROUTE_BUILDING)

        originPoint = Point.fromLngLat(wayPoints[0].longitude(), wayPoints[0].latitude())
        destinationPoint = Point.fromLngLat(wayPoints[1].longitude(), wayPoints[1].latitude())

        NavigationRoute.builder(context)
                .accessToken(Mapbox.getAccessToken()!!)
                .origin(originPoint!!)
                .destination(destinationPoint!!)
                .language(navigationLanguage)
                .alternatives(alternatives)
                .profile(navigationMode)
                .continueStraight(continueStraight)
                .enableRefresh(enableRefresh)
                .voiceUnits(navigationVoiceUnits)
                .annotations(DirectionsCriteria.ANNOTATION_DISTANCE, DirectionsCriteria.ANNOTATION_DURATION, DirectionsCriteria.ANNOTATION_CONGESTION)
                .build()
                .getRoute(object : Callback<DirectionsResponse> {
                    override fun onResponse(call: Call<DirectionsResponse?>, response: Response<DirectionsResponse?>) {

                        if (response.body() == null || response.body()!!.routes().size < 1) {
                            PluginUtilities.sendEvent(MapBoxEvents.ROUTE_BUILD_FAILED, "No routes found")
                            return
                        }

                        currentRoute = response.body()!!.routes()[0]
                        PluginUtilities.sendEvent(MapBoxEvents.ROUTE_BUILT)

                        moveCameraToOriginOfRoute()

                        // Draw the route on the map
                        if (navigationMapRoute != null) {
                            navigationMapRoute?.removeRoute()
                        } else {
                            navigationMapRoute = NavigationMapRoute(navigation, mapView, mapBoxMap!!, R.style.NavigationMapRoute)
                        }
                        navigationMapRoute?.addRoute(currentRoute)
                        isBuildingRoute = false

                        //Start Navigation again from new Point, if it was already in Progress
                        if (isNavigationInProgress) {
                            startNavigation()
                        }
                    }

                    override fun onFailure(call: Call<DirectionsResponse?>, throwable: Throwable) {
                        isBuildingRoute = false
                        PluginUtilities.sendEvent(MapBoxEvents.ROUTE_BUILD_FAILED, "${throwable.message}")
                    }
                })
    }

    private fun moveCameraToOriginOfRoute() {
        currentRoute?.let {
            val originCoordinate = it.routeOptions()?.coordinates()?.get(0)
            originCoordinate?.let {
                val location = LatLng(originCoordinate.latitude(), originCoordinate.longitude())
                moveCamera(location)
                //addCustomMarker(location)
            }
        }
    }

    override fun onActivityCreated(activity: Activity, savedInstanceState: Bundle?) {

        mapView.onCreate(savedInstanceState)
    }

    override fun onActivityStarted(activity: Activity) {

        try {
            mapView.onStart()
        } catch (e: java.lang.Exception) {
            Timber.i(String.format("onActivityStarted, %s", "Error: ${e.message}"))
        }
    }

    override fun onActivityResumed(activity: Activity) {

        mapView.onResume()
    }

    override fun onActivityPaused(activity: Activity) {
        mapView.onPause()
    }

    override fun onActivityStopped(activity: Activity) {
        //mapView.onStop()
    }

    override fun onActivitySaveInstanceState(activity: Activity, outState: Bundle?) {

        mapView.onSaveInstanceState(outState!!)
    }

    override fun onActivityDestroyed(activity: Activity) {

        //mapView.onDestroy()
    }

    override fun onRefresh(directionsRoute: DirectionsRoute) {
        refreshNavigation(directionsRoute, shouldCancel = false)
        isRefreshing = false
    }

    override fun onError(error: RefreshError) {

    }

    override fun onProgressChange(location: Location, routeProgress: RouteProgress) {

        if (!isNavigationCanceled) {
            try {

                val progressEvent = MapBoxRouteProgressEvent(routeProgress, location)
                PluginUtilities.sendEvent(progressEvent)
                addCustomMarker(LatLng(location.latitude, location.longitude), R.drawable.mapbox_marker_icon_default)

                moveCamera(LatLng(location.latitude, location.longitude))

                if (simulateRoute && !isDisposed && !isBuildingRoute)
                    mapBoxMap?.locationComponent?.forceLocationUpdate(location)

                if (!isRefreshing) {
                    isRefreshing = true
                    routeRefresh.refresh(routeProgress, this)
                }
            } catch (e: java.lang.Exception) {

            }
        }
    }

    override fun userOffRoute(location: Location) {

        doOnNewRoute(Point.fromLngLat(location.latitude, location.longitude))
    }

    override fun onMilestoneEvent(routeProgress: RouteProgress, instruction: String, milestone: Milestone) {

        if (!isNavigationCanceled) {
            PluginUtilities.sendEvent(MapBoxEvents.MILESTONE_EVENT,
                    MapBoxMileStone(
                            identifier = milestone.identifier,
                            distanceTraveled = routeProgress.distanceTraveled(),
                            legIndex = routeProgress.legIndex,
                            stepIndex = routeProgress.stepIndex
                    ).toString())
        }
    }

    override fun onRunning(running: Boolean) {

        if (!isNavigationCanceled) {
            PluginUtilities.sendEvent(MapBoxEvents.NAVIGATION_RUNNING)

        }
    }

    override fun onCancelNavigation() {
        PluginUtilities.sendEvent(MapBoxEvents.NAVIGATION_CANCELLED)

        navigation.stopNavigation()

    }

    override fun onNavigationFinished() {
        PluginUtilities.sendEvent(MapBoxEvents.NAVIGATION_FINISHED)
    }

    override fun onNavigationRunning() {
        if (!isNavigationCanceled) {
            PluginUtilities.sendEvent(MapBoxEvents.NAVIGATION_RUNNING)

        }
    }

    override fun fasterRouteFound(directionsRoute: DirectionsRoute) {
        PluginUtilities.sendEvent(MapBoxEvents.FASTER_ROUTE_FOUND, directionsRoute.toJson())

        refreshNavigation(directionsRoute)

    }

    private fun refreshNavigation(directionsRoute: DirectionsRoute?, shouldCancel: Boolean = true) {
        directionsRoute?.let {

            if (shouldCancel) {

                currentRoute = directionsRoute
                cancelNavigation()
                startNavigation()
            }
        }
    }

    override fun willVoice(announcement: SpeechAnnouncement?): SpeechAnnouncement? {
        return if (voiceInstructions) {
            PluginUtilities.sendEvent(MapBoxEvents.SPEECH_ANNOUNCEMENT, "${announcement?.announcement()}")
            announcement
        } else {
            null
        }
    }

    override fun willDisplay(instructions: BannerInstructions?): BannerInstructions? {
        return if (bannerInstructions) {
            PluginUtilities.sendEvent(MapBoxEvents.BANNER_INSTRUCTION,"${instructions?.primary()?.text()}")

            return instructions
        } else {
            null
        }
    }

    override fun onArrival() {
        PluginUtilities.sendEvent(MapBoxEvents.ON_ARRIVAL)
    }

    override fun onFailedReroute(errorMessage: String?) {
        PluginUtilities.sendEvent(MapBoxEvents.FAILED_TO_REROUTE,"$errorMessage")

    }

    override fun onOffRoute(offRoutePoint: Point?) {
        doOnNewRoute(offRoutePoint)
    }

    private fun doOnNewRoute(offRoutePoint: Point?) {
        if (!isBuildingRoute) {
            isBuildingRoute = true

            offRoutePoint?.let {

                cancelNavigation(isOffRouted = true)

                moveCamera(LatLng(it.latitude(), it.longitude()))

                PluginUtilities.sendEvent(MapBoxEvents.USER_OFF_ROUTE,
                        MapBoxLocation(
                                latitude = it.latitude(),
                                longitude = it.longitude()
                        ).toString())

            }

            PluginUtilities.sendEvent(MapBoxEvents.USER_OFF_ROUTE,
                    MapBoxLocation(
                            latitude = offRoutePoint?.latitude(),
                            longitude = offRoutePoint?.longitude()
                    ).toString())

            originPoint = offRoutePoint
            isNavigationInProgress = true
            getRoute(context)
        }
    }

    override fun onRerouteAlong(directionsRoute: DirectionsRoute?) {
        PluginUtilities.sendEvent(MapBoxEvents.REROUTE_ALONG, "${directionsRoute?.toJson()}")
        refreshNavigation(directionsRoute)

    }

    override fun allowRerouteFrom(offRoutePoint: Point?): Boolean {

        return true
    }


    private fun enableLocationComponent(@NonNull loadedMapStyle: Style) {
        if (PermissionsManager.areLocationPermissionsGranted(context)) {
            val customLocationComponentOptions = LocationComponentOptions.builder(context)
                    .pulseEnabled(true)
                    .build()
            mapBoxMap?.locationComponent?.let { locationComponent ->
                try {
                    locationComponent.activateLocationComponent(
                            LocationComponentActivationOptions.builder(context, loadedMapStyle)
                                    .locationComponentOptions(customLocationComponentOptions)
                                    .build())
                    locationComponent.isLocationComponentEnabled = true
                    locationComponent.cameraMode = CameraMode.TRACKING
                    locationComponent.renderMode = RenderMode.NORMAL

                    locationComponent.lastKnownLocation?.let {
                        val location = LatLng(it.latitude, it.longitude)
                        moveCamera(location)
                    }
                } catch (e: Exception) {
                    Timber.i(String.format("enableLocationComponent, %s", "Error: ${e.message}"))
                }
            }
        }
    }

    private fun startNavigation() {
        isNavigationCanceled = false

        if (currentRoute != null) {
            navigation.addOffRouteListener(this@FlutterMapViewFactory)
            navigation.addFasterRouteListener(this@FlutterMapViewFactory)
            navigation.addProgressChangeListener(this@FlutterMapViewFactory)
            navigation.addMilestoneEventListener(this@FlutterMapViewFactory)
            navigation.addNavigationEventListener(this@FlutterMapViewFactory)

            currentRoute?.let {
                if (simulateRoute) {
                    (locationEngine as ReplayRouteLocationEngine).assign(it)
                    navigation.locationEngine = locationEngine as ReplayRouteLocationEngine
                }
                isNavigationInProgress = true
                navigation.startNavigation(it)
                PluginUtilities.sendEvent(MapBoxEvents.NAVIGATION_RUNNING)
            }
        }
    }


    private fun startNavigation(methodCall: MethodCall, result: MethodChannel.Result) {

        //TODO: load options

        startNavigation()

        if (currentRoute != null) {
            result.success("Embedded Navigation started.")
        } else {
            result.success("No route found. Unable to start navigation.")
        }
    }

    private fun cancelNavigation(isOffRouted: Boolean = false) {
        zoom = 15.0
        bearing = 0.0
        tilt = 0.0
        isNavigationCanceled = true

        if (!isOffRouted) {
            isNavigationInProgress = false
            moveCameraToOriginOfRoute()
        }

        if (currentRoute != null) {
            navigation.stopNavigation()
            navigation.removeFasterRouteListener(this)
            navigation.removeMilestoneEventListener(this)
            navigation.removeNavigationEventListener(this)
            navigation.removeOffRouteListener(this)
            navigation.removeProgressChangeListener(this)
        }

    }

    private fun cancelNavigation(methodCall: MethodCall, result: MethodChannel.Result) {

        cancelNavigation()

        if (currentRoute != null) {
            result.success("Navigation stopped.")
        } else {
            result.success("No route found. Unable to stop navigation.")
        }
    }

    private fun getFormattedDistance(methodCall: MethodCall, result: MethodChannel.Result) {
        val distance = PluginUtilities.getDoubleValueById("distance", methodCall)
        result.success(MapUtilities.formatDistance(distance, context, navigationLanguage))
    }

    private fun getFormattedDuration(methodCall: MethodCall, result: MethodChannel.Result) {
        val duration = PluginUtilities.getDoubleValueById("duration", methodCall)
        result.success(MapUtilities.formatTime(duration, context))
    }

    private fun addMarker(methodCall: MethodCall, result: MethodChannel.Result) {
        val latitude = PluginUtilities.getDoubleValueById("latitude", methodCall)
        val longitude = PluginUtilities.getDoubleValueById("longitude", methodCall)

        if (latitude != null && longitude != null) {
            val location = LatLng(latitude, longitude)
            addCustomMarker(location, R.drawable.map_marker_dark)
            result.success("Marker Added.")
        } else {
            result.success("Unable to add marker, location invalid.")
        }
    }

    private fun moveCamera(methodCall: MethodCall, result: MethodChannel.Result) {
        val latitude = PluginUtilities.getDoubleValueById("latitude", methodCall)
        val longitude = PluginUtilities.getDoubleValueById("longitude", methodCall)

        if (latitude != null && longitude != null) {
            val location = LatLng(latitude, longitude)
            moveCamera(location)
            result.success("Camera Moved.")
        } else {
            result.success("Unable to move camera, location invalid.")
        }
    }


    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        FlutterMapboxNavigationPlugin.eventSink = events
    }

    override fun onCancel(arguments: Any?) {
        FlutterMapboxNavigationPlugin.eventSink = null
    }
}