import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_mapbox_navigation_platform_interface.dart';

/// An implementation of [FlutterMapboxNavigationPlatform] that uses method channels.
class MethodChannelFlutterMapboxNavigation extends FlutterMapboxNavigationPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_mapbox_navigation');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
