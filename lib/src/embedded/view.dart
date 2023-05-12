import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'controller.dart';
import '../models/models.dart';

/// Callback method for when the navigation view is ready to be used.
///
/// Pass to [MapBoxNavigationView.onMapCreated] to receive a [MapBoxNavigationViewController] when the
/// map is created.
typedef void OnNavigationViewCreatedCallBack(
    MapBoxNavigationViewController controller);

///Embeddable Navigation View.
class MapBoxNavigationView extends StatelessWidget {
  static const StandardMessageCodec _decoder = StandardMessageCodec();
  final MapBoxOptions? options;
  final OnNavigationViewCreatedCallBack? onCreated;
  final ValueSetter<RouteEvent>? onRouteEvent;

  static const String viewType = 'FlutterMapboxNavigationView';

  const MapBoxNavigationView(
      {Key? key, this.options, this.onCreated, this.onRouteEvent})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      // using Virtual Displays
      // return AndroidView(
      //     viewType: 'FlutterMapboxNavigationView',
      //     onPlatformViewCreated: _onPlatformViewCreated,
      //     creationParams: options!.toMap(),
      //     creationParamsCodec: _decoder);

      // using Hybrid Composition
      return PlatformViewLink(
        viewType: viewType,
        surfaceFactory:
            (context, controller) {
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
      return UiKitView(
          viewType: 'FlutterMapboxNavigationView',
          onPlatformViewCreated: _onPlatformViewCreated,
          creationParams: options!.toMap(),
          creationParamsCodec: _decoder);
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
