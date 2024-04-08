package com.eopeter.fluttermapboxnavigation

import android.app.Activity
import android.content.Context
import com.eopeter.fluttermapboxnavigation.factory.EmbeddedNavigationViewFactory
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.platform.PlatformViewRegistry

/** FlutterMapboxNavigationPlugin */
class FlutterMapboxNavigationPlugin : FlutterPlugin,
    EventChannel.StreamHandler, ActivityAware {

    private lateinit var progressEventChannel: EventChannel
    private var currentActivity: Activity? = null
    private lateinit var currentContext: Context

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        val messenger = binding.binaryMessenger
        progressEventChannel = EventChannel(messenger, "flutter_mapbox_navigation/events")
        progressEventChannel.setStreamHandler(this)

        platformViewRegistry = binding.platformViewRegistry
        binaryMessenger = messenger
    }

    companion object {
        var eventSink: EventChannel.EventSink? = null
        var platformViewRegistry: PlatformViewRegistry? = null
        var binaryMessenger: BinaryMessenger? = null
        var viewId = "FlutterMapboxNavigationView"
    }


    override fun onListen(args: Any?, events: EventChannel.EventSink?) {
        eventSink = events
    }

    override fun onCancel(args: Any?) {
//        eventSink = null
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
//        currentActivity = null
//        progressEventChannel.setStreamHandler(null)
    }

    override fun onDetachedFromActivity() {
//        currentActivity!!.finish()
//        currentActivity = null
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
                EmbeddedNavigationViewFactory(binaryMessenger!!)
            )
        }
    }

    override fun onDetachedFromActivityForConfigChanges() {
        print("onDetachedFromActivityForConfigChanges")
        // To change body of created functions use File | Settings | File Templates.
    }

}

