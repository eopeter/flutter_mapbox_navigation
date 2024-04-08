import 'package:flutter/material.dart';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'navigation_viewmodel.dart';

class NavigationParamParams {
  NavigationParamParams({required this.lat, required this.lon});
  final double lat;
  final double lon;
}

class NavigationPage extends ConsumerStatefulWidget {
  const NavigationPage({super.key, required this.params});

  final NavigationParamParams params;

  @override
  ConsumerState<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends ConsumerState<NavigationPage> {
  late final NavigationViewModel viewModel;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    if (!mounted) return;
    viewModel = ref.read(navigationViewModelProvider.notifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MapBoxNavigationView(
        key: scaffoldKey,
        options: viewModel.getNavigationOptions(),
        onRouteEvent: (e) => {
          if (e.eventType == MapBoxEvent.navigation_cancelled) {
            Navigator.pop(context, true)
          }
          else viewModel.onEmbeddedRouteEvent(e)
        },
        onCreated: (MapBoxNavigationViewController controller) async {
          if (!mounted) return;
          viewModel.onMapCreated(controller, widget.params);
        });
  }

  @override
  void dispose() {
    if (!mounted) return;
    super.dispose();
  }
}
