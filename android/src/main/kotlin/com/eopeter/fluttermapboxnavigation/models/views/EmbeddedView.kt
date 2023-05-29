package com.eopeter.fluttermapboxnavigation.models.views

import android.content.Context
import android.view.View
import com.eopeter.fluttermapboxnavigation.utilities.PluginUtilities
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