package com.dormmom.flutter_mapbox_navigation.models

import android.location.Location
import com.mapbox.services.android.navigation.v5.routeprogress.RouteProgress
import com.mapbox.services.android.navigation.v5.utils.RouteUtils

class MapBoxRouteProgressEvent(progress: RouteProgress, location: Location) {
 
    var arrived: Boolean? = null
    private var distance: Double? = null
    private var duration: Double? = null
    private var distanceTraveled: Double? = null
    var currentLegDistanceTraveled: Double? = null
    var currentLegDistanceRemaining: Double? = null
    var currentStepInstruction: String? = null
    var legIndex: Int? = null
    var stepIndex: Int? = null
    var currentLeg: MapBoxRouteLeg? = null
    var priorLeg: MapBoxRouteLeg? = null
    lateinit var remainingLegs: List<MapBoxRouteLeg>

    init {
        val util = RouteUtils()
        arrived = util.isArrivalEvent(progress) && util.isLastLeg(progress)
        distance = progress.directionsRoute()?.distance()
        duration = progress.directionsRoute()?.duration()
        distanceTraveled = progress.distanceTraveled()
        legIndex = progress.legIndex()
        stepIndex = progress.stepIndex
        currentLeg = progress.currentLeg()?.let { MapBoxRouteLeg(it) }!!
        currentStepInstruction = progress.bannerInstruction?.primary?.text
        currentLegDistanceTraveled = progress.currentLegProgress?.distanceTraveled
        currentLegDistanceRemaining = progress.currentLegProgress?.distanceRemaining
    }

}