package com.dormmom.flutter_mapbox_navigation.utilities;

import android.content.Context
import android.graphics.BitmapFactory
import android.net.ConnectivityManager
import android.net.NetworkCapabilities
import android.os.Build
import androidx.annotation.NonNull
import com.dormmom.flutter_mapbox_navigation.FlutterMapboxNavigationPlugin
import com.dormmom.flutter_mapbox_navigation.R
import com.dormmom.flutter_mapbox_navigation.models.MapBoxEvents
import com.dormmom.flutter_mapbox_navigation.models.MapBoxRouteProgressEvent
import com.google.gson.Gson
import com.mapbox.mapboxsdk.geometry.LatLng
import com.mapbox.mapboxsdk.maps.Style
import com.mapbox.mapboxsdk.style.layers.PropertyFactory
import com.mapbox.mapboxsdk.style.layers.SymbolLayer
import com.mapbox.mapboxsdk.style.sources.GeoJsonSource
import io.flutter.plugin.common.MethodCall
import java.io.ByteArrayInputStream
import java.io.InputStream
import java.util.*

class PluginUtilities {
    companion object {
        @JvmStatic
        fun getResourceFromContext(@NonNull context: Context, resName: String): String {
            val stringRes = context.resources.getIdentifier(resName, "string", context.packageName)
            if (stringRes == 0) {
                throw IllegalArgumentException(String.format("The 'R.string.%s' value it's not defined in your project's resources file.", resName))
            }
            return context.getString(stringRes)
        }

        fun getRandomLatLng(bbox: DoubleArray): LatLng {
            val random = Random()

            val randomLat: Double = bbox.get(1) + (bbox.get(3) - bbox.get(1)) * random.nextDouble()
            val randomLon: Double = bbox.get(0) + (bbox.get(2) - bbox.get(0)) * random.nextDouble()

            val latLng = LatLng(randomLat, randomLon)
            return latLng
        }

        fun sendEvent(event: MapBoxRouteProgressEvent) {
            val dataString = Gson().toJson(event)
            val jsonString = "{" +
                    "  \"eventType\": \"${MapBoxEvents.PROGRESS_CHANGE.value}\"," +
                    "  \"data\": $dataString" +
                    "}"
            FlutterMapboxNavigationPlugin.eventSink?.success(dataString)
        }

        fun sendEvent(event: MapBoxEvents, data: String = "") {
            val jsonString = if (MapBoxEvents.MILESTONE_EVENT == event || event == MapBoxEvents.USER_OFF_ROUTE) "{" +
                    "  \"eventType\": \"${event.value}\"," +
                    "  \"data\": $data" +
                    "}" else "{" +
                    "  \"eventType\": \"${event.value}\"," +
                    "  \"data\": \"$data\"" +
                    "}";
            FlutterMapboxNavigationPlugin.eventSink?.success(jsonString)
        }

        fun getListOfStringById(key: String, call: MethodCall): ArrayList<String> {
            val logTypesList = arrayListOf<String>()
            call.argument<String>(key)?.let {
                it.split(",").forEach {
                    logTypesList.add(it)
                }
                return logTypesList
            }
            return arrayListOf()
        }

        fun getStringValueById(key: String, call: MethodCall): String {
            call.argument<String>(key)?.let {
                return it
            }
            return ""
        }

        fun getIntValueById(key: String, call: MethodCall): Int? {
            call.argument<Int>(key)?.let {
                return it
            }
            return null
        }

        fun getDoubleValueById(key: String, call: MethodCall): Double? {
            call.argument<Double>(key)?.let {
                return it
            }
            return null
        }

        fun getBoolValueById(key: String, call: MethodCall): Boolean {
            call.argument<Boolean>(key)?.let {
                return it
            }
            return false
        }

        fun getInputStreamValueById(key: String, call: MethodCall): InputStream? {
            call.argument<ByteArray>(key)?.let {
                return ByteArrayInputStream(it)
            }
            return null
        }


        fun getLocaleFromCode(locale: String): Locale {
            val locales: Array<Locale> = Locale.getAvailableLocales()

            val filtered = locales.filter {
                it.country.equals(locale, ignoreCase = true)
            }

            return if (filtered.isNotEmpty()) {
                filtered.first()
            } else {
                Locale.ENGLISH
            }
        }

        fun isNetworkAvailable(context: Context): Boolean {
            val connectivityManager = context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                val nw = connectivityManager.activeNetwork ?: return false
                val actNw = connectivityManager.getNetworkCapabilities(nw) ?: return false
                return when {
                    actNw.hasTransport(NetworkCapabilities.TRANSPORT_WIFI) -> true
                    actNw.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR) -> true
                    //for other device how are able to connect with Ethernet
                    actNw.hasTransport(NetworkCapabilities.TRANSPORT_ETHERNET) -> true
                    //for check internet over Bluetooth
                    actNw.hasTransport(NetworkCapabilities.TRANSPORT_BLUETOOTH) -> true
                    else -> false
                }
            } else {
                val nwInfo = connectivityManager.activeNetworkInfo ?: return false
                return nwInfo.isConnected
            }
        }
    }


}