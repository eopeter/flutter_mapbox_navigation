package com.eopeter.flutter_mapbox_navigation.utilities

import com.mapbox.api.directions.v5.models.RouteOptions
import com.mapbox.geojson.Point

/**
 * Helper class that that does 2 things:
 * 1. It stores waypoints
 * 2. Converts the stored waypoints to the [RouteOptions] params
 */
class WaypointsSet {

    private val waypoints = mutableListOf<Waypoint>()

    val isEmpty get() = waypoints.isEmpty()

    fun addNamed(point: Point, name: String) {
        waypoints.add(Waypoint(point, WaypointType.Named(name)))
    }

    fun addRegular(point: Point) {
        waypoints.add(Waypoint(point, WaypointType.Regular))
    }

    fun addSilent(point: Point) {
        waypoints.add(Waypoint(point, WaypointType.Silent))
    }

    fun clear() {
        waypoints.clear()
    }

    /***
     * Silent waypoint isn't really a waypoint.
     * It's just a coordinate that used to build a route.
     * That's why to make a waypoint silent we exclude its index from the waypointsIndices.
     */
    fun waypointsIndices(): List<Int> {
        return waypoints.mapIndexedNotNull { index, _ ->
            if (waypoints.isSilentWaypoint(index)) {
                null
            } else index
        }
    }

    /**
     * Returns names for added waypoints.
     * Silent waypoint can't have a name unless they're converted to regular because of position.
     * First and last waypoint can't be silent.
     */
    fun waypointsNames(): List<String> = waypoints
        // silent waypoints can't have a name
        .filterIndexed { index, _ ->
            !waypoints.isSilentWaypoint(index)
        }
        .map {
            when (it.type) {
                is WaypointType.Named -> it.type.name
                else -> ""
            }
        }

    fun coordinatesList(): List<Point> {
        return waypoints.map { it.point }
    }

    private sealed class WaypointType {
        data class Named(val name: String) : WaypointType()
        object Regular : WaypointType()
        object Silent : WaypointType()
    }

    private data class Waypoint(val point: Point, val type: WaypointType)

    private fun List<Waypoint>.isSilentWaypoint(index: Int) =
        this[index].type == WaypointType.Silent && canWaypointBeSilent(index)

    // the first and the last waypoint can't be silent
    private fun List<Waypoint>.canWaypointBeSilent(index: Int): Boolean {
        val isLastWaypoint = index == this.size - 1
        val isFirstWaypoint = index == 0
        return !isLastWaypoint && !isFirstWaypoint
    }
}

