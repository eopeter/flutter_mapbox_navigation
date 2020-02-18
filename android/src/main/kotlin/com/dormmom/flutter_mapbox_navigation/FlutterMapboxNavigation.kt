package com.dormmom.flutter_mapbox_navigation

import android.Manifest
import android.app.Activity
import android.content.Context
import android.content.pm.PackageManager
import android.os.Build
import android.content.Intent
import androidx.annotation.NonNull
import com.mapbox.api.directions.v5.DirectionsCriteria
import com.mapbox.api.directions.v5.models.DirectionsResponse
import com.mapbox.api.directions.v5.models.DirectionsRoute
import com.mapbox.geojson.Point
import com.mapbox.mapboxsdk.Mapbox
import com.mapbox.services.android.navigation.ui.v5.NavigationLauncher
import com.mapbox.services.android.navigation.ui.v5.NavigationLauncherOptions
import com.mapbox.services.android.navigation.v5.navigation.NavigationRoute
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry
import okhttp3.Route
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import java.util.*

class FlutterMapboxNavigation : MethodChannel.MethodCallHandler, EventChannel.StreamHandler
{
    

    var _activity: Activity
    var _context: Context

    var _origin: Point? = null
    var _destination: Point? = null
    var _navigationMode: String? =  "drivingWithTraffic"
    var _simulateRoute: Boolean = false
    var _language: String? = null
    var _units: String? = null

    var _distanceRemaining: Double? = null
    var _durationRemaining: Double? = null

    var PERMISSION_REQUEST_CODE: Int = 367

    lateinit var routes : List<DirectionsRoute>
    val EXTRA_ROUTES = "com.example.myfirstapp.MESSAGE"

    var _eventSink:EventChannel.EventSink? = null

    
    constructor(context: Context, activity: Activity) {
        this._context = context
        this._activity = activity;
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {

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
            val originLatitude = arguments?.get("originLatitude") as? Double
            val originLongitude = arguments?.get("originLongitude") as? Double

            val destinationName = arguments?.get("destinationName") as? String
            val destinationLatitude = arguments?.get("destinationLatitude") as? Double
            val destinationLongitude = arguments?.get("destinationLongitude") as? Double

            val navigationMode = arguments?.get("mode") as? String
            if(navigationMode != null)
                _navigationMode = navigationMode;

            val simulateRoute = arguments?.get("simulateRoute") as Boolean
            _simulateRoute = simulateRoute;

            var language = arguments?.get("language") as? String
            _language = language

            var units = arguments?.get("units") as? String
            _units = units


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
                        startNavigation(origin, destination, simulateRoute, language, units)
                    }
                    else
                        startNavigation(origin, destination, simulateRoute, language, units)
                }
                else
                    startNavigation(origin, destination, simulateRoute, language, units)


            }
        }
        else {
            result.notImplemented()
        }
    }

    fun startNavigation(origin: Point, destination: Point, simulateRoute: Boolean, language: String?, units: String?)
    {
        var navigationMode = DirectionsCriteria.PROFILE_DRIVING_TRAFFIC;
        if(_navigationMode == "walking")
            navigationMode = DirectionsCriteria.PROFILE_WALKING;
        else if(_navigationMode == "cycling")
            navigationMode = DirectionsCriteria.PROFILE_CYCLING;
        else if(_navigationMode == "driving")
            navigationMode = DirectionsCriteria.PROFILE_DRIVING;

        var accessToken = PluginUtilities.getResourceFromContext(_context, "mapbox_access_token")
        Mapbox.getInstance(_context, accessToken)

        /*
        var navViewOptions = NavigationViewOptions.builder();

        navViewOptions.progressChangeListener { location, routeProgress ->
            var currentState = routeProgress?.currentState()
            _distanceRemaining =  routeProgress?.distanceRemaining();
            _durationRemaining = routeProgress?.durationRemaining();

            _eventSink?.success(currentState == RouteProgressState.ROUTE_ARRIVED);
        }
         */
        
        var locale: Locale? = null
        if(language != null)
            locale =  Locale(language) 

        var voiceUnits: String? = null
        if(units != null)
        {
            if(units == "imperial")
                voiceUnits = DirectionsCriteria.IMPERIAL
            else if(units == "metric")
                voiceUnits = DirectionsCriteria.METRIC
        }
        var opt = NavigationRoute.builder(_context)
                .accessToken(accessToken)
                .origin(origin)
                .destination(destination)
                .profile(navigationMode)
                .language(locale)
                .voiceUnits(voiceUnits)
                .build()
                .getRoute(object : Callback<DirectionsResponse> {
                    override fun onResponse(call: Call<DirectionsResponse>, response: Response<DirectionsResponse>) {

                        if (response.body() != null) {
                            if (!response.body()!!.routes().isEmpty()) {
                                // Route fetched from NavigationRoute
                                routes = response.body()!!.routes()
/*
                                var intent = Intent(_context, RouteMapActivity::class.java).apply{
                                    putExtra(EXTRA_ROUTES, "Route Count")
                                }

                                _activity.startActivity(intent)

                                return;
                                
 */

                                val route: DirectionsRoute = routes.get(0)

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
                                startNavigation(_origin!!, _destination!!, _simulateRoute, _language, _units)
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

    


}