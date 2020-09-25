package com.dormmom.flutter_mapbox_navigation.factory

import android.app.Activity
import android.content.Context
import com.dormmom.flutter_mapbox_navigation.utilities.PluginUtilities

import com.mapbox.mapboxsdk.Mapbox
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory


class MapViewFactory(private val messenger: BinaryMessenger, private val activity: Activity) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    
    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        var accessToken = PluginUtilities.getResourceFromContext(context!!, "mapbox_access_token")
        Mapbox.getInstance(context, accessToken)
        return FlutterMapViewFactory(context!!, messenger, accessToken, viewId, activity, args)
    }
}