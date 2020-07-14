package com.dormmom.flutter_mapbox_navigation

import android.app.Activity
import android.content.Context
import androidx.annotation.NonNull;

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

/** FlutterMapboxNavigationPlugin */
public class FlutterMapboxNavigationPlugin: FlutterPlugin, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private var _methodChannel : MethodChannel? = null
    private var _eventChannel: EventChannel? = null
    private lateinit var _activity: Activity
    private lateinit var _context: Context

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
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val methodChannel = MethodChannel(registrar.messenger(), "flutter_mapbox_navigation")
            var eventChannel = EventChannel(registrar.messenger(), "flutter_mapbox_navigation/arrival")

            var handler = FlutterMapboxNavigation(registrar.activeContext(), registrar.activity())
            methodChannel.setMethodCallHandler(handler)
            eventChannel.setStreamHandler(handler)
            registrar.addActivityResultListener(handler);
        }
    }

    override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        var messenger = binding.binaryMessenger
        _context = binding.applicationContext
        _methodChannel = MethodChannel(messenger, "flutter_mapbox_navigation")
        _eventChannel = EventChannel(messenger, "flutter_mapbox_navigation/arrival")

    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {

        _methodChannel!!.setMethodCallHandler(null)
        _methodChannel = null
        _eventChannel!!.setStreamHandler(null)
        _eventChannel = null

    }

    override fun onDetachedFromActivity() {
        _activity.finish()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {

    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        _activity = binding.activity
        _context = binding.activity.applicationContext
        val handler = FlutterMapboxNavigation(_context, _activity)
        _eventChannel!!.setStreamHandler(handler)
        _methodChannel!!.setMethodCallHandler(handler)
        binding.addActivityResultListener(handler);
    }

    override fun onDetachedFromActivityForConfigChanges() {
        //To change body of created functions use File | Settings | File Templates.
    }
}
