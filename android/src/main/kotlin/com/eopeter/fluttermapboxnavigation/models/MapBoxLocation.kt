package com.eopeter.fluttermapboxnavigation.models

class MapBoxLocation(val name: String = "", private val latitude: Double?, private val longitude: Double?) {
    override fun toString(): String {
        return "{" +
                "  \"latitude\": $latitude," +
                "  \"longitude\": $longitude" +
                "}"
    }

}