import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Turn-By-Turn Navigation Provider
class MapboxNavigation {
  factory MapboxNavigation({ValueSetter<bool> onRouteProgress}) {
    if (_instance == null) {
      final MethodChannel methodChannel =
          const MethodChannel('flutter_mapbox_navigation');
      final EventChannel eventChannel =
          const EventChannel('flutter_mapbox_navigation/arrival');
      _instance = MapboxNavigation.private(
          methodChannel, eventChannel, onRouteProgress);
    }
    return _instance;
  }

  @visibleForTesting
  MapboxNavigation.private(this._methodChannel, this._routeProgressEventchannel,
      this._routeProgressNotifier);

  static MapboxNavigation _instance;

  final MethodChannel _methodChannel;
  final EventChannel _routeProgressEventchannel;
  final ValueSetter<bool> _routeProgressNotifier;

  Stream<bool> _onRouteProgress;
  StreamSubscription<bool> _routeProgressSubscription;

  ///Current Device OS Version
  Future<String> get platformVersion => _methodChannel
      .invokeMethod('getPlatformVersion')
      .then<String>((dynamic result) => result);

  ///Total distance remaining in meters along route.
  Future<double> get distanceRemaining => _methodChannel
      .invokeMethod<double>('getDistanceRemaining')
      .then<double>((dynamic result) => result);

  ///Total seconds remaining on all legs.
  Future<double> get durationRemaining => _methodChannel
      .invokeMethod<double>('getDurationRemaining')
      .then<double>((dynamic result) => result);

  ///Show the Navigation View and Begins Direction Routing
  ///
  /// [origin] must not be null. It must have a longitude, latitude and name.
  /// [destination] must not be null. It must have a longitude, latitude and name.
  /// [mode] defaults to drivingWithTraffic
  /// [simulateRoute] if true will simulate the route as if you were driving. Always true on iOS Simulator
  ///
  /// Begins to generate Route Progress
  ///
  Future startNavigation(
      {Location origin,
      Location destination,
      NavigationMode mode = NavigationMode.drivingWithTraffic,
      bool simulateRoute = false}) async {
    assert(origin != null);
    assert(origin.name != null);
    assert(origin.latitude != null);
    assert(origin.longitude != null);
    assert(destination != null);
    assert(destination.name != null);
    assert(destination.latitude != null);
    assert(destination.longitude != null);
    final Map<String, Object> args = <String, dynamic>{
      "originName": origin.name,
      "originLatitude": origin.latitude,
      "originLongitude": origin.longitude,
      "destinationName": destination.name,
      "destinationLatitude": destination.latitude,
      "destinationLongitude": destination.longitude,
      "mode": mode.toString().split('.').last,
      "simulateRoute": simulateRoute
    };
    await _methodChannel.invokeMethod('startNavigation', args);
    _routeProgressSubscription = _streamRouteProgress.listen(_onProgressData);
  }

  ///Ends Navigation and Closes the Navigation View
  Future<bool> finishNavigation() async {
    var success = await _methodChannel.invokeMethod('finishNavigation', null);
    return success;
  }

  void _onProgressData(bool arrived) {
    if (_routeProgressNotifier != null) _routeProgressNotifier(arrived);

    if (arrived) _routeProgressSubscription.cancel();
  }

  void _onProgressError() {}

  Stream<bool> get _streamRouteProgress {
    if (_onRouteProgress == null) {
      _onRouteProgress = _routeProgressEventchannel
          .receiveBroadcastStream()
          .map((dynamic event) => _parseArrivalState(event));
    }
    return _onRouteProgress;
  }

  bool _parseArrivalState(bool state) {
    return state;
  }
}

class Location {
  final String name;
  final double latitude;
  final double longitude;

  Location(
      {@required this.name, @required this.latitude, @required this.longitude});
}

enum NavigationMode { walking, cycling, driving, drivingWithTraffic }

class NavigationView extends StatefulWidget {
  final Location origin;
  final Location destination;
  final bool simulateRoute;

  NavigationView(
      {@required this.origin, @required this.destination, this.simulateRoute});

  _NavigationViewState createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  Map<String, Object> args;

  @override
  initState() {
    args = <String, dynamic>{
      "originName": widget.origin.name,
      "originLatitude": widget.origin.latitude,
      "originLongitude": widget.origin.longitude,
      "destinationName": widget.destination.name,
      "destinationLatitude": widget.destination.latitude,
      "destinationLongitude": widget.destination.longitude,
      "simulateRoute": widget.simulateRoute
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 350,
      width: 350,
      child: UiKitView(
          viewType: "FlutterMapboxNavigationView",
          creationParams: args,
          creationParamsCodec: StandardMessageCodec()),
    );
  }
}
