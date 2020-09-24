import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_mapbox_navigation/library.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _instruction = "";
  final _origin = WayPoint(
      name: "Way Point 1",
      latitude: 38.9111117447887,
      longitude: -77.04012393951416);
  final _stop1 = WayPoint(
      name: "Way Point 2",
      latitude: 38.91113678979344,
      longitude: -77.03847169876099);
  final _stop2 = WayPoint(
      name: "Way Point 3",
      latitude: 38.91040213277608,
      longitude: -77.03848242759705);
  final _stop3 = WayPoint(
      name: "Way Point 4",
      latitude: 38.909650771013034,
      longitude: -77.03850388526917);
  final _stop4 = WayPoint(
      name: "Way Point 5",
      latitude: 38.90894949285854,
      longitude: -77.03651905059814);
  MapBoxNavigation _directions;
  bool _arrived = false;
  bool _isMultipleStop = false;
  double _distanceRemaining, _durationRemaining;
  MapBoxNavigationViewController _controller;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initialize() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    _directions = MapBoxNavigation(onRouteEvent: (e) async {
      _distanceRemaining = await _directions.distanceRemaining;
      _durationRemaining = await _directions.durationRemaining;

      switch (e.eventType) {
        case MapBoxEvent.progress_change:
          var progressEvent = e.data as RouteProgressEvent;
          _arrived = progressEvent.arrived;
          _distanceRemaining = progressEvent.distance;
          _durationRemaining = progressEvent.duration;
          if (progressEvent.currentStepInstruction != null)
            _instruction = progressEvent.currentStepInstruction;
          break;
        case MapBoxEvent.route_build_failed:
          print(e.data);
          break;
        case MapBoxEvent.on_arrival:
          _arrived = true;
          if (!_isMultipleStop) {
            await Future.delayed(Duration(seconds: 3));
            await _directions.finishNavigation();
          }
          break;
        default:
          break;
      }
      setState(() {});
    });

    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await _directions.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Text('Running on: $_platformVersion\n'),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              child: Text("Start  Navigation"),
              onPressed: () async {
                await _directions.startNavigation(
                    origin: _origin,
                    destination: _stop1,
                    options: MapBoxOptions(
                        mode: MapBoxNavigationMode.drivingWithTraffic,
                        simulateRoute: true,
                        language: "en",
                        mapStyleURL:
                            "mapbox://styles/eopeter/ckffcmgtl0car1ap80jhp4hsr",
                        units: VoiceUnits.metric));
              },
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text("Start Multi Stop Navigation"),
              onPressed: () async {
                _isMultipleStop = true;
                var wayPoints = List<WayPoint>();
                wayPoints.add(_origin);
                wayPoints.add(_stop1);
                wayPoints.add(_stop2);
                wayPoints.add(_stop3);
                wayPoints.add(_stop4);
                wayPoints.add(_origin);

                await _directions.startNavigationWithWayPoints(
                    wayPoints: wayPoints,
                    options: MapBoxOptions(
                        mode: MapBoxNavigationMode.driving,
                        simulateRoute: true,
                        language: "en",
                        allowsUTurnAtWayPoints: true,
                        units: VoiceUnits.metric));
              },
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text("Start Embedded Navigation"),
              onPressed: () {
                _controller.startNavigation();
              },
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  _instruction,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Distance Remaining: "),
                      Text(_distanceRemaining != null
                          ? "${(_distanceRemaining * 0.000621371).toStringAsFixed(1)} miles"
                          : "---")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Duration Remaining: "),
                      Text(_durationRemaining != null
                          ? "${(_durationRemaining / 60).toStringAsFixed(0)} minutes"
                          : "---")
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 300,
              color: Colors.grey,
              child: MapBoxNavigationView(
                  onCreated: (MapBoxNavigationViewController controller) async {
                _controller = controller;
                await controller.showMap(MapBoxOptions(
                    initialLatitude: 33.569126,
                    initialLongitude: 73.1231471,
                    zoom: 13.0,
                    tilt: 0.0,
                    bearing: 0.0,
                    enableRefresh: false,
                    alternatives: true,
                    voiceInstructionsEnabled: true,
                    bannerInstructionsEnabled: true,
                    allowsUTurnAtWayPoints: true,
                    mode: MapBoxNavigationMode.drivingWithTraffic,
                    units: VoiceUnits.imperial,
                    language: "en"));
              }),
            )
          ]),
        ),
      ),
    );
  }
}
