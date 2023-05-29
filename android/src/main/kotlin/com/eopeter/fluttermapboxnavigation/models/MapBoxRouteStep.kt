package com.eopeter.fluttermapboxnavigation.models

import com.mapbox.api.directions.v5.models.LegStep
import com.google.gson.*

class MapBoxRouteStep(val step: LegStep) {

    val instructions: String = "" //step.bannerInstructions()[0]?.primary().toString()
    val distance: Double = step.distance()
    val expectedTravelTime: Double = step.duration()

    fun toJsonObject(): JsonObject {
        val json = JsonObject()

        json.addProperty("instructions", instructions)
        json.addProperty("distance", distance)
        json.addProperty("expectedTravelTime", expectedTravelTime)

        return json
    }
}