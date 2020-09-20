package com.dormmom.flutter_mapbox_navigation.models

import com.mapbox.api.directions.v5.models.LegStep

class MapBoxRouteStep(val step: LegStep) {

    val instructions: String = "" //step.bannerInstructions()[0]?.primary().toString()
    val distance: Double = step.distance()
    val expectedTravelTime: Double = step.duration()

}