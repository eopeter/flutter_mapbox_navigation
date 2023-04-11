import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_mapbox_navigation_method_channel.dart';

abstract class FlutterMapboxNavigationPlatform extends PlatformInterface {
  /// Constructs a FlutterMapboxNavigationPlatform.
  FlutterMapboxNavigationPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMapboxNavigationPlatform _instance = MethodChannelFlutterMapboxNavigation();

  /// The default instance of [FlutterMapboxNavigationPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterMapboxNavigation].
  static FlutterMapboxNavigationPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterMapboxNavigationPlatform] when
  /// they register themselves.
  static set instance(FlutterMapboxNavigationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
