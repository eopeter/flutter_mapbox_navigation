package com.eopeter.flutter_mapbox_navigation.views

import android.app.Activity
import android.view.View
import android.content.Context

import com.eopeter.flutter_mapbox_navigation.TurnByTurn
import eopeter.flutter_mapbox_navigation.databinding.NavigationActivityBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView


class EmbeddedNavigationMapView(context: Context, activity: Activity, binding: NavigationActivityBinding, binaryMessenger: BinaryMessenger, vId: Int, args: Any?, accessToken: String)
    : PlatformView, TurnByTurn(context, activity, binding, accessToken) {
    private val viewId: Int = vId
    private val messenger: BinaryMessenger = binaryMessenger

    override fun initFlutterChannelHandlers() {
        methodChannel = MethodChannel(messenger, "flutter_mapbox_navigation/${viewId}")
        eventChannel = EventChannel(messenger, "flutter_mapbox_navigation/${viewId}/events")
        super.initFlutterChannelHandlers()
    }

    override fun onFlutterViewAttached(flutterView: View) {
        super.onFlutterViewAttached(flutterView)
        initFlutterChannelHandlers()
        initNavigation()
    }
    override fun getView(): View {
        val view: View = binding.root;
        return view;
    }

    override fun dispose() {
        unregisterObservers();
        onDestroy();
    }

}