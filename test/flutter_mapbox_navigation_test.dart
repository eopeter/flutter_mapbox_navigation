import 'package:flutter/widgets.dart';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
import 'package:flutter_mapbox_navigation/src/flutter_mapbox_navigation_method_channel.dart';
import 'package:flutter_mapbox_navigation/src/flutter_mapbox_navigation_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterMapboxNavigationPlatform
    with MockPlatformInterfaceMixin
    implements FlutterMapboxNavigationPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<dynamic> addWayPoints({required List<WayPoint> wayPoints}) =>
      Future.value('');

  @override
  Future<bool?> enableOfflineRouting() => Future.value(true);

  @override
  Future<bool?> finishNavigation() => Future.value(true);

  @override
  Future<double?> getDistanceRemaining() => Future.value(3.5);

  @override
  Future<double?> getDurationRemaining() => Future.value(50);

  @override
  Future<bool?> startFreeDrive(MapBoxOptions options) => Future.value(true);

  @override
  Future<bool?> startNavigation(
    List<WayPoint> wayPoints,
    MapBoxOptions options,
  ) =>
      Future.value();

  @override
  Future<dynamic> registerRouteEventListener(
    ValueSetter<RouteEvent> listener,
  ) =>
      Future.value();
}

void main() {
  final initialPlatform = FlutterMapboxNavigationPlatform.instance;

  test('$MethodChannelFlutterMapboxNavigation is the default instance', () {
    expect(
      initialPlatform,
      isInstanceOf<MethodChannelFlutterMapboxNavigation>(),
    );
  });

  test('getPlatformVersion', () async {
    final flutterMapboxNavigationPlugin = MapBoxNavigation();
    final fakePlatform = MockFlutterMapboxNavigationPlatform();
    FlutterMapboxNavigationPlatform.instance = fakePlatform;

    expect(await flutterMapboxNavigationPlugin.getPlatformVersion(), '42');
  });
}
