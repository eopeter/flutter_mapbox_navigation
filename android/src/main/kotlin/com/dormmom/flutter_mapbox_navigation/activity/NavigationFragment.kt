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
import androidx.annotation.Nullable
import androidx.appcompat.app.AppCompatDelegate
import androidx.fragment.app.Fragment
import com.dormmom.flutter_mapbox_navigation.FlutterMapboxNavigationPlugin
import com.dormmom.flutter_mapbox_navigation.R
import com.dormmom.flutter_mapbox_navigation.models.MapBoxEvents
import com.dormmom.flutter_mapbox_navigation.models.MapBoxLocation
import com.dormmom.flutter_mapbox_navigation.models.MapBoxRouteProgressEvent
import com.dormmom.flutter_mapbox_navigation.utilities.PluginUtilities
import com.dormmom.flutter_mapbox_navigation.utilities.SimplifiedCallback
import com.mapbox.api.directions.v5.DirectionsCriteria
import com.mapbox.api.directions.v5.models.BannerInstructions
import com.mapbox.api.directions.v5.models.DirectionsResponse
import com.mapbox.api.directions.v5.models.DirectionsRoute
import com.mapbox.geojson.Point
import com.mapbox.mapboxsdk.Mapbox
import com.mapbox.mapboxsdk.camera.CameraPosition
import com.mapbox.mapboxsdk.geometry.LatLng
import com.mapbox.mapboxsdk.location.modes.RenderMode
import com.mapbox.mapboxsdk.maps.Style
import com.mapbox.services.android.navigation.ui.v5.NavigationView
import com.mapbox.services.android.navigation.ui.v5.NavigationViewOptions
import com.mapbox.services.android.navigation.ui.v5.OnNavigationReadyCallback
import com.mapbox.services.android.navigation.ui.v5.listeners.BannerInstructionsListener
import com.mapbox.services.android.navigation.ui.v5.listeners.NavigationListener
import com.mapbox.services.android.navigation.ui.v5.listeners.RouteListener
import com.mapbox.services.android.navigation.ui.v5.listeners.SpeechAnnouncementListener
import com.mapbox.services.android.navigation.ui.v5.map.NavigationMapboxMap
import com.mapbox.services.android.navigation.ui.v5.voice.SpeechAnnouncement
import com.mapbox.services.android.navigation.v5.milestone.Milestone
import com.mapbox.services.android.navigation.v5.milestone.MilestoneEventListener
import com.mapbox.services.android.navigation.v5.navigation.MapboxNavigation
import com.mapbox.services.android.navigation.v5.navigation.NavigationEventListener
import com.mapbox.services.android.navigation.v5.navigation.NavigationRoute
import com.mapbox.services.android.navigation.v5.offroute.OffRouteListener
import com.mapbox.services.android.navigation.v5.route.FasterRouteListener
import com.mapbox.services.android.navigation.v5.routeprogress.ProgressChangeListener
import com.mapbox.services.android.navigation.v5.routeprogress.RouteProgress
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
class NavigationFragment : Fragment(), OnNavigationReadyCallback, NavigationListener,
        ProgressChangeListener, OffRouteListener, NavigationEventListener, RouteListener, MilestoneEventListener, BannerInstructionsListener, FasterRouteListener, SpeechAnnouncementListener {

    var receiver: BroadcastReceiver? = null

    private var navigationView: NavigationView? = null
    private lateinit var navigationMapboxMap: NavigationMapboxMap
    private lateinit var mapboxNavigation: MapboxNavigation
    private var dropoffDialogShown = false
    private var lastKnownLocation: Location? = null

    private var route: DirectionsRoute? = null
    private var points: MutableList<Point> = mutableListOf()

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
            //Toast.makeText(this, "Access Token is Required", Toast.LENGTH_SHORT).show()
            //finish()
            return
        }

        this.activity?.applicationContext?.let {
            NavigationRoute.builder(it)
                .accessToken(accessToken)
                .origin(origin)
                .destination(destination)
                .alternatives(FlutterMapboxNavigationPlugin.showAlternateRoutes)
                .profile(FlutterMapboxNavigationPlugin.navigationMode)
                .language(FlutterMapboxNavigationPlugin.navigationLanguage)
                .voiceUnits(FlutterMapboxNavigationPlugin.navigationVoiceUnits)
                .continueStraight(!FlutterMapboxNavigationPlugin.allowsUTurnsAtWayPoints)
                .annotations(DirectionsCriteria.ANNOTATION_DISTANCE, DirectionsCriteria.ANNOTATION_DURATION, DirectionsCriteria.ANNOTATION_DURATION, DirectionsCriteria.ANNOTATION_CONGESTION)
                .build()
                .getRoute(object : SimplifiedCallback() {
                    override fun onResponse(call: Call<DirectionsResponse>, response: Response<DirectionsResponse>) {
                        val directionsResponse = response.body()
                        if (directionsResponse != null) {
                            if (!directionsResponse.routes().isEmpty()) buildAndStartNavigation(directionsResponse.routes()[0]) else {
                                val message = directionsResponse.message()
                                PluginUtilities.sendEvent(MapBoxEvents.ROUTE_BUILD_FAILED, message!!)
                                //finish()
                            }
                        }
                    }

                    override fun onFailure(call: Call<DirectionsResponse>, throwable: Throwable) {
                        PluginUtilities.sendEvent(MapBoxEvents.ROUTE_BUILD_FAILED, throwable.localizedMessage)
                        //finish()
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

                mapboxNavigation.addOffRouteListener(this)
                mapboxNavigation.addFasterRouteListener(this)
                mapboxNavigation.addNavigationEventListener(this)
            }

            // Custom map style has been loaded and map is now ready
            val options =
                    NavigationViewOptions.builder()
                            .progressChangeListener(this)
                            .milestoneEventListener(this)
                            .navigationListener(this)
                            .speechAnnouncementListener(this)
                            .bannerInstructionsListener(this)
                            .routeListener(this)
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
        val options = NavigationViewOptions.builder()
                .directionsRoute(route)
                .shouldSimulateRoute(true)
                .navigationListener(this@NavigationFragment)
                .progressChangeListener(this)
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

    override fun onProgressChange(location: Location, routeProgress: RouteProgress) {
        lastKnownLocation = location
        val progressEvent = MapBoxRouteProgressEvent(routeProgress, location)
        FlutterMapboxNavigationPlugin.distanceRemaining = routeProgress.distanceRemaining()
        FlutterMapboxNavigationPlugin.durationRemaining = routeProgress.durationRemaining()
        PluginUtilities.sendEvent(progressEvent)
    }

    override fun userOffRoute(location: Location) {
        PluginUtilities.sendEvent(MapBoxEvents.USER_OFF_ROUTE,
                MapBoxLocation(
                        latitude = location.latitude,
                        longitude = location.longitude
                ).toString())
    }

    override fun onRunning(running: Boolean) {
        PluginUtilities.sendEvent(MapBoxEvents.NAVIGATION_RUNNING)
    }

    override fun allowRerouteFrom(offRoutePoint: Point?): Boolean {
        TODO("Not yet implemented")
    }

    override fun onOffRoute(offRoutePoint: Point?) {
        TODO("Not yet implemented")
    }

    override fun onRerouteAlong(directionsRoute: DirectionsRoute?) {
        TODO("Not yet implemented")
    }

    override fun onFailedReroute(errorMessage: String?) {
        TODO("Not yet implemented")
    }

    override fun onArrival() {
        PluginUtilities.sendEvent(MapBoxEvents.ON_ARRIVAL)
        if (points.isNotEmpty()) {
            fetchRoute(getLastKnownLocation(), points.removeAt(0))
            dropoffDialogShown = true // Accounts for multiple arrival events
            //Toast.makeText(this, "You have arrived!", Toast.LENGTH_SHORT).show()
        }
        else
        {
            FlutterMapboxNavigationPlugin.eventSink = null
        }
    }

    override fun onMilestoneEvent(routeProgress: RouteProgress, instruction: String, milestone: Milestone) {
        TODO("Not yet implemented")
    }

    override fun willDisplay(instructions: BannerInstructions?): BannerInstructions {
        TODO("Not yet implemented")
    }

    override fun fasterRouteFound(directionsRoute: DirectionsRoute) {
        TODO("Not yet implemented")
    }

    override fun willVoice(announcement: SpeechAnnouncement?): SpeechAnnouncement {
        TODO("Not yet implemented")
    }
}