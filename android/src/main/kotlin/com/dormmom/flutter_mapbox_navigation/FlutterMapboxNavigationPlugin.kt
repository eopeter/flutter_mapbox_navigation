package com.dormmom.flutter_mapbox_navigation

import android.Manifest
import android.app.Activity
import android.content.Context
import android.content.pm.PackageManager
import android.os.Build
import androidx.annotation.NonNull;
import com.dormmom.flutter_mapbox_navigation.activity.NavigationLauncher
import com.dormmom.flutter_mapbox_navigation.factory.MapViewFactory
import com.mapbox.api.directions.v5.DirectionsCriteria
import com.mapbox.api.directions.v5.models.DirectionsRoute
import com.mapbox.geojson.Point

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.flutter.plugin.platform.PlatformViewRegistry
import java.util.*

/** FlutterMapboxNavigationPlugin */
public class FlutterMapboxNavigationPlugin: FlutterPlugin, MethodCallHandler, EventChannel.StreamHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var progressEventChannel: EventChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    val messenger = flutterPluginBinding.binaryMessenger
    channel = MethodChannel(messenger, "flutter_mapbox_navigation")
    channel.setMethodCallHandler(this)

    progressEventChannel = EventChannel(messenger, "flutter_mapbox_navigation/events")
    progressEventChannel.setStreamHandler(this)

    platformViewRegistry = flutterPluginBinding.platformViewRegistry
    binaryMessenger = messenger;


  }

  // This static function is optional and equivalent to onAttachedToEngine. It supports the old
  // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
  // plugin registration via this function while apps migrate to use the new Android APIs
  // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
  //
  // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
  // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
  // depending on the user's project. onAttachedToEngine or registerWith must both be defined
  // in the same class.
  companion object {
    private var currentActivity: Activity? = null
    private lateinit var currentContext: Context
    var eventSink:EventChannel.EventSink? = null

    var PERMISSION_REQUEST_CODE: Int = 367

    lateinit var routes : List<DirectionsRoute>
    private var currentRoute: DirectionsRoute? = null
    val wayPoints: MutableList<Point> = mutableListOf()

    var showAlternateRoutes: Boolean = true
    var allowsUTurnsAtWayPoints: Boolean = false
    var navigationMode =  DirectionsCriteria.PROFILE_DRIVING_TRAFFIC
    var simulateRoute = false
    var mapStyleUrlDay: String? = null
    var mapStyleUrlNight: String? = null
    var navigationLanguage = Locale("en")
    var navigationVoiceUnits = DirectionsCriteria.IMPERIAL
    var zoom = 15.0
    var bearing = 0.0
    var tilt = 0.0
    var distanceRemaining: Double? = null
    var durationRemaining: Double? = null
    var platformViewRegistry: PlatformViewRegistry? = null
    var binaryMessenger: BinaryMessenger? = null

    @JvmStatic
    var view_name = "FlutterMapboxNavigationView"

    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val messenger = registrar.messenger()
      val instance = FlutterMapboxNavigationPlugin()

      val channel = MethodChannel(messenger, "flutter_mapbox_navigation")
      channel.setMethodCallHandler(instance)

      val progressEventChannel = EventChannel(messenger, "flutter_mapbox_navigation/events")
      progressEventChannel.setStreamHandler(instance)

      platformViewRegistry = registrar.platformViewRegistry()
      binaryMessenger = messenger;

    }
  }
  
  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when(call.method)
    {
      "getPlatformVersion" -> {
        result.success("Android ${android.os.Build.VERSION.RELEASE}")
      }
      "getDistanceRemaining" -> {
        result.success(distanceRemaining);
      }
      "getDurationRemaining" -> {
        result.success(durationRemaining);
      }
      "startNavigation" -> {
        checkPermissionAndBeginNavigation(call, result)
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
  
  private fun downloadRegionForOfflineRouting(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result){
    result.error("TODO", "Not Implemented in Android","will implement soon")
  }
  
  private fun checkPermissionAndBeginNavigation(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result)
  {
    val arguments = call.arguments as? Map<String, Any>

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

    val alternateRoutes = arguments?.get("alternatives") as? Boolean
    if(alternateRoutes != null){
      showAlternateRoutes = alternateRoutes
    }

    val simulated = arguments?.get("simulateRoute") as? Boolean
    if (simulated != null) {
      simulateRoute = simulated
    }

    val allowsUTurns = arguments?.get("allowsUTurnsAtWayPoints") as? Boolean
    if(allowsUTurns != null){
      allowsUTurnsAtWayPoints = allowsUTurns
    }

    val language = arguments?.get("language") as? String
    if(language != null)
      navigationLanguage = Locale(language)

    val units = arguments?.get("units") as? String

    if(units != null)
    {
      if(units == "imperial")
        navigationVoiceUnits = DirectionsCriteria.IMPERIAL
      else if(units == "metric")
        navigationVoiceUnits = DirectionsCriteria.METRIC
    }

    mapStyleUrlDay = arguments?.get("mapStyleUrlDay") as? String
    mapStyleUrlNight = arguments?.get("mapStyleUrlNight") as? String

    wayPoints.clear()

    val points = arguments?.get("wayPoints") as HashMap<Int, Any>
    for (item in points)
    {
      val point = item.value as HashMap<*, *>
      val latitude = point["Latitude"] as Double
      val longitude = point["Longitude"] as Double
      wayPoints.add(Point.fromLngLat(longitude, latitude))
    }

    checkPermissionAndBeginNavigation(wayPoints)

  }

  private fun checkPermissionAndBeginNavigation(wayPoints: List<Point>)
  {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
      val haspermission = currentActivity?.checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION)
      if(haspermission != PackageManager.PERMISSION_GRANTED) {
        //_activity.onRequestPermissionsResult((a,b,c) => onRequestPermissionsResult)
        currentActivity?.requestPermissions(arrayOf(Manifest.permission.ACCESS_FINE_LOCATION), PERMISSION_REQUEST_CODE)
        beginNavigation(wayPoints)
      }
      else
        beginNavigation(wayPoints)
    }
    else
      beginNavigation(wayPoints)
  }

  private fun beginNavigation(wayPoints: List<Point>)
  {
      NavigationLauncher.startNavigation(currentActivity, wayPoints, null);
  }


  override fun onListen(args: Any?, events: EventChannel.EventSink?) {
    eventSink = events;
  }

  override fun onCancel(args: Any?) {
    eventSink = null;
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {

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

    if(platformViewRegistry != null && binaryMessenger != null && currentActivity != null)
      platformViewRegistry?.registerViewFactory(view_name, MapViewFactory(binaryMessenger!!, currentActivity!!))

  }

  override fun onDetachedFromActivityForConfigChanges() {
    //To change body of created functions use File | Settings | File Templates.
  }

  fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
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
