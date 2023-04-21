package com.eopeter.flutter_mapbox_navigation.models

import com.google.gson.annotations.SerializedName
import java.io.Serializable

/**
 * A simple class to capture how most people will express a waypoint.
 */
data class SimpleWaypoint (
    @SerializedName("name")
    val name: String = "",
    @SerializedName("longitude")
    val longitude: Double,
    @SerializedName("latitude")
    val latitude: Double,
    @SerializedName("isSilent")
    val isSilent: Boolean,
) : Serializable
