package com.dormmom.flutter_mapbox_navigation


import android.app.Activity
import android.content.Context

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry.Registrar

class FlutterMapboxNavigationPlugin: FlutterPlugin, ActivityAware
{
    
    private var _methodChannel: MethodChannel? = null
    private var _eventChannel: EventChannel? = null
    private lateinit var _activity: Activity
    private lateinit var _context: Context

    companion object {
        @Suppress("unused")
        @JvmStatic
        fun registerWith(registrar: Registrar) {

            val instance = FlutterMapboxNavigationPlugin()
            instance.onAttachedToEngine(registrar.activeContext(), registrar.messenger())

        }
    }


    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {

        onAttachedToEngine(binding.applicationContext, binding.binaryMessenger)

    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {

        _methodChannel!!.setMethodCallHandler(null)
        _methodChannel = null
        _eventChannel!!.setStreamHandler(null)
        _eventChannel = null

    }


    private fun onAttachedToEngine(binding: Context, messenger: BinaryMessenger) {

        _context = binding
        _methodChannel = MethodChannel(messenger, "flutter_mapbox_navigation")
        _eventChannel = EventChannel(messenger, "flutter_mapbox_navigation/arrival")

    }

    override fun onDetachedFromActivity() {
        _activity.finish()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        _activity = binding.activity
        val handler = FlutterMapboxNavigation(_context, _activity)
        _eventChannel!!.setStreamHandler(handler)
        _methodChannel!!.setMethodCallHandler(handler)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        //To change body of created functions use File | Settings | File Templates.
    }


}
