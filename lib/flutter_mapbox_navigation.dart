import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlutterMapboxNavigation {
  static const MethodChannel _channel =
      const MethodChannel('flutter_mapbox_navigation');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future getDirections(Location origin, Location destination) async {
    assert(origin != null);
    assert(origin.name != null);
    assert(origin.latitude != null);
    assert(origin.longitude != null);
    assert(destination != null);
    assert(destination.name != null);
    assert(destination.latitude != null);
    assert(destination.longitude != null);
    final Map<String, Object> args = <String, dynamic>{
      "originName": origin.name,
      "originLatitude": origin.latitude,
      "originLongitude": origin.longitude,
      "destinationName": destination.name,
      "destinationLatitude": destination.latitude,
      "destinationLongitude": destination.longitude
    };
    await _channel.invokeMethod('getDirections', args);
  }
}

class Location {
  final String name;
  final double latitude;
  final double longitude;

  Location(
      {@required this.name, @required this.latitude, @required this.longitude});
}

class NavigationView extends StatefulWidget {

  final Location origin;
  final Location destination;

  NavigationView({@required this.origin, @required this.destination});

  _NavigationViewState createState() => _NavigationViewState();

}

class _NavigationViewState extends State<NavigationView>
{

    Map<String, Object>  args;

    @override
    initState() {
      args  = <String, dynamic>{
        "originName": widget.origin.name,
        "originLatitude": widget.origin.latitude,
        "originLongitude": widget.origin.longitude,
        "destinationName": widget.destination.name,
        "destinationLatitude": widget.destination.latitude,
        "destinationLongitude": widget.destination.longitude
      };
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 350,
      width: 350,
      child: UiKitView(viewType: "FlutterMapboxNavigationView", creationParams: args, creationParamsCodec: StandardMessageCodec()),);
  }

}
