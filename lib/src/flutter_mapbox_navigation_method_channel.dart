import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_mapbox_navigation_platform_interface.dart';
import 'models/models.dart';

/// An implementation of [FlutterMapboxNavigationPlatform] that uses method channels.
class MethodChannelFlutterMapboxNavigation extends FlutterMapboxNavigationPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_mapbox_navigation');
  /// The event channel used to interact with the native platform.
  @visibleForTesting
  final eventChannel = const EventChannel('flutter_mapbox_navigation/events');

  late StreamSubscription<RouteEvent> _routeEventSubscription;
  Stream<RouteEvent>? _routeEventsListener;
  late ValueSetter<RouteEvent>? _onRouteEvent;

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<double?> getDistanceRemaining() async {
    final distance = await methodChannel.invokeMethod<double?>('getDistanceRemaining');
    return distance;
  }

  @override
  Future<double?> getDurationRemaining() async {
    final duration = await methodChannel.invokeMethod<double?>('getDurationRemaining');
    return duration;
  }

  @override
  Future<bool?> startFreeDrive(MapBoxOptions options) async {
    _routeEventSubscription = routeEventsListener!.listen(_onProgressData);
    var args = options.toMap();
    final result = await methodChannel.invokeMethod('startFreeDrive', args);
    if (result is bool) return result;
    log(result);
    return false;
  }

  @override
  Future<bool?> startNavigation(List<WayPoint> wayPoints, MapBoxOptions options) async {
    assert(wayPoints.length > 1);
    if (Platform.isIOS && wayPoints.length > 3) {
      assert(options.mode != MapBoxNavigationMode.drivingWithTraffic,
      "Error: Cannot use drivingWithTraffic Mode when you have more than 3 Stops");
    }

    List<Map<String, Object?>> pointList = _getPointListFromWayPoints(wayPoints);
    var i = 0;
    var wayPointMap =
    { for (var e in pointList) i++ : e };

    var args = options.toMap();
    args["wayPoints"] = wayPointMap;

    _routeEventSubscription = routeEventsListener!.listen(_onProgressData);
    final result = await methodChannel.invokeMethod('startNavigation', args);
    if (result is bool) return result;
    log(result);
    return false;
  }

  @override
  Future addWayPoints({required wayPoints }) async {
    assert(wayPoints.length > 0);
    List<Map<String, Object?>> pointList = _getPointListFromWayPoints(wayPoints);
    var i = 0;
    var wayPointMap =
    { for (var e in pointList) i++ : e };
    var args = <String, dynamic>{};
    args["wayPoints"] = wayPointMap;
    await methodChannel
        .invokeMethod('addWayPoints', args);
  }

  @override
  Future<bool?> finishNavigation() async {
    var success = await methodChannel.invokeMethod<bool?>('finishNavigation', null);
    return success;
  }

  /// Will download the navigation engine and the user's region to allow offline routing
  @override
  Future<bool?> enableOfflineRouting() async {
    var success = await methodChannel.invokeMethod<bool?>('enableOfflineRouting', null);
    return success;
  }

  @override
  Future registerRouteEventListener(ValueSetter<RouteEvent> listener) async {
    _onRouteEvent = listener;
  }

  // Events Handling
  Stream<RouteEvent>? get routeEventsListener {
    _routeEventsListener ??= eventChannel
        .receiveBroadcastStream()
        .map((dynamic event) => _parseRouteEvent(event));
    return _routeEventsListener;
  }

  void _onProgressData(RouteEvent event) {
    if (_onRouteEvent != null) _onRouteEvent!(event);
    switch(event.eventType){
      case MapBoxEvent.navigation_finished:
        _routeEventSubscription.cancel();
        break;
      default:
        break;
    }
  }

  RouteEvent _parseRouteEvent(String jsonString) {
    RouteEvent event;
    var map = json.decode(jsonString);
    var progressEvent = RouteProgressEvent.fromJson(map);
    if (progressEvent.isProgressEvent!) {
      event = RouteEvent(
          eventType: MapBoxEvent.progress_change, data: progressEvent);
    } else {
      event = RouteEvent.fromJson(map);
    }
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
