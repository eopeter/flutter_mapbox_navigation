package com.eopeter.fluttermapboxnavigation.factory

import android.app.Activity
import android.content.Context
import android.view.LayoutInflater
import com.eopeter.fluttermapboxnavigation.R
import com.eopeter.fluttermapboxnavigation.databinding.NavigationActivityBinding
import com.eopeter.fluttermapboxnavigation.models.views.EmbeddedNavigationMapView
import com.eopeter.fluttermapboxnavigation.utilities.PluginUtilities
import com.mapbox.navigation.dropin.NavigationView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class EmbeddedNavigationViewFactory(
    private val messenger: BinaryMessenger,
    private val activity: Activity
) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val inflater = LayoutInflater.from(context)
        val navigationView: NavigationView =
            inflater.inflate(R.layout.navigation_activity, null, false)
                .findViewById(R.id.navigationView)

        val accessToken = PluginUtilities.getResourceFromContext(context, "mapbox_access_token")
        val view = EmbeddedNavigationMapView(
            context,
            activity,
            navigationView,
            messenger,
            viewId,
            args,
            accessToken
        )

        view.initialize()

        activity.setTheme(R.style.Theme_AppCompat_NoActionBar)

        return view
    }
}
