import 'dart:async';

import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'location_models.dart';
import 'navigation_page.dart';

class NavigationEvents {}

final navigationViewModelProvider =
    StateNotifierProvider<NavigationViewModel, NavigationEvents>((ref) {
  return NavigationViewModel(ref);
});

class NavigationViewModel extends StateNotifier<NavigationEvents> {
  NavigationViewModel(this.ref) : super(NavigationEvents()) {
    // startLocation = ref.read(locationProvider);
  }

  StateNotifierProviderRef<NavigationViewModel, NavigationEvents> ref;
  LocationModel? startLocation = LocationModel(51.5000557, 0.0358876, 1, timestamp: DateTime.now());
  MapBoxNavigationViewController? _mapController;

  MapBoxOptions getNavigationOptions() {
    return MapBoxOptions(
        // initialLatitude: startLocation?.lat,
        // initialLongitude: startLocation?.lon,
        zoom: 5.0,
        tilt: 0.0,
        bearing: 0.0,
        enableRefresh: false,
        alternatives: true,
        voiceInstructionsEnabled: false,
        bannerInstructionsEnabled: true,
        isOptimized: true,
        showReportFeedbackButton: false,
        showEndOfRouteFeedback: false,
        longPressDestinationEnabled: true,
        allowsUTurnAtWayPoints: true,
        mode: MapBoxNavigationMode.drivingWithTraffic,
        units: VoiceUnits.imperial,
        mapStyleUrlDay: 'mapbox://styles/mapbox/navigation-night-v1',
        mapStyleUrlNight: 'mapbox://styles/mapbox/navigation-night-v1',
        simulateRoute: true,
        language: 'en');
  }

  List<WayPoint> _getWayPoints(double lat, double lon) {
    return <WayPoint>[
      WayPoint(
          name: 'Start location',
          latitude: startLocation?.lat,
          longitude: startLocation?.lon,
          isSilent: false),
      // WayPoint(
      // name: 'Destination', latitude: 51.5257831, longitude: -0.0849654, isSilent: false),
      WayPoint(name: 'Destination', latitude: lat, longitude: lon, isSilent: false)
    ];
  }

  void onMapCreated(
      MapBoxNavigationViewController controller, NavigationParamParams params) async {
    _mapController = controller;
    await _mapController?.buildRoute(wayPoints: _getWayPoints(params.lat, params.lon));
  }

  Future<void> onEmbeddedRouteEvent(RouteEvent e) async {
    print(e.eventType);
    if (e.eventType == MapBoxEvent.navigation_cancelled) {

    } else if (e.eventType case MapBoxEvent.route_built) {
      _mapController?.startNavigation();
    } else if (e.eventType case MapBoxEvent.on_arrival) {
      _mapController?.durationRemaining.then((value) {
        finishNavigation(value.toInt());
      }).catchError((error, trace) {
        finishNavigation(10);
      });
    }
  }

  void finishNavigation(int remainingSeconds) {
    Future.delayed(
        Duration(seconds: remainingSeconds), () => _mapController?.finishNavigation());
  }

  @override
  void dispose() async{
    try {
      await _mapController?.finishNavigation();
      await _mapController?.clearRoute();
      _mapController?.dispose();
    } catch (error, stack) {
    } finally {
      super.dispose();
    }
  }
}
