package com.dormmom.flutter_mapbox_navigation.factory

import android.app.Activity
import android.content.Context
import com.dormmom.flutter_mapbox_navigation.R
import com.dormmom.flutter_mapbox_navigation.databinding.ActivityNavigationBinding
import com.dormmom.flutter_mapbox_navigation.utilities.PluginUtilities
import com.dormmom.flutter_mapbox_navigation.views.EmbeddedNavigationMapView

import com.mapbox.mapboxsdk.Mapbox
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class EmbeddedNavigationViewFactory(private val messenger: BinaryMessenger, private val activity: Activity) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val binding = ActivityNavigationBinding.inflate(this.activity.layoutInflater)
        val view = EmbeddedNavigationMapView(context, activity, binding, messenger, viewId, args)
        activity.setTheme(R.style.Theme_AppCompat_NoActionBar)
        return view
    }
}