package com.dormmom.flutter_mapbox_navigation.models

import android.location.Location
import com.mapbox.navigation.base.trip.model.RouteProgress

class MapBoxRouteProgressEvent(progress: RouteProgress) {
 
    var arrived: Boolean? = null
    private var distance: Float? = null
    private var duration: Double? = null
    private var distanceTraveled: Float? = null
    var currentLegDistanceTraveled: Float? = null
    var currentLegDistanceRemaining: Float? = null
    var currentStepInstruction: String? = null
    var legIndex: Int? = null
    var stepIndex: Int? = null
    var currentLeg: MapBoxRouteLeg? = null
    var priorLeg: MapBoxRouteLeg? = null
    lateinit var remainingLegs: List<MapBoxRouteLeg>

    init {
        //val util = RouteUtils()
        //arrived = util.isArrivalEvent(progress) && util.isLastLeg(progress)
        distance = progress.distanceRemaining
        duration = progress.durationRemaining
        distanceTraveled = progress.distanceTraveled
        legIndex = progress.currentLegProgress?.legIndex
        //stepIndex = progress.stepIndex
        currentLeg = progress.currentLegProgress?.routeLeg?.let { MapBoxRouteLeg(it) }!!
        currentStepInstruction = progress.bannerInstructions?.primary()?.text()
        currentLegDistanceTraveled = progress.currentLegProgress?.distanceTraveled
        currentLegDistanceRemaining = progress.currentLegProgress?.distanceRemaining
    }

}