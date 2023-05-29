package com.eopeter.fluttermapboxnavigation.models

import com.google.gson.JsonArray
import com.google.gson.JsonObject
import com.mapbox.api.directions.v5.models.RouteLeg

class MapBoxRouteLeg {

    val profileIdentifier: String? = null
    val name: String? = null
    private var distance: Double?
    private var expectedTravelTime: Double?
    val source: MapBoxLocation = MapBoxLocation("", 0.0, 0.0)
    val destination: MapBoxLocation = MapBoxLocation("", 0.0, 0.0)
    private var steps: MutableList<MapBoxRouteStep> = mutableListOf()

    constructor(leg: RouteLeg) {
        distance = leg.distance()
        expectedTravelTime = leg.duration()

        for (step in leg.steps()!!) {
            steps.add(MapBoxRouteStep(step))
        }
    }

    fun toJsonObject(): JsonObject {
        val json = JsonObject()

        if (distance != null) {
            json.addProperty("distance", distance)
        }

        if (expectedTravelTime != null) {
            json.addProperty("expectedTravelTime", expectedTravelTime)
        }

        if (steps.isNotEmpty()) {
            val ls = JsonArray()

            for (step in steps) {
                ls.add(step.toJsonObject())
            }

            json.add("steps", ls)
        }

        return json
    }
}
