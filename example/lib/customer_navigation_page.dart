import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'customer_navigation.dart';
import 'navigation_page.dart';
import 'navigation_viewmodel.dart';

class CustomerNavigationParam {
  CustomerNavigationParam({required this.lat, required this.lon});

  final double lat;
  final double lon;
}

class CustomerNavigationPage extends ConsumerStatefulWidget {
  const CustomerNavigationPage({super.key, required this.params});

  final CustomerNavigationParam params;

  @override
  ConsumerState<CustomerNavigationPage> createState() =>
      _CustomerNavigationPageState();
}

class _CustomerNavigationPageState
    extends ConsumerState<CustomerNavigationPage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    final state = ref.watch(customerNavigationViewModelProvider(widget.params));
    final navigationViewModel = ref.read(navigationViewModelProvider.notifier);
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      body: _renderBody(state),
    );
  }

  Widget _renderBody(CustomerNavigationState state) {
    switch (state) {
      case Loading():
        return const Center(
          child: CircularProgressIndicator(),
        );
      case Data():
        return NavigationPage(
            key: GlobalKey(),
            params: NavigationParamParams(lat: state.lat, lon: state.lon));
    }
  }
}
