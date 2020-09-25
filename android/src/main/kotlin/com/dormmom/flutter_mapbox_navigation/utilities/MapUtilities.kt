package com.dormmom.flutter_mapbox_navigation.utilities

import android.annotation.SuppressLint
import android.content.Context
import android.location.Location
import com.dormmom.flutter_mapbox_navigation.factory.FlutterMapViewFactory
import com.dormmom.flutter_mapbox_navigation.models.MapBoxEvents
import com.mapbox.android.core.location.LocationEngine
import com.mapbox.android.core.location.LocationEngineCallback
import com.mapbox.android.core.location.LocationEngineResult
import com.mapbox.api.directions.v5.DirectionsCriteria
import com.mapbox.api.directions.v5.models.DirectionsResponse
import com.mapbox.api.directions.v5.models.DirectionsRoute
import com.mapbox.geojson.Point
import com.mapbox.mapboxsdk.Mapbox
import com.mapbox.mapboxsdk.geometry.LatLng
import com.mapbox.services.android.navigation.ui.v5.route.NavigationMapRoute
import com.mapbox.services.android.navigation.v5.navigation.NavigationConstants
import com.mapbox.services.android.navigation.v5.navigation.NavigationRoute
import com.mapbox.services.android.navigation.v5.routeprogress.RouteProgress
import com.mapbox.services.android.navigation.v5.utils.DistanceFormatter
import com.mapbox.services.android.navigation.v5.utils.time.TimeFormatter
import com.mapbox.turf.TurfConstants
import com.mapbox.turf.TurfMeasurement
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import timber.log.Timber
import java.util.*

object MapUtilities {

    private var destination: Point? = null
    private var waypoint: Point? = null
    private var locationEngine: LocationEngine? = null
    private var currentRoute: DirectionsRoute? = null
    private var navigationMapRoute: NavigationMapRoute? = null
    private var rightDirectionsCount = 0
    private var leftDirectionsCount = 0
    private var currentManeuver = ""

    private fun addDestination(point: LatLng) {
        if (destination == null) {
            destination = Point.fromLngLat(point.longitude, point.latitude)
        } else if (waypoint == null) {
            waypoint = Point.fromLngLat(point.longitude, point.latitude)
        }
    }


    @SuppressLint("MissingPermission")
    private fun calculateRoute(context: Context) {
        locationEngine?.getLastLocation(object : LocationEngineCallback<LocationEngineResult> {
            override fun onSuccess(result: LocationEngineResult?) {
                findRouteWith(result, context)
            }

            override fun onFailure(exception: Exception) {
                Timber.e(exception)
            }
        })
    }


    fun findRouteWith(result: LocationEngineResult?, context: Context) {
        result?.let {
            val userLocation = result.lastLocation
            if (userLocation == null) {
                Timber.d("calculateRoute: User location is null, therefore, origin can't be set.")
                return
            }
            destination?.let { destination ->
                val origin = Point.fromLngLat(userLocation.longitude, userLocation.latitude)
                if (TurfMeasurement.distance(origin, destination, TurfConstants.UNIT_METERS) < 50) {
                    return
                }
                val navigationRouteBuilder = NavigationRoute.builder(context)
                        .accessToken(Mapbox.getAccessToken()!!)
                navigationRouteBuilder.origin(origin)
                navigationRouteBuilder.destination(destination)
                if (waypoint != null) {
                    navigationRouteBuilder.addWaypoint(waypoint!!)
                }
                navigationRouteBuilder.enableRefresh(true)

                navigationRouteBuilder.build().getRoute(object : Callback<DirectionsResponse> {
                    override fun onResponse(call: Call<DirectionsResponse?>, response: Response<DirectionsResponse?>) {
                        Timber.d("Url: %s", call.request().url().toString())
                        if (response.body() != null) {
                            if (response.body()!!.routes().isNotEmpty()) {
                                currentRoute = response.body()!!.routes()[0]
                                navigationMapRoute?.addRoutes(response.body()!!.routes())
                            }
                        }
                    }

                    override fun onFailure(call: Call<DirectionsResponse?>, throwable: Throwable) {
                        Timber.e(throwable, "onFailure: navigation.getRoute()")
                    }
                })
            }
        }
    }

    fun computeHeading(from: LatLng, to: LatLng): Double {
        // Compute bearing/heading using Turf and return the value.
        return TurfMeasurement.bearing(
                Point.fromLngLat(from.latitude, from.longitude),
                Point.fromLngLat(to.latitude, to.longitude)
        )
    }

    fun doOnProgressChange(location: Location, routeProgress: RouteProgress, context: Context) {

        val formattedDistance = formatDistance(routeProgress.distanceTraveled(), context, FlutterMapViewFactory.navigationLanguage)
        val upComingStepBearingAfter = routeProgress.currentLegProgress()?.upComingStep?.maneuver()?.bearingAfter()
        val upComingStepBearingBefore = routeProgress.currentLegProgress()?.upComingStep?.maneuver()?.bearingBefore()
        val currentStepBearingAfter = routeProgress.currentStep?.maneuver()?.bearingAfter()
        val currentStepBearingBefore = routeProgress?.currentStep?.maneuver()?.bearingBefore()

/*
        val progressData = ProgressData(
                distance = routeProgress.directionsRoute?.distance(),
                duration = routeProgress.directionsRoute?.duration(),
                currentLatitude = location.latitude,
                currentLongitude = location.longitude,
                upcomingLatitude = routeProgress.upcomingStepPoints()?.first()?.latitude(),
                upcomingLongitude = routeProgress.upcomingStepPoints()?.first()?.longitude(),
                distanceTraveled = routeProgress.distanceTraveled(),
                currentLegDistanceTraveled = routeProgress.currentLegProgress?.distanceTraveled,
                currentLegDistanceRemaining = routeProgress.currentLegProgress?.distanceRemaining,
                legDistanceRemaining = routeProgress.legDistanceRemaining,
                legDurationRemaining = routeProgress.legDurationRemaining,
                stepDistanceRemaining = routeProgress.stepDistanceRemaining,
                voiceInstruction = routeProgress.voiceInstruction?.announcement,
                bannerInstruction = routeProgress.bannerInstruction?.primary?.text,
                currentStepInstruction = routeProgress.currentStep?.maneuver()?.instruction(),
                upComingVoiceInstruction = routeProgress.currentLegProgress?.upComingStep?.voiceInstructions()?.first()?.announcement(),
                upComingBannerInstruction = routeProgress.currentLegProgress?.upComingStep?.bannerInstructions()?.first()?.primary()?.text(),
                legIndex = routeProgress.legIndex,
                stepIndex = routeProgress.stepIndex,
                currentStepBearingAfter = currentStepBearingAfter,
                currentStepBearingBefore = currentStepBearingBefore,
                currentStepDrivingSide = routeProgress.currentLegProgress()?.currentStep()?.drivingSide(),
                currentStepExits = routeProgress.currentLegProgress()?.currentStep()?.exits(),
                currentStepDistance = routeProgress.currentLegProgress()?.currentStep()?.distance(),
                currentStepDuration = routeProgress.currentLegProgress()?.currentStep()?.duration(),
                currentStepName = routeProgress.currentLegProgress()?.currentStep()?.name(),
                currentStepManeuverType = routeProgress.currentStep?.maneuver()?.type(),
                currentDirection = getCurrentDirection(
                        currentStepBearingBefore,
                        currentStepBearingAfter,
                        routeProgress.currentStep?.maneuver()?.type()),
                upComingStepBearingAfter = upComingStepBearingAfter,
                upComingStepBearingBefore = upComingStepBearingBefore,
                upComingStepDrivingSide = routeProgress.currentLegProgress()?.upComingStep()?.drivingSide(),
                upComingStepExits = routeProgress.currentLegProgress()?.upComingStep()?.exits(),
                upComingStepDistance = routeProgress.currentLegProgress()?.upComingStep()?.distance(),
                upComingStepDuration = routeProgress.currentLegProgress()?.upComingStep()?.duration(),
                upComingStepName = routeProgress.currentLegProgress()?.upComingStep()?.name(),
                upComingStepManeuverType = routeProgress.currentLegProgress()?.upComingStep()?.maneuver()?.type(),
                upComingDirection = getUpComingDirection(
                        upComingStepBearingBefore,
                        upComingStepBearingAfter)
        )

        PluginUtilities.sendEvent(MapBoxEvents.PROGRESS_CHANGE, progressData.toString())

        if (FlutterMapViewFactory.debug)
            Timber.i(String.format("onProgressChange, %s, %s, %s", "Current Location: ${location.latitude},${location.longitude}",
                    "Distance Travelled: ${progressData.currentLegDistanceTraveled}",
                    "Distance Remaining: $formattedDistance"
            ))


 */
    }

    fun formatDistance(distance: Double?, context: Context, locale: Locale): String {
        val unitType = DirectionsCriteria.METRIC
        val roundingIncrement = NavigationConstants.ROUNDING_INCREMENT_TWENTY_FIVE
        val distanceFormatter = DistanceFormatter(context, locale.language, unitType, roundingIncrement)
        distance?.let {
            return distanceFormatter.formatDistance(distance).toString()
        } ?: return "$distance"
    }

    fun formatTime(routeDuration: Double?, context: Context): String {
        routeDuration?.let {
            return TimeFormatter.formatTimeRemaining(context, routeDuration).toString()
        } ?: return "$routeDuration"
    }

    private fun getCurrentDirection(bearingBefore: Double?, bearingAfter: Double?, currentStepManeuverType: String?): String {
        var lastCurrentDirection = ""

        currentStepManeuverType?.let {

            if (currentManeuver.isEmpty() || currentManeuver != it) {
                currentManeuver = currentStepManeuverType
                leftDirectionsCount = 0
                rightDirectionsCount = 0
            }

            bearingBefore?.let {
                bearingAfter?.let {
                    val isRight: Boolean = (bearingAfter + 540) % 360 - (bearingBefore + 540) % 360 > 0

                    if (isRight) {
                        lastCurrentDirection = if (rightDirectionsCount <= 2) {
                            "right"
                        } else {
                            "straight"
                        }
                        leftDirectionsCount = 0
                        rightDirectionsCount++
                    } else {
                        lastCurrentDirection = if (leftDirectionsCount <= 2) {
                            "left"
                        } else {
                            "straight"
                        }
                        rightDirectionsCount = 0
                        leftDirectionsCount++
                    }
                }
            }
        }

        return lastCurrentDirection
    }

    private fun getUpComingDirection(bearingBefore: Double?, bearingAfter: Double?): String {
        var lastUpComingDirection = ""

        bearingBefore?.let {
            bearingAfter?.let {
                val isRight: Boolean = (bearingAfter + 540) % 360 - (bearingBefore + 540) % 360 > 0

                lastUpComingDirection = if (isRight) {
                    "right"
                } else {
                    "left"
                }
            }
        }

        return lastUpComingDirection
    }
}