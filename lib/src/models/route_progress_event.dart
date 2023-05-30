// ignore_for_file: public_member_api_docs

import 'package:flutter_mapbox_navigation/src/helpers.dart';
import 'package:flutter_mapbox_navigation/src/models/route_leg.dart';

///This class contains all progress information at any given time
///during a navigation session. This progress includes information for the
///current route, leg and step the user is traversing along. With every new
///valid location update, a new route progress will be generated using
///the latest information.
class RouteProgressEvent {
  RouteProgressEvent({
    this.arrived,
    this.distance,
    this.duration,
    this.distanceTraveled,
    this.currentLegDistanceTraveled,
    this.currentLegDistanceRemaining,
    this.currentStepInstruction,
    this.currentLeg,
    this.priorLeg,
    this.remainingLegs,
    this.legIndex,
    this.stepIndex,
    this.isProgressEvent,
  });

  RouteProgressEvent.fromJson(Map<String, dynamic> json) {
    isProgressEvent = json['arrived'] != null;
    arrived = json['arrived'] == null ? false : json['arrived'] as bool?;
    distance = isNullOrZero(json['distance'] as num?)
        ? 0.0
        : (json['distance'] as num).toDouble();
    duration = isNullOrZero(json['duration'] as num?)
        ? 0.0
        : (json['duration'] as num).toDouble();
    distanceTraveled = isNullOrZero(json['distanceTraveled'] as num?)
        ? 0.0
        : (json['distanceTraveled'] as num).toDouble();
    currentLegDistanceTraveled =
        isNullOrZero(json['currentLegDistanceTraveled'] as num?)
            ? 0.0
            : (json['currentLegDistanceTraveled'] as num).toDouble();
    currentLegDistanceRemaining =
        isNullOrZero(json['currentLegDistanceRemaining'] as num?)
            ? 0.0
            : (json['currentLegDistanceRemaining'] as num).toDouble();
    currentStepInstruction = json['currentStepInstruction'] as String?;
    currentLeg = json['currentLeg'] == null
        ? null
        : RouteLeg.fromJson(json['currentLeg'] as Map<String, dynamic>);
    priorLeg = json['priorLeg'] == null
        ? null
        : RouteLeg.fromJson(json['priorLeg'] as Map<String, dynamic>);
    remainingLegs = (json['remainingLegs'] as List?)
        ?.map(
          (e) =>
              e == null ? null : RouteLeg.fromJson(e as Map<String, dynamic>),
        )
        .cast<RouteLeg>()
        .toList();
    legIndex = json['legIndex'] as int?;
    stepIndex = json['stepIndex'] as int?;
  }

  bool? arrived;
  double? distance;
  double? duration;
  double? distanceTraveled;
  double? currentLegDistanceTraveled;
  double? currentLegDistanceRemaining;
  String? currentStepInstruction;
  RouteLeg? currentLeg;
  RouteLeg? priorLeg;
  List<RouteLeg>? remainingLegs;
  int? legIndex;
  int? stepIndex;
  bool? isProgressEvent;
}
