package com.eopeter.fluttermapboxnavigation.models

import com.google.gson.annotations.SerializedName
import com.mapbox.geojson.Point
import java.io.Serializable

/**
 * A simple class to capture how most people will express a waypoint.
 */
data class Waypoint(
    @SerializedName("name")
    val name: String = "",
    @SerializedName("point")
    val point: Point,
    @SerializedName("isSilent")
    val isSilent: Boolean,
) : Serializable {
    constructor(point: Point, isSilent: Boolean) : this("", point, isSilent)
}
