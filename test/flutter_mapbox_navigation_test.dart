import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_mapbox_navigation');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await MapBoxNavigation.instance.platformVersion, '42');
  });
}
