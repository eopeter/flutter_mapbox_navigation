package com.eopeter.flutter_mapbox_navigation

import android.Manifest
import android.app.Activity
import android.content.Context
import android.content.pm.PackageManager
import android.os.Build
import com.eopeter.flutter_mapbox_navigation.activity.NavigationLauncher
import com.eopeter.flutter_mapbox_navigation.factory.EmbeddedNavigationViewFactory
import com.eopeter.flutter_mapbox_navigation.models.Waypoint

import com.mapbox.api.directions.v5.DirectionsCriteria
import com.mapbox.api.directions.v5.models.DirectionsRoute

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.platform.PlatformViewRegistry
import java.util.*

/** FlutterMapboxNavigationPlugin */
public class FlutterMapboxNavigationPlugin : FlutterPlugin, MethodCallHandler,
    EventChannel.StreamHandler, ActivityAware {

    private lateinit var channel: MethodChannel
    private lateinit var progressEventChannel: EventChannel
    private var currentActivity: Activity? = null
    private lateinit var currentContext: Context

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        val messenger = binding.binaryMessenger
        channel = MethodChannel(messenger, "flutter_mapbox_navigation")
        channel.setMethodCallHandler(this)

        progressEventChannel = EventChannel(messenger, "flutter_mapbox_navigation/events")
        progressEventChannel.setStreamHandler(this)

        platformViewRegistry = binding.platformViewRegistry
        binaryMessenger = messenger;


    }

    companion object {

        var eventSink: EventChannel.EventSink? = null

        var PERMISSION_REQUEST_CODE: Int = 367

        lateinit var routes: List<DirectionsRoute>
        private var currentRoute: DirectionsRoute? = null
        val wayPoints: MutableList<Waypoint> = mutableListOf()

        var showAlternateRoutes: Boolean = true
        val allowsClickToSetDestination: Boolean = false
        var allowsUTurnsAtWayPoints: Boolean = false
        var navigationMode = DirectionsCriteria.PROFILE_DRIVING_TRAFFIC
        var simulateRoute = false
        var enableFreeDriveMode = false
        var mapStyleUrlDay: String? = null
        var mapStyleUrlNight: String? = null
        var navigationLanguage = "en"
        var navigationVoiceUnits = DirectionsCriteria.IMPERIAL
        var zoom = 15.0
        var bearing = 0.0
        var tilt = 0.0
        var distanceRemaining: Float? = null
        var durationRemaining: Double? = null
        var platformViewRegistry: PlatformViewRegistry? = null
        var binaryMessenger: BinaryMessenger? = null

        var viewId = "FlutterMapboxNavigationView"
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "getPlatformVersion" -> {
                result.success("Android ${Build.VERSION.RELEASE}")
            }
            "getDistanceRemaining" -> {
                result.success(distanceRemaining);
            }
            "getDurationRemaining" -> {
                result.success(durationRemaining);
            }
            "startFreeDrive" -> {
                enableFreeDriveMode = true
                checkPermissionAndBeginNavigation(call)
            }
            "startNavigation" -> {
                enableFreeDriveMode = false
                checkPermissionAndBeginNavigation(call)
            }
            "addWayPoints" -> {
                addWayPointsToNavigation(call, result)
            }
            "finishNavigation" -> {
                NavigationLauncher.stopNavigation(currentActivity)
            }
            "enableOfflineRouting" -> {
                downloadRegionForOfflineRouting(call, result)
            }
            else -> result.notImplemented()
        }
    }

    private fun downloadRegionForOfflineRouting(
        call: MethodCall,
        result: MethodChannel.Result
    ) {
        result.error("TODO", "Not Implemented in Android", "will implement soon")
    }

    private fun checkPermissionAndBeginNavigation(
        call: MethodCall
    ) {
        val arguments = call.arguments as? Map<String, Any>

        val navMode = arguments?.get("mode") as? String
        if (navMode != null) {
            when (navMode) {
                "walking" -> navigationMode = DirectionsCriteria.PROFILE_WALKING
                "cycling" -> navigationMode = DirectionsCriteria.PROFILE_CYCLING
                "driving" -> navigationMode = DirectionsCriteria.PROFILE_DRIVING
            };
        }

        val alternateRoutes = arguments?.get("alternatives") as? Boolean
        if (alternateRoutes != null) {
            showAlternateRoutes = alternateRoutes
        }

        val simulated = arguments?.get("simulateRoute") as? Boolean
        if (simulated != null) {
            simulateRoute = simulated
        }

        val allowsUTurns = arguments?.get("allowsUTurnsAtWayPoints") as? Boolean
        if (allowsUTurns != null) {
            allowsUTurnsAtWayPoints = allowsUTurns
        }

        val language = arguments?.get("language") as? String
        if (language != null)
            navigationLanguage = language

        val units = arguments?.get("units") as? String

        if (units != null) {
            if (units == "imperial")
                navigationVoiceUnits = DirectionsCriteria.IMPERIAL
            else if (units == "metric")
                navigationVoiceUnits = DirectionsCriteria.METRIC
        }

        mapStyleUrlDay = arguments?.get("mapStyleUrlDay") as? String
        mapStyleUrlNight = arguments?.get("mapStyleUrlNight") as? String

        wayPoints.clear()

        if (enableFreeDriveMode) {
            checkPermissionAndBeginNavigation(wayPoints)
            return
        }

        val points = arguments?.get("wayPoints") as HashMap<Int, Any>
        for (item in points) {
            val point = item.value as HashMap<*, *>
            val name = point["Name"] as String
            val latitude = point["Latitude"] as Double
            val longitude = point["Longitude"] as Double
            val isSilent = point["IsSilent"] as Boolean
            wayPoints.add(Waypoint(name, longitude, latitude, isSilent))
        }
        checkPermissionAndBeginNavigation(wayPoints)

    }

    private fun checkPermissionAndBeginNavigation(wayPoints: List<Waypoint>) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            val haspermission =
                currentActivity?.checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION)
            if (haspermission != PackageManager.PERMISSION_GRANTED) {
                //_activity.onRequestPermissionsResult((a,b,c) => onRequestPermissionsResult)
                currentActivity?.requestPermissions(
                    arrayOf(Manifest.permission.ACCESS_FINE_LOCATION),
                    PERMISSION_REQUEST_CODE
                )
                beginNavigation(wayPoints)
            } else
                beginNavigation(wayPoints)
        } else
            beginNavigation(wayPoints)
    }

    private fun beginNavigation(wayPoints: List<Waypoint>) {
        NavigationLauncher.startNavigation(currentActivity, wayPoints);
    }

    private fun addWayPointsToNavigation(
        call: MethodCall,
        result: MethodChannel.Result
    ) {
        val arguments = call.arguments as? Map<String, Any>
        val points = arguments?.get("wayPoints") as HashMap<Int, Any>

        for (item in points) {
            val point = item.value as HashMap<*, *>
            val name = point["Name"] as String
            val latitude = point["Latitude"] as Double
            val longitude = point["Longitude"] as Double
            val isSilent = point["IsSilent"] as Boolean
            wayPoints.add(Waypoint(name, latitude, longitude, isSilent))
        }
        NavigationLauncher.addWayPoints(currentActivity, wayPoints);
    }

    override fun onListen(args: Any?, events: EventChannel.EventSink?) {
        eventSink = events;
    }

    override fun onCancel(args: Any?) {
        eventSink = null;
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {

        currentActivity = null
        channel.setMethodCallHandler(null)
        progressEventChannel.setStreamHandler(null)

    }

    override fun onDetachedFromActivity() {
        currentActivity!!.finish()
        currentActivity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {

        currentActivity = binding.activity

    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {

        currentActivity = binding.activity
        currentContext = binding.activity.applicationContext

        if (platformViewRegistry != null && binaryMessenger != null && currentActivity != null) {
            platformViewRegistry?.registerViewFactory(
                viewId,
                EmbeddedNavigationViewFactory(binaryMessenger!!, currentActivity!!)
            )
        }
    }

    override fun onDetachedFromActivityForConfigChanges() {
        //To change body of created functions use File | Settings | File Templates.
    }

    fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        when (requestCode) {
            367 -> {

                for (permission in permissions) {
                    if (permission == Manifest.permission.ACCESS_FINE_LOCATION) {
                        val haspermission = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                            currentActivity?.checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION)
                        } else {
                            TODO("VERSION.SDK_INT < M")
                        }
                        if (haspermission == PackageManager.PERMISSION_GRANTED) {
                            if (wayPoints.count() > 0)
                                beginNavigation(wayPoints)
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

private const val MAPBOX_ACCESS_TOKEN_PLACEHOLDER = "YOUR_MAPBOX_ACCESS_TOKEN_GOES_HERE"