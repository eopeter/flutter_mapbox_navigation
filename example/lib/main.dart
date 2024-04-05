import 'package:flutter/material.dart';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
import 'package:flutter_mapbox_navigation_example/customer_navigation_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(ProviderScope(
      child: MaterialApp(home: MainPage()),
    ));

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MapBoxNavigation.instance.setDefaultOptions(MapBoxOptions(
        zoom: 15.0,
        tilt: 0.0,
        bearing: 0.0,
        enableRefresh: false,
        alternatives: false,
        voiceInstructionsEnabled: true,
        bannerInstructionsEnabled: true,
        allowsUTurnAtWayPoints: true,
        mode: MapBoxNavigationMode.drivingWithTraffic,
        mapStyleUrlDay: 'mapbox://styles/mapbox/navigation-night-v1',
        mapStyleUrlNight: 'mapbox://styles/mapbox/navigation-night-v1',
        units: VoiceUnits.imperial,
        simulateRoute: false,
        language: "en"));

    WayPoint cityhall =
        WayPoint(name: "City Hall", latitude: 51.5258649, longitude: -0.087771);
    WayPoint downtown = WayPoint(
        name: "Downtown Buffalo", latitude: 51.5257831, longitude: -0.0849654);
    var wayPoints = <WayPoint>[cityhall, downtown];
    MapBoxNavigation.instance.registerRouteEventListener((e) {
      print(e.eventType);
      if (e.eventType == MapBoxEvent.navigation_cancelled) {
        Navigator.pop(context, true);
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Relay Mapbox'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // MapBoxNavigation.instance.startNavigation(wayPoints: wayPoints);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CustomerNavigationPage(
                      params: CustomerNavigationParam(
                          lat: 51.5257831, lon: -0.0849654))),
            );
          },
          child: const Text('Navigate'),
        ),
      ),
    );
  }
}
