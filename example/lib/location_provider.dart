import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import 'location_models.dart';

typedef Coordinates = ({double lat, double lon});


final locationProvider = NotifierProvider<LocationNotifier, LocationModel?>(
  () => LocationNotifier(),
  name: 'Location',
);

final proximityProvider = Provider.family<double?, Coordinates>(
  (ref, arg) {
    // keeps updating
    final currentPosition = ref.watch(locationProvider);
    if (currentPosition == null) return null;

    return Geolocator.distanceBetween(
      currentPosition.lat,
      currentPosition.lon,
      arg.lat,
      arg.lon,
    );
  },
  name: 'Location Proximity',
);

final isInCloseProximityProvider = Provider.family<bool, Coordinates>(
  (ref, arg) {
    final distance = ref.watch(proximityProvider(arg));
    // in meters
    const double threshold = 200.0;
    return distance != null ? distance <= threshold : false;
  },
  name: 'In Close Proximity',
);

final closeProximityProvider = Provider.family<double?, Coordinates>(
  (ref, arg) {
    final distance = ref.watch(proximityProvider(arg));
    return distance;
  },
  name: 'Close Proximity distance',
);

class LocationNotifier extends Notifier<LocationModel?> {
  LocationNotifier({
    this.locationListeningInterval = const Duration(seconds: 20),
    this.locationBatchInterval = const Duration(seconds: 80),
  });

  final Duration locationListeningInterval;
  final Duration locationBatchInterval;

  StreamSubscription? _locationSubscription;
  List<LocationModel> _currentBatch = [];
  DateTime? _lastBatchTimestamp;

  @override
  LocationModel? build() => null;

  Future<int> distanceToPoint(Coordinates coordinates) async => state == null
      ? 0
      : Geolocator.distanceBetween(
          state!.lat,
          state!.lon,
          coordinates.lat,
          coordinates.lon,
        ).toInt();

  // There seems to be an issue where if the user revokes permissions while the app is running
  // the app will crash.
  // https://github.com/Baseflow/flutter-geolocator/issues/406#issuecomment-605493557
  Future<void> startListening() async {
    final isEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isEnabled) {
      return;
    }

    final permission = await Geolocator.checkPermission();

    switch (permission) {
      case LocationPermission.denied:
      case LocationPermission.deniedForever:
      case LocationPermission.unableToDetermine:
        print('Location permission is required first');
        // TODO: throw error?
        return;
      case LocationPermission.whileInUse:
      case LocationPermission.always:
        final settings = switch (defaultTargetPlatform) {
          TargetPlatform.iOS || TargetPlatform.macOS => AppleSettings(
              accuracy: LocationAccuracy.bestForNavigation,
              activityType: ActivityType.automotiveNavigation,
              pauseLocationUpdatesAutomatically: true,
              allowBackgroundLocationUpdates: true,
              distanceFilter: 20,
              showBackgroundLocationIndicator: true),
          TargetPlatform.android || TargetPlatform.fuchsia => AndroidSettings(
              accuracy: LocationAccuracy.bestForNavigation,
              intervalDuration: locationListeningInterval,
              foregroundNotificationConfig: const ForegroundNotificationConfig(
                notificationText: 'Your location is active',
                notificationTitle: 'Relay Copilot',
                // enableWakeLock: true,
                // setOngoing: true,
              ),
            ),
          _ => const LocationSettings(
              accuracy: LocationAccuracy.bestForNavigation,
            ),
        };
        try {
          // if (Platform.isAndroid) {
          //   await FlutterBackground.initialize();
          //   await FlutterBackground.enableBackgroundExecution();
          // }
          final positions = Geolocator.getPositionStream(
            locationSettings: settings,
          );
          _locationSubscription = positions.listen(
            (event) => _onPositionReceived(event),
            onError: (err) => print('Geolocator error $err'),
          );
        } catch (error) {
          print('Geolocator error $error');
        }
    }
  }

  Future<void> stopListening() async {
    _locationSubscription?.cancel();
    _locationSubscription = null;
    // if (Platform.isAndroid) {
    //   await FlutterBackground.disableBackgroundExecution();
    // }
  }

  void _onPositionReceived(Position event) {
    final location = event.toLocation();
    final now = DateTime.now();
    final lastTimestamp = _lastBatchTimestamp ??= now;
    state = location;
    _addToBatch(location);
  }

  void _addToBatch(LocationModel location) {
    _currentBatch.add(location);
  }

}

extension on Position {
  LocationModel toLocation() {
    return LocationModel(
      latitude,
      longitude,
      accuracy.toInt(),
      timestamp: timestamp,
    );
  }
}
