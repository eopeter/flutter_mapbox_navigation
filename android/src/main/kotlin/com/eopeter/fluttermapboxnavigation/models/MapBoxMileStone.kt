package com.eopeter.fluttermapboxnavigation.models

data class MapBoxMileStone(
    var identifier: Int?,
    val distanceTraveled: Double?,
    var legIndex: Int?,
    var stepIndex: Int?
) {
    override fun toString(): String {
        return "{" +
                "  \"identifier\": \"$identifier\"," +
                "  \"distanceTraveled\": $distanceTraveled," +
                "  \"legIndex\": \"$legIndex\"," +
                "  \"stepIndex\": \"$stepIndex\"" +
                "}"
    }
}
