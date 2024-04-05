import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'customer_navigation_page.dart';
import 'location_models.dart';

sealed class CustomerNavigationState {
  CustomerNavigationState({required this.title});

  String title;
}

class Loading extends CustomerNavigationState {
  Loading({required super.title});
}

class Data extends CustomerNavigationState {
  Data(this.lat, this.lon, {required super.title});

  final double lat;
  final double lon;
}

final customerNavigationViewModelProvider = StateNotifierProvider.autoDispose
    .family<CustomerNavigationViewModel, CustomerNavigationState,
        CustomerNavigationParam>((ref, params) {
  return CustomerNavigationViewModel(ref, params);
});

class CustomerNavigationViewModel
    extends StateNotifier<CustomerNavigationState> {
  CustomerNavigationViewModel(this.ref, this.params)
      : super(Loading(
          title: 'Loading',
        )) {
    start();
  }

  CustomerNavigationParam params;
  LocationModel? startLocation;

  StateNotifierProviderRef<CustomerNavigationViewModel, CustomerNavigationState>
      ref;

  void start() {
    // var loc = ref.read(locationProvider);
    var loc = LocationModel(51.5258649, -0.087771, 1, timestamp: DateTime.now());
    if (loc != null && startLocation == null) {
      startLocation = loc;
      state = Data(
        params.lat,
        params.lon,
        title: 'something',
      );
    }
  }
}
