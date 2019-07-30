import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _origin = Location(name: "Pick Up", latitude: 42.9755233, longitude: -78.8965816);
  final _destination = Location(name: "Drop Off", latitude: 42.9278972, longitude: -78.6920296);

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterMapboxNavigation.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

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
            Text('Running on: $_platformVersion\n'),
            SizedBox(
              height: 60,
            ),
            RaisedButton(
              child: Text("Directions"),
              onPressed: () async{

                await FlutterMapboxNavigation.getDirections(_origin, _destination);
              },
            ),
            NavigationView(origin: _origin, destination: _destination,)
          ]),
        ),
      ),
    );
  }
}
