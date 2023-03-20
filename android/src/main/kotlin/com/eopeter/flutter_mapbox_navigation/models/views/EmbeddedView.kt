package com.eopeter.flutter_mapbox_navigation.models.views

import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.TextView
import com.eopeter.flutter_mapbox_navigation.FlutterMapboxNavigationPlugin
import com.eopeter.flutter_mapbox_navigation.utilities.PluginUtilities
import com.mapbox.navigation.dropin.NavigationView
import io.flutter.plugin.platform.PlatformView

internal class EmbeddedView(context: Context, id: Int, creationParams: Map<String?, Any?>?) :
    PlatformView {

    private val navigationView: NavigationView

    override fun getView(): View {
        return navigationView
    }

    override fun dispose() {}

    init {
        val accessToken = PluginUtilities.getResourceFromContext(context, "mapbox_access_token")
        navigationView = NavigationView(context, null, accessToken)
    }
}