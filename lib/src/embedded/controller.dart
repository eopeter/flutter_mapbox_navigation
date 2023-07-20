import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mapbox_navigation/src/models/models.dart';

/// Controller for a single MapBox Navigation instance
/// running on the host platform.
class MapBoxNavigationViewController {
  /// Constructor
  MapBoxNavigationViewController(
    int id,
    ValueSetter<RouteEvent>? eventNotifier,
  ) {
    _methodChannel = MethodChannel('flutter_mapbox_navigation/$id');
    _methodChannel.setMethodCallHandler(_handleMethod);

    _eventChannel = EventChannel('flutter_mapbox_navigation/$id/events');
    _routeEventNotifier = eventNotifier;
  }

  late MethodChannel _methodChannel;
  late EventChannel _eventChannel;

  ValueSetter<RouteEvent>? _routeEventNotifier;

  late StreamSubscription<RouteEvent> _routeEventSubscription;

  ///Current Device OS Version
  Future<String> get platformVersion => _methodChannel
      .invokeMethod('getPlatformVersion')
      .then((dynamic result) => result as String);

  ///Total distance remaining in meters along route.
  Future<double> get distanceRemaining => _methodChannel
      .invokeMethod<double>('getDistanceRemaining')
      .then((dynamic result) => result as double);

  ///Total seconds remaining on all legs.
  Future<double> get durationRemaining => _methodChannel
      .invokeMethod<double>('getDurationRemaining')
      .then((dynamic result) => result as double);

  ///Build the Route Used for the Navigation
  ///
  /// [wayPoints] must not be null. A collection of [WayPoint](longitude,
  /// latitude and name). Must be at least 2 or at most 25. Cannot use
  /// drivingWithTraffic mode if more than 3-waypoints.
  /// [options] options used to generate the route and used while navigating
  ///
  Future<bool> buildRoute({
    required List<WayPoint> wayPoints,
    MapBoxOptions? options,
  }) async {
    assert(wayPoints.length > 1, 'Error: WayPoints must be at least 2');
    if (Platform.isIOS && wayPoints.length > 3 && options?.mode != null) {
      assert(
        options!.mode != MapBoxNavigationMode.drivingWithTraffic,
        '''
          Error: Cannot use drivingWithTraffic Mode 
          when you have more than 3 Stops
        ''',
      );
    }
    final pointList = <Map<String, Object?>>[];

    for (var i = 0; i < wayPoints.length; i++) {
      final wayPoint = wayPoints[i];
      assert(wayPoint.name != null, 'Error: waypoints need name');
      assert(wayPoint.latitude != null, 'Error: waypoints need latitude');
      assert(wayPoint.longitude != null, 'Error: waypoints need longitude');

      final pointMap = <String, dynamic>{
        'Order': i,
        'Name': wayPoint.name,
        'Latitude': wayPoint.latitude,
        'Longitude': wayPoint.longitude,
      };
      pointList.add(pointMap);
    }

    var i = 0;
    final wayPointMap = {for (var e in pointList) i++: e};

    var args = <String, dynamic>{};
    if (options != null) args = options.toMap();
    args['wayPoints'] = wayPointMap;

    _routeEventSubscription = _streamRouteEvent!.listen(_onProgressData);
    return _methodChannel
        .invokeMethod('buildRoute', args)
        .then((dynamic result) => result as bool);
  }

  /// starts listening for events
  Future<void> initialize() async {
    _routeEventSubscription = _streamRouteEvent!.listen(_onProgressData);
  }

  /// Clear the built route and resets the map
  Future<bool?> clearRoute() async {
    return _methodChannel.invokeMethod('clearRoute', null);
  }

  /// Starts Free Drive Mode
  Future<bool?> startFreeDrive({MapBoxOptions? options}) async {
    Map<String, dynamic>? args;
    if (options != null) args = options.toMap();
    return _methodChannel.invokeMethod('startFreeDrive', args);
  }

  /// Starts the Navigation
  Future<bool?> startNavigation({MapBoxOptions? options}) async {
    Map<String, dynamic>? args;
    if (options != null) args = options.toMap();
    //_routeEventSubscription = _streamRouteEvent.listen(_onProgressData);
    return _methodChannel.invokeMethod('startNavigation', args);
  }

  ///Ends Navigation and Closes the Navigation View
  Future<bool?> finishNavigation() async {
    final success = await _methodChannel.invokeMethod('finishNavigation', null);
    return success as bool?;
  }

  /// Generic Handler for Messages sent from the Platform
  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case 'sendFromNative':
        final text = call.arguments as String?;
        return Future.value('Text from native: $text');
    }
  }

  /// Call this to cancel the subscription to route events
  /// Add here future disposing methods
  void dispose() {
    _routeEventSubscription.cancel();
  }

  void _onProgressData(RouteEvent event) {
    if (_routeEventNotifier != null) _routeEventNotifier?.call(event);
  }

  Stream<RouteEvent>? get _streamRouteEvent {
    return _eventChannel
        .receiveBroadcastStream()
        .map((dynamic event) => _parseRouteEvent(event as String));
  }

  RouteEvent _parseRouteEvent(String jsonString) {
    RouteEvent event;
    final map = json.decode(jsonString) as Map<String, dynamic>;
    final progressEvent = RouteProgressEvent.fromJson(map);
    if (progressEvent.isProgressEvent!) {
      event = RouteEvent(
        eventType: MapBoxEvent.progress_change,
        data: progressEvent,
      );
    } else {
      event = RouteEvent.fromJson(map);
    }
    return event;
  }
}
