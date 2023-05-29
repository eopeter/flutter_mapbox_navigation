package com.eopeter.fluttermapboxnavigation.models

import com.google.gson.JsonObject
import com.mapbox.api.directions.v5.models.LegStep

class MapBoxRouteStep(private val step: LegStep) {

    private val instructions: String = "" //step.bannerInstructions()[0]?.primary().toString()
    private val distance: Double = step.distance()
    private val expectedTravelTime: Double = step.duration()

    fun toJsonObject(): JsonObject {
        val json = JsonObject()

        json.addProperty("instructions", instructions)
        json.addProperty("distance", distance)
        json.addProperty("expectedTravelTime", expectedTravelTime)

        return json
    }
}
