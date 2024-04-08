package com.eopeter.fluttermapboxnavigation.utilities

import android.content.Context
import com.eopeter.fluttermapboxnavigation.FlutterMapboxNavigationPlugin
import com.eopeter.fluttermapboxnavigation.models.MapBoxEvents
import com.eopeter.fluttermapboxnavigation.models.MapBoxRouteProgressEvent

class PluginUtilities {
    companion object {
        @JvmStatic
        fun getResourceFromContext(context: Context?, resName: String): String {
            if (context == null) {
                throw IllegalArgumentException("null context")
            }
            val stringRes = context.resources.getIdentifier(resName, "string", context.packageName)
            if (stringRes == 0) {
                throw IllegalArgumentException(
                    String.format(
                        "The 'R.string.%s' value it's not defined in your project's resources file.",
                        resName
                    )
                )
            }
            return context.getString(stringRes)
        }

        fun sendEvent(event: MapBoxRouteProgressEvent) {
            val dataString = event.toJson()
            val jsonString = "{" +
                    "  \"eventType\": \"${MapBoxEvents.PROGRESS_CHANGE.value}\"," +
                    "  \"data\": $dataString" +
                    "}"
            FlutterMapboxNavigationPlugin.eventSink?.success(jsonString)
        }

        fun sendEvent(event: MapBoxEvents, data: String = "") {
            val jsonString =
                if (MapBoxEvents.MILESTONE_EVENT == event || event == MapBoxEvents.USER_OFF_ROUTE || event == MapBoxEvents.ROUTE_BUILT || event == MapBoxEvents.ON_MAP_TAP) "{" +
                        "  \"eventType\": \"${event.value}\"," +
                        "  \"data\": $data" +
                        "}" else "{" +
                        "  \"eventType\": \"${event.value}\"," +
                        "  \"data\": \"$data\"" +
                        "}"
            FlutterMapboxNavigationPlugin.eventSink?.success(jsonString)
        }
    }

}
