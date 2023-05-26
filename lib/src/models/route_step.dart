// ignore_for_file: public_member_api_docs

import 'package:flutter_mapbox_navigation/src/helpers.dart';

///A RouteStep object represents a single distinct maneuver along a route and
///the approach to the next maneuver. The route step object corresponds to
///a single instruction the user must follow to complete a portion of the route.
///For example, a step might require the user to turn then follow a road.
class RouteStep {
  RouteStep(
    this.name,
    this.instructions,
    this.distance,
    this.expectedTravelTime,
  );

  RouteStep.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    instructions = json['instructions'] as String?;
    distance = isNullOrZero(json['distance'] as num?)
        ? 0.0
        : (json['distance'] as num).toDouble();
    expectedTravelTime = isNullOrZero(json['expectedTravelTime'] as num?)
        ? 0.0
        : (json['expectedTravelTime'] as num).toDouble();
  }

  String? name;
  String? instructions;
  double? distance;
  double? expectedTravelTime;
}
