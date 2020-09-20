package com.dormmom.flutter_mapbox_navigation.models

import android.location.Location
import com.mapbox.services.android.navigation.v5.routeprogress.RouteProgress

class MapBoxRouteProgressEvent(progress: RouteProgress, location: Location) {
 
    val arrived: Boolean = false
    private var distance: Double? = null
    private var duration: Double? = null
    private var distanceTraveled: Double? = null
    val currentLegDistanceTraveled: Double? = null
    val currentLegDistanceRemaining: Double? = null
    var currentStepInstruction: String? = null
    var legIndex: Int? = null
    var stepIndex: Int? = null
    var currentLeg: MapBoxRouteLeg? = null
    var priorLeg: MapBoxRouteLeg? = null
    lateinit var remainingLegs: List<MapBoxRouteLeg>

    init {
        distance = progress.distanceRemaining()
        duration = progress.durationRemaining()
        distanceTraveled = progress.distanceTraveled()
        legIndex = progress.legIndex()
        stepIndex = progress.stepIndex
        currentLeg = progress.currentLeg()?.let { MapBoxRouteLeg(it) }!!
        currentStepInstruction = progress.bannerInstruction.toString()
    }

}