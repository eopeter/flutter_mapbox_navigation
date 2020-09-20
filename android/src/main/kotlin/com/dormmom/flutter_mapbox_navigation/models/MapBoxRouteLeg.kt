package com.dormmom.flutter_mapbox_navigation.models

import com.mapbox.api.directions.v5.models.RouteLeg

class MapBoxRouteLeg{

    val profileIdentifier: String? = null
    val name: String? = null
    var distance: Double?
    var expectedTravelTime: Double?
    val source: MapBoxLocation = MapBoxLocation("", 0.0, 0.0)
    val destination: MapBoxLocation = MapBoxLocation("", 0.0, 0.0)
    var steps: MutableList<MapBoxRouteStep> = mutableListOf()

    constructor(leg: RouteLeg)
    {
        distance = leg.distance()
        expectedTravelTime = leg.duration()

        for (step in leg.steps()!!)
        {
            steps.add(MapBoxRouteStep(step))
        }
    }

}