package com.eopeter.fluttermapboxnavigation.factory

import android.content.Context
import android.view.LayoutInflater
import com.eopeter.fluttermapboxnavigation.R
import com.eopeter.fluttermapboxnavigation.models.views.EmbeddedNavigationMapView
import com.eopeter.fluttermapboxnavigation.utilities.PluginUtilities
import com.mapbox.navigation.dropin.NavigationView
import com.mapbox.navigation.dropin.databinding.MapboxNavigationViewLayoutBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class EmbeddedNavigationViewFactory(
    private val messenger: BinaryMessenger,
) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    private var view: EmbeddedNavigationMapView? = null

    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        if (view == null) {
            val inflater = LayoutInflater.from(context)
            val navigationView: NavigationView =
                inflater.inflate(R.layout.navigation_activity, null, false)
                    .findViewById(R.id.navigationView)

            val accessToken = PluginUtilities.getResourceFromContext(context, "mapbox_access_token")
            view = EmbeddedNavigationMapView(
                context,
                navigationView,
                messenger,
                viewId,
                accessToken
            )
        }
        view!!.start(viewId)
        return view!!
    }
}
