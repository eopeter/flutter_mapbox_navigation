package com.dormmom.flutter_mapbox_navigation

import android.Manifest
import android.app.Activity
import android.content.Context
import android.content.pm.PackageManager
import android.os.Build
import androidx.annotation.NonNull
import com.mapbox.api.directions.v5.DirectionsCriteria
import com.mapbox.api.directions.v5.models.DirectionsResponse
import com.mapbox.api.directions.v5.models.DirectionsRoute
import com.mapbox.services.android.navigation.ui.v5.NavigationLauncher
import com.mapbox.services.android.navigation.ui.v5.NavigationLauncherOptions
import com.mapbox.services.android.navigation.v5.navigation.NavigationRoute
import com.mapbox.geojson.Point
import com.mapbox.mapboxsdk.Mapbox
import com.mapbox.services.android.navigation.ui.v5.NavigationViewOptions
import com.mapbox.services.android.navigation.v5.routeprogress.RouteProgressState
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.BinaryMessenger
import retrofit2.Call
import retrofit2.Callback
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import retrofit2.Response

class FlutterMapboxNavigationPlugin: MethodCallHandler, EventChannel.StreamHandler, FlutterPlugin {

    var _activity: Activity
    var _context: Context

    var methodChannel: MethodChannel? = null;
    var eventChannel: EventChannel? = null;

    var _origin: Point? = null
    var _destination: Point? = null
    var _navigationMode: String? =  "drivingWithTraffic"
    var _simulateRoute: Boolean = false

    var _distanceRemaining: Double? = null
    var _durationRemaining: Double? = null

    var PERMISSION_REQUEST_CODE: Int = 367

    constructor(_context: Context, _activity: Activity) {
        this._context = _context
        this._activity = _activity
    }

    var _eventSink:EventChannel.EventSink? = null


    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {

            val instance = FlutterMapboxNavigationPlugin(registrar.activeContext(), registrar.activity())
            instance.onAttachedToEngine(registrar.activeContext(), registrar.messenger())

        }
    }

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {

        onAttachedToEngine(
                binding.applicationContext, binding.flutterEngine.dartExecutor);

    }

    private fun onAttachedToEngine(binding: Context, messenger: BinaryMessenger) {

        methodChannel = MethodChannel(messenger, "flutter_mapbox_navigation");
        eventChannel = EventChannel(messenger, "flutter_mapbox_navigation/arrival");
        eventChannel!!.setStreamHandler(this);
        methodChannel!!.setMethodCallHandler(this);

    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {

       // _context = null;
        methodChannel!!.setMethodCallHandler(null);
        methodChannel = null;
        eventChannel!!.setStreamHandler(null);
        eventChannel = null;

    }

    override fun onMethodCall(call: MethodCall, result: Result) {

        var arguments = call.arguments as? Map<String, Any>

        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        }
        else if(call.method == "getDistanceRemaining")
        {
            result.success(_distanceRemaining);
        }
        else if(call.method == "getDurationRemaining")
        {
            result.success(_durationRemaining);
        }
        else if(call.method == "startNavigation")
        {
            var originName = arguments?.get("originName") as? String
            var originLatitude = arguments?.get("originLatitude") as? Double
            var originLongitude = arguments?.get("originLongitude") as? Double

            var destinationName = arguments?.get("destinationName") as? String
            var destinationLatitude = arguments?.get("destinationLatitude") as? Double
            var destinationLongitude = arguments?.get("destinationLongitude") as? Double

            var navigationMode = arguments?.get("mode") as? String
            if(navigationMode != null)
                _navigationMode = navigationMode;
            
            var simulateRoute = arguments?.get("simulateRoute") as Boolean
            _simulateRoute = simulateRoute;

            if(originLatitude != null && originLongitude != null && destinationLatitude != null && destinationLongitude != null)
            {

                val origin = Point.fromLngLat(originLongitude, originLatitude)
                val destination = Point.fromLngLat(destinationLongitude, destinationLatitude)
                _origin = origin
                _destination = destination

                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                    var haspermission = _activity.checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION)
                    if(haspermission != PackageManager.PERMISSION_GRANTED) {
                        //_activity.onRequestPermissionsResult((a,b,c) => onRequestPermissionsResult)
                        _activity.requestPermissions(arrayOf(Manifest.permission.ACCESS_FINE_LOCATION), PERMISSION_REQUEST_CODE)
                        startNavigation(origin, destination, simulateRoute)
                    }
                    else
                        startNavigation(origin, destination, simulateRoute)
                }
                else
                    startNavigation(origin, destination, simulateRoute)


            }
        }
        else {
            result.notImplemented()
        }
    }

    fun startNavigation(origin: Point, destination: Point, simulateRoute: Boolean)
    {
        var navigationMode = DirectionsCriteria.PROFILE_DRIVING_TRAFFIC;
        if(_navigationMode == "walking")
            navigationMode = DirectionsCriteria.PROFILE_WALKING;
        else if(_navigationMode == "cycling")
            navigationMode = DirectionsCriteria.PROFILE_CYCLING;
        else if(_navigationMode == "driving")
            navigationMode = DirectionsCriteria.PROFILE_DRIVING;

        var accessToken = getResourceFromContext(_context, "mapbox_access_token")
        Mapbox.getInstance(_context, accessToken)

        var navViewOptions = NavigationViewOptions.builder();
        navViewOptions.progressChangeListener { location, routeProgress ->
            var currentState = routeProgress?.currentState()
            _distanceRemaining =  routeProgress?.distanceRemaining();
            _durationRemaining = routeProgress?.durationRemaining();

            _eventSink?.success(currentState == RouteProgressState.ROUTE_ARRIVED);
        }

        var opt = NavigationRoute.builder(_context)
                .accessToken(accessToken)
                .origin(origin)
                .destination(destination)
                .profile(navigationMode)
                .build()
                .getRoute(object : Callback<DirectionsResponse> {
                    override fun onResponse(call: Call<DirectionsResponse>, response: Response<DirectionsResponse>) {

                        if (response.body() != null) {
                            if (!response.body()!!.routes().isEmpty()) {
                                // Route fetched from NavigationRoute
                                val route: DirectionsRoute = response.body()!!.routes().get(0)

                                // Create a NavigationLauncherOptions object to package everything together
                                val options = NavigationLauncherOptions.builder()
                                        .directionsRoute(route)
                                        .shouldSimulateRoute(simulateRoute)
                                        .build()
                                
                                // Call this method with Context from within an Activity
                                NavigationLauncher.startNavigation(_activity, options);

                            }
                        }


                    }

                    override fun onFailure(call: Call<DirectionsResponse>, t: Throwable) {

                    }
                })


    }


    override fun onListen(args: Any?, events: EventChannel.EventSink?) {
        _eventSink = events;
    }

    override fun onCancel(args: Any?) {
        _eventSink = null;
    }


    fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
        when (requestCode) {
            367 -> {

                for (permission in permissions) {
                    if (permission == Manifest.permission.ACCESS_FINE_LOCATION)
                    {
                        var haspermission = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                            _activity.checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION)
                        } else {
                            TODO("VERSION.SDK_INT < M")
                        }
                        if(haspermission == PackageManager.PERMISSION_GRANTED) {
                            if(_origin != null && _destination != null)
                                startNavigation(_origin!!, _destination!!, _simulateRoute)
                        }
                        // Not all permissions granted. Show some message and return.
                        return
                    }
                }

                // All permissions are granted. Do the work accordingly.
            }
        }
        //super.onRequestPermissionsResult(requestCode, permissions, grantResults)

    }

    private fun getResourceFromContext(@NonNull context: Context, resName: String): String {
        val stringRes = context.resources.getIdentifier(resName, "string", context.packageName)
        if (stringRes == 0) {
            throw IllegalArgumentException(String.format("The 'R.string.%s' value it's not defined in your project's resources file.", resName))
        }
        return context.getString(stringRes)
    }


}
