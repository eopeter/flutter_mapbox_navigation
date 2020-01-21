package com.dormmom.flutter_mapbox_navigation

import android.content.Context
import androidx.annotation.NonNull
import com.mapbox.mapboxsdk.geometry.LatLng
import java.util.*

class PluginUtilities 
{
    companion object {
        @JvmStatic
        fun getResourceFromContext(@NonNull context: Context, resName: String): String {
            val stringRes = context.resources.getIdentifier(resName, "string", context.packageName)
            if (stringRes == 0) {
                throw IllegalArgumentException(String.format("The 'R.string.%s' value it's not defined in your project's resources file.", resName))
            }
            return context.getString(stringRes)
        }

        fun getRandomLatLng(bbox: DoubleArray) : LatLng
        {
            val random = Random()

            val randomLat: Double = bbox.get(1) + (bbox.get(3) - bbox.get(1)) * random.nextDouble()
            val randomLon: Double = bbox.get(0) + (bbox.get(2) - bbox.get(0)) * random.nextDouble()

            val latLng = LatLng(randomLat, randomLon)
            return latLng
        }
    }
}