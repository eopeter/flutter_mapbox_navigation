package com.eopeter.flutter_mapbox_navigation.models

import com.mapbox.api.directions.v5.models.RouteLeg
import com.google.gson.*

class MapBoxRouteLeg {

    val profileIdentifier: String? = null
    val name: String? = null
    var distance: Double?
    var expectedTravelTime: Double?
    val source: MapBoxLocation = MapBoxLocation("", 0.0, 0.0)
    val destination: MapBoxLocation = MapBoxLocation("", 0.0, 0.0)
    var steps: MutableList<MapBoxRouteStep> = mutableListOf()

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
            json.addProperty("expectedTravelTime", expectedTravelTime);
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