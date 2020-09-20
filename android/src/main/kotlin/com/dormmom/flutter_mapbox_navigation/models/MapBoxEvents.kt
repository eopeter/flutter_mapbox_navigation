package com.dormmom.flutter_mapbox_navigation.models

enum class MapBoxEvents(val value: String) {
    MAP_READY("map_ready"),
    ROUTE_BUILDING("route_building"),
    ROUTE_BUILT("route_built"),
    ROUTE_BUILD_FAILED("route_build_failed"),
    PROGRESS_CHANGE("progress_change"),
    USER_OFF_ROUTE("user_off_route"),
    MILESTONE_EVENT("milestone_event"),
    NAVIGATION_RUNNING("navigation_running"),
    NAVIGATION_CANCELLED("navigation_cancelled"),
    NAVIGATION_FINISHED("navigation_finished"),
    FASTER_ROUTE_FOUND("faster_route_found"),
    SPEECH_ANNOUNCEMENT("speech_announcement"),
    BANNER_INSTRUCTION("banner_instruction"),
    ON_ARRIVAL("on_arrival"),
    FAILED_TO_REROUTE("failed_to_reroute"),
    REROUTE_ALONG("reroute_along"),
}