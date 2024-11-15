import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mapbox_navigation/src/embedded/controller.dart';
import 'package:flutter_mapbox_navigation/src/models/models.dart';

/// Callback method for when the navigation view is ready to be used.
///
/// Pass to MapBoxNavigationView.onMapCreated to receive a
/// [MapBoxNavigationViewController] when the
/// map is created.
typedef OnNavigationViewCreatedCallBack = void Function(
  MapBoxNavigationViewController controller,
);

///Embeddable Navigation View.
class MapBoxNavigationView extends StatelessWidget {
  ///Embeddable Navigation View Constructor
  const MapBoxNavigationView({
    super.key,
    this.options,
    this.onCreated,
    this.onRouteEvent,
  });

  static const StandardMessageCodec _decoder = StandardMessageCodec();

  /// MapBox options
  final MapBoxOptions? options;

  /// Callback when view is created
  final OnNavigationViewCreatedCallBack? onCreated;

  /// Value setter for RouteEvents
  final ValueSetter<RouteEvent>? onRouteEvent;

  /// View name
  static const String viewType = 'FlutterMapboxNavigationView';

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      // using Hybrid Composition
      return PlatformViewLink(
        viewType: viewType,
        surfaceFactory: (context, controller) {
          return AndroidViewSurface(
            controller: controller as AndroidViewController,
            gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
            hitTestBehavior: PlatformViewHitTestBehavior.opaque,
          );
        },
        onCreatePlatformView: (params) {
          return PlatformViewsService.initExpensiveAndroidView(
            id: params.id,
            viewType: viewType,
            layoutDirection: TextDirection.ltr,
            creationParams: options!.toMap(),
            creationParamsCodec: const StandardMessageCodec(),
            onFocus: () {
              params.onFocusChanged(true);
            },
          )
            ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
            ..addOnPlatformViewCreatedListener(_onPlatformViewCreated)
            ..create();
        },
      );
    } else if (Platform.isIOS) {
      return Padding(
  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0), // Add your desired padding here
  child: UiKitView(
    viewType: 'FlutterMapboxNavigationView',
    onPlatformViewCreated: _onPlatformViewCreated,
    creationParams: options,
    creationParamsCodec: _decoder,
  ),
)
;
    } else {
      return Container();
    }
  }

  void _onPlatformViewCreated(int id) {
    if (onCreated == null) {
      return;
    }
    onCreated!(MapBoxNavigationViewController(id, onRouteEvent));
  }
}
