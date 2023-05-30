// ignore_for_file: public_member_api_docs

import 'package:flutter_mapbox_navigation/src/helpers.dart';
import 'package:flutter_mapbox_navigation/src/models/route_step.dart';
import 'package:flutter_mapbox_navigation/src/models/way_point.dart';

///A RouteLeg object defines a single leg of a route between two waypoints.
///If the overall route has only two waypoints, it has a single
///RouteLeg object that covers the entire route.
///The route leg object includes information about the leg, such as its name,
///distance, and expected travel time.
///Depending on the criteria used to calculate the route, the route leg object
///may also include detailed turn-by-turn instructions.
class RouteLeg {
  RouteLeg(
    this.profileIdentifier,
    this.name,
    this.distance,
    this.expectedTravelTime,
    this.source,
    this.destination,
    this.steps,
  );

  RouteLeg.fromJson(Map<String, dynamic> json) {
    profileIdentifier = json['profileIdentifier'] as String?;
    name = json['name'] as String?;
    distance = isNullOrZero(json['distance'] as num?)
        ? 0.0
        : (json['distance'] as num).toDouble();
    expectedTravelTime = isNullOrZero(json['expectedTravelTime'] as num?)
        ? 0.0
        : (json['expectedTravelTime'] as num).toDouble();
    source = json['source'] == null
        ? null
        : WayPoint.fromJson(json['source'] as Map<String, dynamic>);
    destination = json['destination'] == null
        ? null
        : WayPoint.fromJson(json['destination'] as Map<String, dynamic>);
    steps = (json['steps'] as List?)
        ?.map(
          (e) =>
              e == null ? null : RouteStep.fromJson(e as Map<String, dynamic>),
        )
        .cast<RouteStep>()
        .toList();
  }

  String? profileIdentifier;
  String? name;
  double? distance;
  double? expectedTravelTime;
  WayPoint? source;
  WayPoint? destination;
  List<RouteStep>? steps;
}
