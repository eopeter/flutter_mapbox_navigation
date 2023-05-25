// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
// ignore_for_file: public_member_api_docs

// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:flutter_mapbox_navigation/src/flutter_mapbox_navigation_platform_interface.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

/// A web implementation of the FlutterMapboxNavigationPlatform of the
/// FlutterMapboxNavigation plugin.
class FlutterMapboxNavigationWeb extends FlutterMapboxNavigationPlatform {
  /// Constructs a FlutterMapboxNavigationWeb
  FlutterMapboxNavigationWeb();

  static void registerWith(Registrar registrar) {
    FlutterMapboxNavigationPlatform.instance = FlutterMapboxNavigationWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = html.window.navigator.userAgent;
    return version;
  }
}
