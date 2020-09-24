package com.dormmom.flutter_mapbox_navigation_example

import android.os.Bundle
import androidx.annotation.NonNull
import com.dormmom.flutter_mapbox_navigation.FlutterMapboxNavigationPlugin
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    companion object {

        @JvmStatic
        var flutterEngineInstance: FlutterEngine? = null
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        flutterEngineInstance = flutterEngine
    }

    override fun onResume() {
        super.onResume()

        flutterEngineInstance?.let {
            FlutterMapboxNavigationPlugin.registerWith(it)
        }
    }

 
}
