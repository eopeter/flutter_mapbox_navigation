import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'models/models.dart';


/// Turn-By-Turn Navigation Provider
class MapBoxNavigation {
  static final MethodChannel _methodChannel = const MethodChannel('flutter_mapbox_navigation');
  static final EventChannel _eventChannel = const EventChannel('flutter_mapbox_navigation/events');

  static final MapBoxNavigation _instance = MapBoxNavigation();
  static MapBoxNavigation get instance => _instance;

  late MapBoxOptions defaultOptions;
  late StreamSubscription<RouteEvent> _routeEventSubscription;

  ///Current Device OS Version
  Future<String> get platformVersion => _methodChannel
      .invokeMethod('getPlatformVersion')
      .then<String>((dynamic result) => result);

  ///Total distance remaining in meters along route.
  Future<double?> get distanceRemaining => _methodChannel
      .invokeMethod<double?>('getDistanceRemaining')
      .then<double?>((dynamic result) => result);

  ///Total seconds remaining on all legs.
  Future<double?> get durationRemaining => _methodChannel
      .invokeMethod<double?>('getDurationRemaining')
      .then<double?>((dynamic result) => result);

  ///Adds waypoints or stops to an on-going navigation
  ///
  /// [wayPoints] must not be null and have at least 1 item. The way points will
  /// be inserted after the currently navigating waypoint in the existing navigation
  Future addWayPoints({required wayPoints }) async {
    assert(wayPoints.length > 0);
    List<Map<String, Object?>> pointList = _getPointListFromWayPoints(wayPoints);
    var i = 0;
    var wayPointMap =
    Map.fromIterable(pointList, key: (e) => i++, value: (e) => e);
    var args = Map<String, dynamic>();
    args["wayPoints"] = wayPointMap;
    await _methodChannel
        .invokeMethod('addWayPoints', args)
        .then<String>((dynamic result) => result);
  }

  ///Show the Navigation View and Begins Direction Routing
  ///
  /// [wayPoints] must not be null and have at least 2 items. A collection of [WayPoint](longitude, latitude and name). Must be at least 2 or at most 25. Cannot use drivingWithTraffic mode if more than 3-waypoints.
  /// [options] options used to generate the route and used while navigating
  /// Begins to generate Route Progress
  ///
  Future startNavigation(
      {required List<WayPoint> wayPoints, MapBoxOptions? options}) async {
    assert(wayPoints.length > 1);
    if (options == null) {
      options = defaultOptions;
    }
    if (Platform.isIOS && wayPoints.length > 3) {
      assert(options.mode != MapBoxNavigationMode.drivingWithTraffic,
      "Error: Cannot use drivingWithTraffic Mode when you have more than 3 Stops");
    }

    List<Map<String, Object?>> pointList = _getPointListFromWayPoints(wayPoints);
    var i = 0;
    var wayPointMap =
    Map.fromIterable(pointList, key: (e) => i++, value: (e) => e);

    var args = options.toMap();
    args["wayPoints"] = wayPointMap;

    _routeEventSubscription = routeEventsListener!.listen(_onProgressData);
    await _methodChannel
        .invokeMethod('startNavigation', args)
        .then<String>((dynamic result) => result);
  }

  ///Ends Navigation and Closes the Navigation View
  Future<bool?> finishNavigation() async {
    var success = await _methodChannel.invokeMethod('finishNavigation', null);
    return success;
  }

  /// Will download the navigation engine and the user's region to allow offline routing
  Future<bool?> enableOfflineRouting() async {
    var success =
    await _methodChannel.invokeMethod('enableOfflineRouting', null);
    return success;
  }

  late ValueSetter<RouteEvent>? onRouteEvent;
  void _onProgressData(RouteEvent event) {
    if (onRouteEvent != null) onRouteEvent!(event);
    switch(event.eventType){
      case MapBoxEvent.navigation_finished:
        _routeEventSubscription.cancel();
        break;
      default:
        break;
    }
  }

  Stream<RouteEvent>? _routeEventsListener;

  Stream<RouteEvent>? get routeEventsListener {
    if (_routeEventsListener == null) {
      _routeEventsListener = _eventChannel
          .receiveBroadcastStream()
          .map((dynamic event) => _parseRouteEvent(event));
    }
    return _routeEventsListener;
  }

  RouteEvent _parseRouteEvent(String jsonString) {
    RouteEvent event;
    var map = json.decode(jsonString);
    var progressEvent = RouteProgressEvent.fromJson(map);
    if (progressEvent.isProgressEvent!) {
      event = RouteEvent(
          eventType: MapBoxEvent.progress_change, data: progressEvent);
    } else
      event = RouteEvent.fromJson(map);
    return event;
  }

  List<Map<String, Object?>> _getPointListFromWayPoints(List<WayPoint> wayPoints) {
    List<Map<String, Object?>> pointList = [];

    for (int i = 0; i < wayPoints.length; i++) {
      var wayPoint = wayPoints[i];
      assert(wayPoint.name != null);
      assert(wayPoint.latitude != null);
      assert(wayPoint.longitude != null);

      final pointMap = <String, dynamic>{
        "Order": i,
        "Name": wayPoint.name,
        "Latitude": wayPoint.latitude,
        "Longitude": wayPoint.longitude,
        "IsSilent": wayPoint.isSilent,
      };
      pointList.add(pointMap);
    }
    return pointList;
  }
}

