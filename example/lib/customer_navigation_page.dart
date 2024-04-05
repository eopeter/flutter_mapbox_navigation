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
      // body: Stack(children: [
      //   _renderBody(state),
      //   Container(
      //     padding: const EdgeInsets.only(bottom: 24.0, top: 16.0),
      //     decoration: const BoxDecoration(color: Colors.black),
      //     child: Column(
      //       children: [
      //         Row(
      //           children: [
      //             Expanded(
      //               child: Container(
      //                 margin: const EdgeInsets.all(8.0),
      //                 child: MaterialButton(
      //                   onPressed: () {
      //                     if (navigationViewModel.mounted) {
      //                       navigationViewModel.dispose();
      //                     }
      //                     Navigator.pop(context, false);
      //                   },
      //                   child: const Text('Back'),
      //                 ),
      //               ),
      //             ),
      //             // Assuming Spacer1 is a custom widget for spacing. Adjust as necessary.
      //             Expanded(
      //               child: Container(
      //                 margin: const EdgeInsets.all(8.0),
      //                 // Adjust the margin as needed
      //                 child: MaterialButton(
      //                   onPressed: () {
      //                     if (navigationViewModel.mounted) {
      //                       navigationViewModel.dispose();
      //                     }
      //                     Navigator.pop(context, true);
      //                   },
      //                   child: const Text('Complete'),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ]),
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
            key: UniqueKey(),
            params: NavigationParamParams(lat: state.lat, lon: state.lon));
    }
  }
}
