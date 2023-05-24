import 'package:flutter/widgets.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_mapbox_navigation_method_channel.dart';
import 'models/models.dart';

abstract class FlutterMapboxNavigationPlatform extends PlatformInterface {
  /// Constructs a FlutterMapboxNavigationPlatform.
  FlutterMapboxNavigationPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMapboxNavigationPlatform _instance = MethodChannelFlutterMapboxNavigation();

  /// The default instance of [FlutterMapboxNavigationPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterMapboxNavigation].
  static FlutterMapboxNavigationPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterMapboxNavigationPlatform] when
  /// they register themselves.
  static set instance(FlutterMapboxNavigationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  ///Current Device OS Version
  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///Total distance remaining in meters along route.
  Future<double?> getDistanceRemaining() {
    throw UnimplementedError('getDistanceRemaining() has not been implemented.');
  }

  ///Total seconds remaining on all legs.
  Future<double?> getDurationRemaining() {
    throw UnimplementedError('getDurationRemaining() has not been implemented.');
  }

  /// Free-drive mode is a unique Mapbox Navigation SDK feature that allows drivers to navigate without a set destination. This mode is sometimes referred to as passive navigation.
  /// [options] options used to generate the route and used while navigating
  /// Begins to generate Route Progress
  ///
  Future<bool?> startFreeDrive(MapBoxOptions options) async {
    throw UnimplementedError('startFreeDrive() has not been implemented.');
  }

  ///Show the Navigation View and Begins Direction Routing
  ///
  /// [wayPoints] must not be null and have at least 2 items. A collection of [WayPoint](longitude, latitude and name). Must be at least 2 or at most 25. Cannot use drivingWithTraffic mode if more than 3-waypoints.
  /// [options] options used to generate the route and used while navigating
  /// Begins to generate Route Progress
  ///
  Future<bool?> startNavigation(List<WayPoint> wayPoints, MapBoxOptions options) async {
    throw UnimplementedError('startNavigation() has not been implemented.');
  }

  ///Adds waypoints or stops to an on-going navigation
  ///
  /// [wayPoints] must not be null and have at least 1 item. The way points will
  /// be inserted after the currently navigating waypoint in the existing navigation
  Future addWayPoints({required wayPoints }) {
    throw UnimplementedError('addWayPoints({required wayPoints }) has not been implemented.');
  }

  ///Ends Navigation and Closes the Navigation View
  Future<bool?> finishNavigation() async {
    throw UnimplementedError('finishNavigation() has not been implemented.');
  }

  /// Will download the navigation engine and the user's region to allow offline routing
  Future<bool?> enableOfflineRouting() async {
    throw UnimplementedError('enableOfflineRouting() has not been implemented.');
  }

  Future registerRouteEventListener(ValueSetter<RouteEvent> listener) async {
    throw UnimplementedError('registerEventListener() has not been implemented.');
  }
}
