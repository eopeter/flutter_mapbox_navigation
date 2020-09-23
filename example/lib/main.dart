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
  final _origin =
      WayPoint(name: "Way Point 1", latitude: 38.9111117447887, longitude: -77.04012393951416);
  final _stop1 =
      WayPoint(name: "Way Point 2", latitude: 38.91113678979344, longitude: -77.03847169876099);
  final _stop2 = WayPoint(
      name: "Way Point 3", latitude: 38.91040213277608, longitude: -77.03848242759705);
  final _stop3 = WayPoint(
      name: "Way Point 4", latitude: 38.909650771013034, longitude: -77.03850388526917);
  final _stop4 = WayPoint(
      name: "Way Point 5", latitude: 38.90894949285854, longitude: -77.03651905059814);
  MapboxNavigation _directions;
  bool _arrived = false;
  bool _isMultipleStop = false;
  double _distanceRemaining, _durationRemaining;

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

    _directions = MapboxNavigation(onRouteEvent: (e) async {
      _distanceRemaining = await _directions.distanceRemaining;
      _durationRemaining = await _directions.durationRemaining;

      switch (e.eventType) {
        case MapBoxEvent.progress_change:
          var progressEvent = e.data as RouteProgressEvent;
          _arrived = progressEvent.arrived;
          _distanceRemaining = progressEvent.distance;
          _durationRemaining = progressEvent.duration;
          if(progressEvent.currentStepInstruction != null)
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
              height: 60,
            ),
            RaisedButton(
              child: Text("Start  Navigation"),
              onPressed: () async {
                await _directions.startNavigation(
                    origin: _origin,
                    destination: _stop1,
                    mode: MapBoxNavigationMode.drivingWithTraffic,
                    simulateRoute: true,
                    language: "en",
                    units: VoiceUnits.metric);
              },
            ),
            SizedBox(
              height: 30,
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
                    mode: MapBoxNavigationMode.driving,
                    simulateRoute: true,
                    language: "en",
                    allowsUTurnAtWayPoints: true,
                    pauseAtWayPoints: false,
                    units: VoiceUnits.metric);
              },
            ),
            SizedBox(
              height: 60,
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
          ]),
        ),
      ),
    );
  }
}
