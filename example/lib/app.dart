import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';

class SampleNavigationApp extends StatefulWidget {
  const SampleNavigationApp({super.key});

  @override
  _SampleNavigationAppState createState() => _SampleNavigationAppState();
}

class _SampleNavigationAppState extends State<SampleNavigationApp> {
  String? _platformVersion;
  String? _instruction;
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
  final _destination = WayPoint(
      name: "Way Point 5",
      latitude: 38.90894949285854,
      longitude: -77.03651905059814);

  final _home =
      WayPoint(name: "Home", latitude: 9.229358, longitude: 45.482257);

  final _store =
      WayPoint(name: "Store", latitude: 9.150469, longitude: 45.580307);

  bool _isMultipleStop = false;
  double? _distanceRemaining, _durationRemaining;
  MapBoxNavigationViewController? _controller;
  bool _routeBuilt = false;
  bool _isNavigating = false;
  late MapBoxOptions _navigationOption;

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

    _navigationOption = MapBoxNavigation.instance.getDefaultOptions();
    _navigationOption.simulateRoute = true;
    //_navigationOption.initialLatitude = 36.1175275;
    //_navigationOption.initialLongitude = -115.1839524;
    MapBoxNavigation.instance.registerRouteEventListener(_onEmbeddedRouteEvent);
    MapBoxNavigation.instance.setDefaultOptions(_navigationOption);

    String? platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await MapBoxNavigation.instance.getPlatformVersion();
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Running on: $_platformVersion\n'),
                    Container(
                      color: Colors.grey,
                      width: double.infinity,
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: (Text(
                          "Full Screen Navigation",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: const Text("Start A to B"),
                          onPressed: () async {
                            await MapBoxNavigation.instance.startNavigation(
                              wayPoints: [_home, _store, _home],
                              options: MapBoxOptions(
                                language: 'it',
                                bannerInstructionsEnabled: true,
                                simulateRoute: false,
                              ),
                              predefinedRoute: {
                                "weight_name": "auto",
                                "weight": 4319.873,
                                "duration": 3489.218,
                                "distance": 39957.273,
                                "legs": [
                                  {
                                    "via_waypoints": [],
                                    "admins": [
                                      {
                                        "iso_3166_1_alpha3": "ITA",
                                        "iso_3166_1": "IT"
                                      }
                                    ],
                                    "weight": 2159.648,
                                    "duration": 1759.177,
                                    "steps": [
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Via Desiderio"
                                                }
                                              ],
                                              "type": "turn",
                                              "modifier": "left",
                                              "text": "Via Desiderio"
                                            },
                                            "distanceAlongGeometry": 323.094
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Guida verso nord-est su <say-as interpret-as=\"address\">Via Giovanni Pacini</say-as>. poi, tra un quarto di miglio, Svolta a sinistra su <say-as interpret-as=\"address\">Via Desiderio</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Guida verso nord-est su Via Giovanni Pacini. poi, tra un quarto di miglio, Svolta a sinistra su Via Desiderio.",
                                            "distanceAlongGeometry": 323.094
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Svolta a sinistra su <say-as interpret-as=\"address\">Via Desiderio</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Svolta a sinistra su Via Desiderio.",
                                            "distanceAlongGeometry": 88.889
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [true],
                                            "bearings": [64],
                                            "duration": 4.588,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 5.391,
                                            "geometry_index": 0,
                                            "location": [9.229385, 45.482219]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [64, 122, 243],
                                            "duration": 3.844,
                                            "turn_weight": 0.75,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 5.244,
                                            "geometry_index": 2,
                                            "location": [9.229645, 45.48231]
                                          },
                                          {
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "in": 2,
                                            "bearings": [64, 177, 244, 358],
                                            "duration": 2.494,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.408,
                                            "geometry_index": 4,
                                            "location": [9.229835, 45.482376]
                                          },
                                          {
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "location": [9.229961, 45.48242],
                                            "geometry_index": 5,
                                            "admin_index": 0,
                                            "weight": 3.79,
                                            "is_urban": true,
                                            "traffic_signal": true,
                                            "turn_duration": 2.019,
                                            "turn_weight": 2,
                                            "duration": 3.542,
                                            "bearings": [0, 63, 179, 244],
                                            "out": 1,
                                            "in": 3,
                                            "entry": [true, true, true, false]
                                          },
                                          {
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "in": 2,
                                            "bearings": [64, 179, 243, 358],
                                            "duration": 11.788,
                                            "turn_weight": 2,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 15.829,
                                            "geometry_index": 6,
                                            "location": [9.230089, 45.482465]
                                          },
                                          {
                                            "entry": [true, false, true],
                                            "in": 1,
                                            "bearings": [64, 244, 346],
                                            "duration": 14.142,
                                            "turn_weight": 1,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 17.242,
                                            "geometry_index": 7,
                                            "location": [9.231063, 45.482804]
                                          },
                                          {
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "in": 2,
                                            "bearings": [66, 156, 244, 335],
                                            "duration": 0.423,
                                            "turn_weight": 2,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.478,
                                            "geometry_index": 8,
                                            "location": [9.232234, 45.48321]
                                          },
                                          {
                                            "bearings": [63, 246, 345],
                                            "entry": [true, false, true],
                                            "in": 1,
                                            "turn_weight": 1,
                                            "turn_duration": 0.022,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "geometry_index": 9,
                                            "location": [9.232269, 45.483221]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "depart",
                                          "instruction":
                                              "Guida verso nord-est su Via Giovanni Pacini.",
                                          "bearing_after": 64,
                                          "bearing_before": 0,
                                          "location": [9.229385, 45.482219]
                                        },
                                        "name": "Via Giovanni Pacini",
                                        "duration": 52.626,
                                        "distance": 323.094,
                                        "driving_side": "right",
                                        "weight": 68.93,
                                        "mode": "driving",
                                        "geometry":
                                            "um_wuAqcirPy@eD{BaJ}AoGe@kBwA{FyA_GeT{{@kXehAUeAeQkr@"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Via Vallazze"
                                                }
                                              ],
                                              "type": "turn",
                                              "modifier": "right",
                                              "text": "Via Vallazze"
                                            },
                                            "distanceAlongGeometry": 210.911
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra 700 piedi, Svolta a destra su <say-as interpret-as=\"address\">Via Vallazze</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra 700 piedi, Svolta a destra su Via Vallazze.",
                                            "distanceAlongGeometry": 183.891
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Svolta a destra su <say-as interpret-as=\"address\">Via Vallazze</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Svolta a destra su Via Vallazze.",
                                            "distanceAlongGeometry": 53.333
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [true, false, true],
                                            "in": 1,
                                            "bearings": [63, 243, 344],
                                            "duration": 6.098,
                                            "turn_weight": 5,
                                            "turn_duration": 4.058,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 7.346,
                                            "geometry_index": 10,
                                            "location": [9.233091, 45.483512]
                                          },
                                          {
                                            "entry": [false, false, true, true],
                                            "in": 1,
                                            "bearings": [63, 164, 244, 345],
                                            "duration": 0.808,
                                            "turn_weight": 10,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 3,
                                            "weight": 10.92,
                                            "geometry_index": 11,
                                            "location": [9.233031, 45.483659]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              false,
                                              false,
                                              true
                                            ],
                                            "in": 1,
                                            "bearings": [63, 165, 244, 344],
                                            "duration": 36.219,
                                            "turn_weight": 2,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 3,
                                            "weight": 43.63,
                                            "geometry_index": 12,
                                            "location": [9.233017, 45.483696]
                                          },
                                          {
                                            "bearings": [73, 164, 253, 344],
                                            "entry": [
                                              false,
                                              false,
                                              false,
                                              true
                                            ],
                                            "turn_weight": 2,
                                            "turn_duration": 0.007,
                                            "in": 1,
                                            "stop_sign": true,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 3,
                                            "geometry_index": 13,
                                            "location": [9.232389, 45.485263]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "turn",
                                          "instruction":
                                              "Svolta a sinistra su Via Desiderio.",
                                          "modifier": "left",
                                          "bearing_after": 345,
                                          "bearing_before": 63,
                                          "location": [9.233091, 45.483512]
                                        },
                                        "name": "Via Desiderio",
                                        "duration": 44.732,
                                        "distance": 210.911,
                                        "driving_side": "right",
                                        "weight": 65.736,
                                        "mode": "driving",
                                        "geometry":
                                            "o~awuAekprPeHvBiAZ}`Bff@cAXmA^"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "sub": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text":
                                                      "Piazza Pietro Gobetti"
                                                }
                                              ],
                                              "type": "turn",
                                              "modifier": "slight left",
                                              "text": "Piazza Pietro Gobetti"
                                            },
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Svolta a sinistra"
                                                }
                                              ],
                                              "type": "turn",
                                              "modifier": "slight left",
                                              "text": "Svolta a sinistra"
                                            },
                                            "distanceAlongGeometry": 171.153
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra 600 piedi, Svolta a sinistra.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra 600 piedi, Svolta a sinistra.",
                                            "distanceAlongGeometry": 161.153
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Svolta a sinistra. poi Svolta a sinistra su <say-as interpret-as=\"address\">Piazza Pietro Gobetti</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Svolta a sinistra. poi Svolta a sinistra su Piazza Pietro Gobetti.",
                                            "distanceAlongGeometry": 60.833
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [true, false, true],
                                            "in": 1,
                                            "bearings": [74, 164, 253],
                                            "duration": 15.715,
                                            "turn_weight": 7,
                                            "turn_duration": 2.315,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 22.41,
                                            "geometry_index": 15,
                                            "location": [9.23236, 45.485336]
                                          },
                                          {
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "in": 2,
                                            "bearings": [80, 175, 254, 355],
                                            "duration": 1.211,
                                            "turn_weight": 2,
                                            "turn_duration": 0.011,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 3.38,
                                            "geometry_index": 16,
                                            "location": [9.23318, 45.485505]
                                          },
                                          {
                                            "entry": [false, true, true, false],
                                            "in": 3,
                                            "bearings": [37, 87, 173, 260],
                                            "duration": 1.07,
                                            "turn_weight": 2,
                                            "turn_duration": 0.011,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.218,
                                            "geometry_index": 17,
                                            "location": [9.233253, 45.485514]
                                          },
                                          {
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "in": 2,
                                            "bearings": [89, 175, 267, 353],
                                            "duration": 2.549,
                                            "turn_weight": 2,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.922,
                                            "geometry_index": 18,
                                            "location": [9.233311, 45.485516]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 1,
                                            "bearings": [89, 269, 294],
                                            "duration": 6.307,
                                            "turn_weight": 6,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 13.245,
                                            "geometry_index": 19,
                                            "location": [9.233466, 45.485517]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [0, 89, 179, 269],
                                            "duration": 1.447,
                                            "turn_weight": 2,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.656,
                                            "geometry_index": 20,
                                            "location": [9.233914, 45.485521]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [89, 179, 269],
                                            "duration": 1.701,
                                            "turn_weight": 1,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.948,
                                            "geometry_index": 21,
                                            "location": [9.234015, 45.485522]
                                          },
                                          {
                                            "bearings": [89, 269],
                                            "entry": [true, false],
                                            "in": 1,
                                            "turn_weight": 1,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "geometry_index": 22,
                                            "location": [9.234122, 45.485523]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "end of road",
                                          "instruction":
                                              "Svolta a destra su Via Vallazze.",
                                          "modifier": "right",
                                          "bearing_after": 74,
                                          "bearing_before": 344,
                                          "location": [9.23236, 45.485336]
                                        },
                                        "name": "Via Vallazze",
                                        "duration": 36.564,
                                        "distance": 171.153,
                                        "driving_side": "right",
                                        "weight": 62.329,
                                        "mode": "driving",
                                        "geometry":
                                            "opewuAo}nrPqIgr@QqCCsBAuHG_[AiEAuEGuW"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "sub": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text":
                                                      "Piazza Pietro Gobetti"
                                                }
                                              ],
                                              "type": "fork",
                                              "modifier": "right",
                                              "text": "Piazza Pietro Gobetti"
                                            },
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text":
                                                      "Piazza Pietro Gobetti"
                                                }
                                              ],
                                              "type": "turn",
                                              "modifier": "slight left",
                                              "text": "Piazza Pietro Gobetti"
                                            },
                                            "distanceAlongGeometry": 24.273
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Svolta a sinistra su <say-as interpret-as=\"address\">Piazza Pietro Gobetti</say-as>. poi Mantieni la destra per rimanere su <say-as interpret-as=\"address\">Piazza Pietro Gobetti</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Svolta a sinistra su Piazza Pietro Gobetti. poi Mantieni la destra per rimanere su Piazza Pietro Gobetti.",
                                            "distanceAlongGeometry": 24.273
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [64, 90, 269],
                                            "duration": 1.16,
                                            "turn_weight": 6.5,
                                            "turn_duration": 0.131,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 7.683,
                                            "geometry_index": 23,
                                            "location": [9.234517, 45.485527]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [59, 244],
                                            "duration": 2.571,
                                            "turn_weight": 1,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 3.957,
                                            "geometry_index": 24,
                                            "location": [9.23456, 45.485542]
                                          },
                                          {
                                            "bearings": [42, 130, 239, 308],
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "in": 2,
                                            "turn_weight": 2,
                                            "turn_duration": 0.066,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "geometry_index": 28,
                                            "location": [9.234669, 45.485588]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "turn",
                                          "instruction": "Svolta a sinistra.",
                                          "modifier": "slight left",
                                          "bearing_after": 64,
                                          "bearing_before": 89,
                                          "location": [9.234517, 45.485527]
                                        },
                                        "name": "",
                                        "duration": 6.626,
                                        "distance": 24.273,
                                        "driving_side": "right",
                                        "weight": 16.893,
                                        "mode": "driving",
                                        "geometry":
                                            "m|ewuAidsrP]uA[kAOa@Uo@Y{@Q_@Yg@Yi@eAaA"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "sub": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text":
                                                      "Via Nicola Antonio Porpora"
                                                }
                                              ],
                                              "type": "turn",
                                              "modifier": "slight right",
                                              "text":
                                                  "Via Nicola Antonio Porpora"
                                            },
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text":
                                                      "Piazza Pietro Gobetti"
                                                }
                                              ],
                                              "type": "fork",
                                              "modifier": "right",
                                              "text": "Piazza Pietro Gobetti"
                                            },
                                            "distanceAlongGeometry": 36.847
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Mantieni la destra per rimanere su <say-as interpret-as=\"address\">Piazza Pietro Gobetti</say-as>. poi Svolta a destra su <say-as interpret-as=\"address\">Via Nicola Antonio Porpora</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Mantieni la destra per rimanere su Piazza Pietro Gobetti. poi Svolta a destra su Via Nicola Antonio Porpora.",
                                            "distanceAlongGeometry": 36.847
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "bearings": [168, 222, 360],
                                            "entry": [false, false, true],
                                            "in": 1,
                                            "turn_weight": 6.5,
                                            "turn_duration": 0.436,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "geometry_index": 32,
                                            "location": [9.234759, 45.485658]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "turn",
                                          "instruction":
                                              "Svolta a sinistra su Piazza Pietro Gobetti.",
                                          "modifier": "slight left",
                                          "bearing_after": 360,
                                          "bearing_before": 42,
                                          "location": [9.234759, 45.485658]
                                        },
                                        "name": "Piazza Pietro Gobetti",
                                        "duration": 9.95,
                                        "distance": 36.847,
                                        "driving_side": "right",
                                        "weight": 17.204,
                                        "mode": "driving",
                                        "geometry": "sdfwuAmssrPuS@"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text":
                                                      "Via Nicola Antonio Porpora"
                                                }
                                              ],
                                              "type": "turn",
                                              "modifier": "slight right",
                                              "text":
                                                  "Via Nicola Antonio Porpora"
                                            },
                                            "distanceAlongGeometry": 21.804
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Svolta a destra su <say-as interpret-as=\"address\">Via Nicola Antonio Porpora</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Svolta a destra su Via Nicola Antonio Porpora.",
                                            "distanceAlongGeometry": 21.804
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "location": [9.234758, 45.485989],
                                            "geometry_index": 33,
                                            "admin_index": 0,
                                            "weight": 2.85,
                                            "is_urban": true,
                                            "traffic_signal": true,
                                            "turn_duration": 2.014,
                                            "turn_weight": 1.5,
                                            "duration": 3.214,
                                            "bearings": [11, 180, 351],
                                            "out": 0,
                                            "in": 1,
                                            "entry": [true, false, true]
                                          },
                                          {
                                            "bearings": [50, 90, 191, 270],
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "in": 2,
                                            "turn_weight": 2,
                                            "turn_duration": 0.1,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "geometry_index": 35,
                                            "location": [9.234772, 45.48604]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "fork",
                                          "instruction":
                                              "Mantieni la destra per rimanere su Piazza Pietro Gobetti.",
                                          "modifier": "slight right",
                                          "bearing_after": 11,
                                          "bearing_before": 360,
                                          "location": [9.234758, 45.485989]
                                        },
                                        "name": "Piazza Pietro Gobetti",
                                        "duration": 6.515,
                                        "distance": 21.804,
                                        "driving_side": "right",
                                        "weight": 8.45,
                                        "mode": "driving",
                                        "geometry":
                                            "iyfwuAkssrPcAMa@MQIWOUUa@i@Sc@[gAYkB"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Via Rombon"
                                                }
                                              ],
                                              "type": "turn",
                                              "modifier": "slight right",
                                              "text": "Via Rombon"
                                            },
                                            "distanceAlongGeometry": 225.923
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra 700 piedi, Svolta a destra su <say-as interpret-as=\"address\">Via Rombon</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra 700 piedi, Svolta a destra su Via Rombon.",
                                            "distanceAlongGeometry": 209.256
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Svolta a destra su <say-as interpret-as=\"address\">Via Rombon</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Svolta a destra su Via Rombon.",
                                            "distanceAlongGeometry": 88.889
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [true, false, true],
                                            "in": 1,
                                            "bearings": [89, 233, 267],
                                            "duration": 8.331,
                                            "turn_weight": 9.125,
                                            "turn_duration": 0.072,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 18.416,
                                            "geometry_index": 42,
                                            "location": [9.234925, 45.486126]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [86, 113, 270],
                                            "duration": 4.424,
                                            "turn_duration": 0.024,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.95,
                                            "geometry_index": 44,
                                            "location": [9.235431, 45.486129]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["tunnel"],
                                            "in": 1,
                                            "bearings": [86, 266],
                                            "duration": 19,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 21.375,
                                            "geometry_index": 47,
                                            "location": [9.235714, 45.486143]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [85, 266],
                                            "duration": 0.9,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 1.013,
                                            "geometry_index": 48,
                                            "location": [9.236926, 45.486202]
                                          },
                                          {
                                            "entry": [false, true, false],
                                            "in": 2,
                                            "bearings": [63, 110, 265],
                                            "duration": 0.82,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.037,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.38,
                                            "geometry_index": 50,
                                            "location": [9.236971, 45.486205]
                                          },
                                          {
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "in": 2,
                                            "bearings": [113, 175, 290, 353],
                                            "duration": 7.991,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 8.98,
                                            "geometry_index": 51,
                                            "location": [9.237035, 45.486189]
                                          },
                                          {
                                            "bearings": [110, 290, 306],
                                            "entry": [true, false, false],
                                            "in": 1,
                                            "turn_weight": 6,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "geometry_index": 53,
                                            "location": [9.237648, 45.48602]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "turn",
                                          "instruction":
                                              "Svolta a destra su Via Nicola Antonio Porpora.",
                                          "modifier": "slight right",
                                          "bearing_after": 89,
                                          "bearing_before": 53,
                                          "location": [9.234925, 45.486126]
                                        },
                                        "name": "Via Nicola Antonio Porpora",
                                        "duration": 42.945,
                                        "distance": 225.923,
                                        "driving_side": "right",
                                        "weight": 64.771,
                                        "mode": "driving",
                                        "geometry":
                                            "{agwuAy}srPE}Z?uBEoBO_IEeCuBwjAEmA?K^_CfCwLhEqWv@}E"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "secondary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text":
                                                      "Tangenziale Est Lecco"
                                                },
                                                {"type": "text", "text": "/"},
                                                {
                                                  "type": "text",
                                                  "text": "Tangenziale Nord"
                                                }
                                              ],
                                              "type": "turn",
                                              "modifier": "slight left",
                                              "text":
                                                  "Tangenziale Est Lecco / Tangenziale Nord"
                                            },
                                            "primary": {
                                              "components": [
                                                {
                                                  "mapbox_shield": {
                                                    "text_color": "white",
                                                    "name": "it-motorway",
                                                    "display_ref": "A51",
                                                    "base_url":
                                                        "https://api.mapbox.com/styles/v1"
                                                  },
                                                  "type": "icon",
                                                  "text": "A51"
                                                }
                                              ],
                                              "type": "turn",
                                              "modifier": "slight left",
                                              "text": "A51"
                                            },
                                            "distanceAlongGeometry": 783.932
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Prosegui per mezzo miglio.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Prosegui per mezzo miglio.",
                                            "distanceAlongGeometry": 767.265
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra un quarto di miglio, Prendi la rampa <say-as interpret-as=\"address\">A51</say-as> a sinistra.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra un quarto di miglio, Prendi la rampa A51 a sinistra.",
                                            "distanceAlongGeometry": 402.336
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Prendi la rampa <say-as interpret-as=\"address\">A51</say-as> a sinistra verso <say-as interpret-as=\"address\">Tangenziale Est Lecco</say-as>, <say-as interpret-as=\"address\">Tangenziale Nord</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Prendi la rampa A51 a sinistra verso Tangenziale Est Lecco, Tangenziale Nord.",
                                            "distanceAlongGeometry": 122.222
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [84, 106, 290],
                                            "duration": 14.424,
                                            "turn_weight": 5,
                                            "turn_duration": 0.024,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 21.2,
                                            "geometry_index": 54,
                                            "location": [9.237759, 45.485992]
                                          },
                                          {
                                            "entry": [true, true, false, true],
                                            "in": 2,
                                            "bearings": [84, 175, 271, 353],
                                            "duration": 2.87,
                                            "turn_duration": 0.028,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 3.197,
                                            "geometry_index": 60,
                                            "location": [9.23856, 45.485909]
                                          },
                                          {
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "in": 2,
                                            "bearings": [83, 176, 264, 356],
                                            "duration": 0.4,
                                            "turn_duration": 0.021,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 0.426,
                                            "geometry_index": 61,
                                            "location": [9.238755, 45.485923]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [83, 263],
                                            "duration": 1.326,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 1.492,
                                            "geometry_index": 62,
                                            "location": [9.23878, 45.485925]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [83, 173, 263],
                                            "duration": 7.207,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 8.1,
                                            "geometry_index": 63,
                                            "location": [9.238866, 45.485932]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [84, 173, 263],
                                            "duration": 0.576,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 0.639,
                                            "geometry_index": 64,
                                            "location": [9.239352, 45.485973]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [83, 139, 264],
                                            "duration": 8.821,
                                            "turn_duration": 0.021,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 9.9,
                                            "geometry_index": 65,
                                            "location": [9.239392, 45.485976]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [83, 208, 263],
                                            "duration": 11.207,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 12.6,
                                            "geometry_index": 66,
                                            "location": [9.239946, 45.486022]
                                          },
                                          {
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "location": [9.240653, 45.486081],
                                            "geometry_index": 68,
                                            "admin_index": 0,
                                            "weight": 3.345,
                                            "is_urban": true,
                                            "traffic_signal": true,
                                            "turn_duration": 2.019,
                                            "turn_weight": 1,
                                            "duration": 4.103,
                                            "bearings": [82, 175, 263, 353],
                                            "out": 0,
                                            "in": 2,
                                            "entry": [true, true, false, true]
                                          },
                                          {
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "in": 2,
                                            "bearings": [82, 173, 262, 353],
                                            "duration": 4.554,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 5.116,
                                            "geometry_index": 69,
                                            "location": [9.240797, 45.486095]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [82, 262],
                                            "duration": 6.632,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 7.295,
                                            "geometry_index": 70,
                                            "location": [9.241097, 45.486123]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [82, 160, 262],
                                            "duration": 10.617,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 11.672,
                                            "geometry_index": 71,
                                            "location": [9.241542, 45.486165]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [82, 262],
                                            "duration": 4.168,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.585,
                                            "geometry_index": 72,
                                            "location": [9.242256, 45.486233]
                                          },
                                          {
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "in": 2,
                                            "bearings": [82, 173, 262, 352],
                                            "duration": 2.281,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.501,
                                            "geometry_index": 73,
                                            "location": [9.242537, 45.486259]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 1,
                                            "bearings": [83, 262, 353],
                                            "duration": 6.098,
                                            "turn_duration": 2.007,
                                            "traffic_signal": true,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.5,
                                            "geometry_index": 74,
                                            "location": [9.242693, 45.486274]
                                          },
                                          {
                                            "entry": [true, false, false, true],
                                            "in": 2,
                                            "bearings": [83, 166, 263, 322],
                                            "duration": 5.763,
                                            "turn_duration": 2.007,
                                            "traffic_signal": true,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.132,
                                            "geometry_index": 75,
                                            "location": [9.243012, 45.486303]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [82, 263],
                                            "duration": 5.322,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 5.854,
                                            "geometry_index": 77,
                                            "location": [9.243315, 45.48633]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [83, 138, 262],
                                            "duration": 8.616,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 9.47,
                                            "geometry_index": 78,
                                            "location": [9.243743, 45.486373]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [83, 197, 263],
                                            "duration": 18.476,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 20.317,
                                            "geometry_index": 79,
                                            "location": [9.244441, 45.486435]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [82, 263],
                                            "duration": 3.6,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 3.96,
                                            "geometry_index": 81,
                                            "location": [9.245941, 45.486563]
                                          },
                                          {
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "in": 2,
                                            "bearings": [82, 172, 262, 352],
                                            "duration": 1.729,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 1.894,
                                            "geometry_index": 82,
                                            "location": [9.246234, 45.486593]
                                          },
                                          {
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "location": [9.246369, 45.486607],
                                            "geometry_index": 83,
                                            "admin_index": 0,
                                            "weight": 2.782,
                                            "is_urban": true,
                                            "traffic_signal": true,
                                            "turn_duration": 2.007,
                                            "turn_weight": 1,
                                            "duration": 3.627,
                                            "bearings": [82, 173, 262, 352],
                                            "out": 0,
                                            "in": 2,
                                            "entry": [true, true, false, true]
                                          },
                                          {
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "in": 2,
                                            "bearings": [82, 172, 262, 352],
                                            "duration": 4.867,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 5.346,
                                            "geometry_index": 84,
                                            "location": [9.246599, 45.486631]
                                          },
                                          {
                                            "bearings": [82, 262],
                                            "entry": [true, false],
                                            "in": 1,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "geometry_index": 85,
                                            "location": [9.247284, 45.4867]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "turn",
                                          "instruction":
                                              "Svolta a destra su Via Rombon.",
                                          "modifier": "slight right",
                                          "bearing_after": 106,
                                          "bearing_before": 110,
                                          "location": [9.237759, 45.485992]
                                        },
                                        "name": "Via Rombon",
                                        "duration": 140.345,
                                        "distance": 783.932,
                                        "driving_side": "right",
                                        "weight": 153.612,
                                        "mode": "driving",
                                        "geometry":
                                            "oyfwuA}nyrPt@iFf@qE^aFXqGLkI?eI[eKCq@MkDqAk]EoA{Asa@aAsWs@qR[_Hw@wQsAyZgCsk@s@qP]wHy@}RQaEc@{KuAwY{Bsj@qEelAm@qO{@iQ[mGo@kMiCyi@oAyY"
                                      },
                                      {
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Prosegui per 3 miglia.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Prosegui per 3 miglia.",
                                            "distanceAlongGeometry": 4483.619
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra 1 miglio, Mantieni la destra per imboccare <say-as interpret-as=\"address\">A52</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra 1 miglio, Mantieni la destra per imboccare A52.",
                                            "distanceAlongGeometry": 1609.344
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra mezzo miglio, Mantieni la destra per imboccare <say-as interpret-as=\"address\">A52</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra mezzo miglio, Mantieni la destra per imboccare A52.",
                                            "distanceAlongGeometry": 804.672
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Mantieni la destra per prendere <say-as interpret-as=\"address\">A52</say-as>, <say-as interpret-as=\"address\">Tangenziale Nord di Milano</say-as> verso <say-as interpret-as=\"address\">Tangenziale Nord</say-as>, <say-as interpret-as=\"address\">Torino</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Mantieni la destra per prendere A52, Tangenziale Nord di Milano verso Tangenziale Nord, Torino.",
                                            "distanceAlongGeometry": 240
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [70, 82, 262],
                                            "duration": 2.626,
                                            "turn_duration": 0.045,
                                            "mapbox_streets_v8": {
                                              "class": "primary_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.775,
                                            "geometry_index": 86,
                                            "location": [9.247713, 45.48674]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [76, 257],
                                            "duration": 10.676,
                                            "mapbox_streets_v8": {
                                              "class": "primary_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 11.477,
                                            "geometry_index": 88,
                                            "location": [9.248178, 45.486836]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["tunnel"],
                                            "in": 1,
                                            "bearings": [70, 262],
                                            "duration": 2.443,
                                            "mapbox_streets_v8": {
                                              "class": "primary_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.626,
                                            "geometry_index": 95,
                                            "location": [9.250357, 45.487074]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [33, 233],
                                            "duration": 6.825,
                                            "mapbox_streets_v8": {
                                              "class": "primary_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 7.337,
                                            "geometry_index": 99,
                                            "location": [9.250774, 45.487236]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [10, 169],
                                            "duration": 4.65,
                                            "mapbox_streets_v8": {
                                              "class": "primary_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.999,
                                            "geometry_index": 108,
                                            "location": [9.250932, 45.488006]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [72, 233],
                                            "duration": 4.2,
                                            "mapbox_streets_v8": {
                                              "class": "primary_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.515,
                                            "geometry_index": 116,
                                            "location": [9.251323, 45.488459]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [89, 269],
                                            "duration": 19.125,
                                            "mapbox_streets_v8": {
                                              "class": "primary_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 20.559,
                                            "geometry_index": 120,
                                            "location": [9.25203, 45.488534]
                                          },
                                          {
                                            "entry": [false, false, true],
                                            "in": 0,
                                            "bearings": [134, 151, 336],
                                            "duration": 4.09,
                                            "turn_weight": 0.75,
                                            "turn_duration": 0.03,
                                            "mapbox_streets_v8": {
                                              "class": "primary_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 5.114,
                                            "geometry_index": 149,
                                            "location": [9.252132, 45.487715]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [2, 169],
                                            "duration": 0.996,
                                            "mapbox_streets_v8": {
                                              "class": "primary_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 1.07,
                                            "geometry_index": 154,
                                            "location": [9.251912, 45.488159]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [5, 182],
                                            "duration": 1.532,
                                            "mapbox_streets_v8": {
                                              "class": "primary_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 1.647,
                                            "geometry_index": 155,
                                            "location": [9.251917, 45.488272]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [7, 185],
                                            "duration": 2.987,
                                            "mapbox_streets_v8": {
                                              "class": "primary_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 3.211,
                                            "geometry_index": 156,
                                            "location": [9.251939, 45.488454]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [6, 187],
                                            "duration": 11.26,
                                            "mapbox_streets_v8": {
                                              "class": "primary_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 12.104,
                                            "geometry_index": 157,
                                            "location": [9.251997, 45.488803]
                                          },
                                          {
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "location": [9.252008, 45.49012],
                                            "geometry_index": 161,
                                            "admin_index": 0,
                                            "weight": 22.11,
                                            "is_urban": true,
                                            "turn_weight": 17.375,
                                            "duration": 4.431,
                                            "bearings": [10, 170, 186],
                                            "out": 0,
                                            "in": 1,
                                            "turn_duration": 0.026,
                                            "classes": ["motorway"],
                                            "entry": [true, false, false]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [12, 192],
                                            "duration": 6.268,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 6.738,
                                            "geometry_index": 163,
                                            "location": [9.252265, 45.491033]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [23, 200],
                                            "duration": 1.901,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.044,
                                            "geometry_index": 167,
                                            "location": [9.252812, 45.492308]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [23, 203],
                                            "duration": 4.409,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.74,
                                            "geometry_index": 168,
                                            "location": [9.253052, 45.492699]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [25, 205],
                                            "duration": 1.901,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.044,
                                            "geometry_index": 170,
                                            "location": [9.253639, 45.493591]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [25, 205],
                                            "duration": 0.809,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 0.87,
                                            "geometry_index": 171,
                                            "location": [9.253895, 45.493972]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [25, 205],
                                            "duration": 28.921,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 31.09,
                                            "geometry_index": 172,
                                            "location": [9.254005, 45.494136]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [11, 189],
                                            "duration": 25.685,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 26.97,
                                            "geometry_index": 195,
                                            "location": [9.255882, 45.500348]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "classes": ["motorway"],
                                            "in": 2,
                                            "bearings": [28, 45, 208],
                                            "duration": 13.612,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 14.285,
                                            "geometry_index": 217,
                                            "location": [9.259406, 45.505467]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [29, 209],
                                            "duration": 1.633,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 1.714,
                                            "geometry_index": 221,
                                            "location": [9.261388, 45.508036]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [23, 208],
                                            "duration": 1.298,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 1.363,
                                            "geometry_index": 225,
                                            "location": [9.261625, 45.508348]
                                          },
                                          {
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "location": [9.261778, 45.508601],
                                            "geometry_index": 228,
                                            "admin_index": 0,
                                            "weight": 6.63,
                                            "is_urban": false,
                                            "turn_weight": 1.5,
                                            "duration": 4.931,
                                            "bearings": [11, 191, 203],
                                            "out": 0,
                                            "in": 2,
                                            "turn_duration": 0.045,
                                            "classes": ["motorway"],
                                            "entry": [true, false, false]
                                          },
                                          {
                                            "entry": [true, false, true],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [8, 184, 359],
                                            "duration": 14.909,
                                            "turn_duration": 0.026,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 15.627,
                                            "geometry_index": 238,
                                            "location": [9.262005, 45.509611]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [15, 195],
                                            "duration": 1.753,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 1.84,
                                            "geometry_index": 268,
                                            "location": [9.26187, 45.512621]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [15, 195],
                                            "duration": 1.624,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 1.746,
                                            "geometry_index": 269,
                                            "location": [9.261996, 45.512943]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "classes": ["motorway"],
                                            "in": 2,
                                            "bearings": [8, 24, 193],
                                            "duration": 2.337,
                                            "turn_duration": 0.026,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.484,
                                            "geometry_index": 271,
                                            "location": [9.26211, 45.513265]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [183, 359],
                                            "duration": 1.244,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.338,
                                            "geometry_index": 275,
                                            "location": [9.262175, 45.513725]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [179, 359],
                                            "duration": 6.98,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 7.504,
                                            "geometry_index": 277,
                                            "location": [9.262169, 45.513973]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [176, 356],
                                            "duration": 1.878,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.019,
                                            "geometry_index": 279,
                                            "location": [9.26209, 45.515401]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [176, 356],
                                            "duration": 4.904,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 5.272,
                                            "geometry_index": 280,
                                            "location": [9.262057, 45.515725]
                                          },
                                          {
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "location": [9.261971, 45.51657],
                                            "geometry_index": 281,
                                            "admin_index": 0,
                                            "weight": 10.532,
                                            "is_urban": true,
                                            "turn_weight": 0.75,
                                            "duration": 9.122,
                                            "bearings": [168, 176, 354],
                                            "out": 2,
                                            "in": 1,
                                            "turn_duration": 0.022,
                                            "classes": ["motorway"],
                                            "entry": [false, false, true]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [174, 354],
                                            "duration": 1.4,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.54,
                                            "geometry_index": 282,
                                            "location": [9.261714, 45.518198]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [174, 354],
                                            "duration": 0.853,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 0.938,
                                            "geometry_index": 283,
                                            "location": [9.261674, 45.51845]
                                          },
                                          {
                                            "bearings": [174, 353],
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "geometry_index": 284,
                                            "location": [9.261648, 45.518614]
                                          }
                                        ],
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Tangenziale Nord"
                                                },
                                                {"type": "text", "text": "/"},
                                                {
                                                  "type": "text",
                                                  "text": "Torino"
                                                }
                                              ],
                                              "type": "fork",
                                              "modifier": "right",
                                              "text":
                                                  "Tangenziale Nord / Torino"
                                            },
                                            "distanceAlongGeometry": 4496.952
                                          },
                                          {
                                            "sub": {
                                              "components": [
                                                {
                                                  "active": false,
                                                  "directions": ["straight"],
                                                  "type": "lane",
                                                  "text": ""
                                                },
                                                {
                                                  "active": false,
                                                  "directions": ["straight"],
                                                  "type": "lane",
                                                  "text": ""
                                                },
                                                {
                                                  "active": false,
                                                  "directions": ["straight"],
                                                  "type": "lane",
                                                  "text": ""
                                                },
                                                {
                                                  "active_direction": "right",
                                                  "active": true,
                                                  "directions": ["right"],
                                                  "type": "lane",
                                                  "text": ""
                                                },
                                                {
                                                  "active_direction": "right",
                                                  "active": true,
                                                  "directions": ["right"],
                                                  "type": "lane",
                                                  "text": ""
                                                }
                                              ],
                                              "text": ""
                                            },
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Tangenziale Nord"
                                                },
                                                {"type": "text", "text": "/"},
                                                {
                                                  "type": "text",
                                                  "text": "Torino"
                                                }
                                              ],
                                              "type": "fork",
                                              "modifier": "right",
                                              "text":
                                                  "Tangenziale Nord / Torino"
                                            },
                                            "distanceAlongGeometry": 1609.344
                                          }
                                        ],
                                        "destinations":
                                            "A51, A52, E64, A4: Tangenziale Est Lecco, Tangenziale Nord, Torino Venezia, Malpensa",
                                        "maneuver": {
                                          "type": "on ramp",
                                          "instruction":
                                              "Prendi la rampa A51 a sinistra verso Tangenziale Est Lecco/Tangenziale Nord/Torino Venezia/Malpensa.",
                                          "modifier": "slight left",
                                          "bearing_after": 70,
                                          "bearing_before": 82,
                                          "location": [9.247713, 45.48674]
                                        },
                                        "name": "Tangenziale Est",
                                        "duration": 221.875,
                                        "distance": 4496.952,
                                        "driving_side": "right",
                                        "weight": 257.3,
                                        "mode": "driving",
                                        "ref": "A51",
                                        "geometry":
                                            "ghhwuAa}lsPgCmOw@sKsBsSe@qFk@}HkDww@cAc_@OmDUwBq@uGoAeFgBeEyA_CgEkEwByAeB_AoB{@uBa@cCSqB@_CPaOfCsCGmCi@wBy@}B{AsBqBmByCuA_Dy@yC{AgIe@mHQgHAgNIaMFkHVuFp@kEz@wD`BmEhBoDdMkMfCiB`CgA|Bo@~B@hCVfBf@fB`AxAvAxAlBrAhCz@`Cr@|C^~CLpDAfDYdDc@fDq@bCiAzCcB|CwClEoN`ImBz@cB^wAP}AFaFIkJk@yTsBcKy@s_@OsUaA}MtB_^}FaYcGsK}B__@cL_KiDaVyJmW_NqLiGei@k[yV_OgI{EepAqu@yLyFyMkFyLcE_J_CoD}@iJmBmIuAcEi@oD[s\\}Beb@qBkk@eD{Mm@aQaAkO_AqHa@cEQcLs@aIy@sDc@mGaAiBWgBUoE_A_Ew@{Co@wD}@eEmAaBg@gFcB_GyBkDwAqCoAqFeCgDeBkFyCeGqDyDgC_BiAwAaAeKoHeYiSw~@{p@atBmyAik@_a@{o@sd@um@cc@uScOcCgBwEgDgCeBkCcBwBkA}BmAcGwC}NoCiNsCyCi@wCa@wD_@mCSqBOkAGaBGcBA_EBiCDcBD_CHaNjAqD^iD`@{Cb@sCf@md@zIyMdBiCPiCNmBFeDFgGCqBEcBKyBMeCU_CScBSaBUcBYaCa@aCg@iCk@mCu@sCu@_GeBcS{F{JoCgGsAwCe@kGq@sF_@_GIiFBeGFir@n@}d@lBgS`Ays@jDwdB`OwNnAgIr@g{AdP"
                                      },
                                      {
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Prosegui per 8 miglia.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Prosegui per 8 miglia.",
                                            "distanceAlongGeometry": 12332.84
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra 1 miglio, Prendi l'uscita <say-as interpret-as=\"address\">Como - Milano Bruzzano</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra 1 miglio, Prendi l'uscita Como - Milano Bruzzano.",
                                            "distanceAlongGeometry": 1609.344
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra mezzo miglio, Prendi l'uscita <say-as interpret-as=\"address\">Como - Milano Bruzzano</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra mezzo miglio, Prendi l'uscita Como - Milano Bruzzano.",
                                            "distanceAlongGeometry": 804.672
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Prendi l'uscita <say-as interpret-as=\"address\">Como - Milano Bruzzano</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Prendi l'uscita Como - Milano Bruzzano.",
                                            "distanceAlongGeometry": 160
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "lanes": [
                                              {
                                                "indications": ["straight"],
                                                "valid": false,
                                                "active": false
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid": false,
                                                "active": false
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid": false,
                                                "active": false
                                              },
                                              {
                                                "indications": ["right"],
                                                "valid_indication": "right",
                                                "valid": true,
                                                "active": true
                                              },
                                              {
                                                "indications": ["right"],
                                                "valid_indication": "right",
                                                "valid": true,
                                                "active": true
                                              }
                                            ],
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "location": [9.261373, 45.52009],
                                            "geometry_index": 285,
                                            "admin_index": 0,
                                            "weight": 27.295,
                                            "is_urban": true,
                                            "turn_weight": 5,
                                            "duration": 20.279,
                                            "bearings": [173, 348, 359],
                                            "out": 2,
                                            "in": 0,
                                            "turn_duration": 0.01,
                                            "classes": ["motorway"],
                                            "entry": [false, true, true]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [172, 344],
                                            "duration": 2.268,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.495,
                                            "geometry_index": 297,
                                            "location": [9.261234, 45.523752]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [156, 332],
                                            "duration": 4.731,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 5.205,
                                            "geometry_index": 299,
                                            "location": [9.261036, 45.524136]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [152, 332],
                                            "duration": 3.15,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.465,
                                            "geometry_index": 300,
                                            "location": [9.260482, 45.524866]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [152, 331],
                                            "duration": 1.973,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.17,
                                            "geometry_index": 301,
                                            "location": [9.260103, 45.525365]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [151, 331],
                                            "duration": 2.91,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.201,
                                            "geometry_index": 302,
                                            "location": [9.259861, 45.525677]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [156, 341],
                                            "duration": 1.479,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.627,
                                            "geometry_index": 305,
                                            "location": [9.259522, 45.526154]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [162, 347],
                                            "duration": 1.874,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.061,
                                            "geometry_index": 307,
                                            "location": [9.259399, 45.52641]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [169, 350],
                                            "duration": 4.55,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 5.005,
                                            "geometry_index": 310,
                                            "location": [9.259293, 45.526747]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [170, 353],
                                            "duration": 2.976,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.274,
                                            "geometry_index": 311,
                                            "location": [9.259096, 45.527551]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [2, 179],
                                            "duration": 0.592,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 0.651,
                                            "geometry_index": 315,
                                            "location": [9.259037, 45.528102]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [6, 182],
                                            "duration": 3.456,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 3.802,
                                            "geometry_index": 316,
                                            "location": [9.259043, 45.528209]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [21, 194],
                                            "duration": 11.52,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 12.672,
                                            "geometry_index": 320,
                                            "location": [9.259212, 45.528839]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "classes": ["motorway"],
                                            "in": 2,
                                            "bearings": [53, 227, 233],
                                            "duration": 2.257,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.462,
                                            "geometry_index": 331,
                                            "location": [9.261147, 45.530461]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [51, 233],
                                            "duration": 4.944,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 5.438,
                                            "geometry_index": 332,
                                            "location": [9.26162, 45.530715]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [32, 216],
                                            "duration": 13.056,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 14.035,
                                            "geometry_index": 337,
                                            "location": [9.26253, 45.531384]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [166, 344],
                                            "duration": 0.55,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 0.591,
                                            "geometry_index": 351,
                                            "location": [9.263023, 45.533719]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [164, 343],
                                            "duration": 55.05,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 60.555,
                                            "geometry_index": 352,
                                            "location": [9.262982, 45.533817]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [173, 353],
                                            "duration": 4.5,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 5.062,
                                            "geometry_index": 363,
                                            "location": [9.258888, 45.543156]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [3, 179],
                                            "duration": 0.529,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 0.596,
                                            "geometry_index": 366,
                                            "location": [9.2588, 45.543915]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [5, 183],
                                            "duration": 8.841,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 9.725,
                                            "geometry_index": 367,
                                            "location": [9.258807, 45.544009]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [20, 200],
                                            "duration": 1.694,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 1.864,
                                            "geometry_index": 374,
                                            "location": [9.259315, 45.545455]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [20, 200],
                                            "duration": 0.371,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 0.408,
                                            "geometry_index": 375,
                                            "location": [9.259457, 45.545722]
                                          },
                                          {
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "location": [9.259489, 45.545783],
                                            "geometry_index": 376,
                                            "admin_index": 0,
                                            "weight": 19.2,
                                            "is_urban": true,
                                            "turn_weight": 15,
                                            "duration": 3.826,
                                            "bearings": [21, 25, 200],
                                            "out": 0,
                                            "in": 2,
                                            "turn_duration": 0.007,
                                            "classes": ["toll", "motorway"],
                                            "entry": [true, true, false]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["toll", "motorway"],
                                            "in": 1,
                                            "bearings": [20, 201],
                                            "duration": 1.495,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 1.645,
                                            "geometry_index": 377,
                                            "location": [9.259803, 45.546371]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["toll", "motorway"],
                                            "in": 1,
                                            "bearings": [20, 200],
                                            "duration": 6.686,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 7.354,
                                            "geometry_index": 379,
                                            "location": [9.259923, 45.546597]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["toll", "motorway"],
                                            "in": 1,
                                            "bearings": [20, 200],
                                            "duration": 7.354,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 8.09,
                                            "geometry_index": 381,
                                            "location": [9.260504, 45.54769]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["toll", "motorway"],
                                            "in": 1,
                                            "bearings": [21, 200],
                                            "duration": 2.678,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.946,
                                            "geometry_index": 383,
                                            "location": [9.261145, 45.548896]
                                          },
                                          {
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "location": [9.261423, 45.549412],
                                            "geometry_index": 384,
                                            "admin_index": 0,
                                            "weight": 6.971,
                                            "is_urban": true,
                                            "turn_weight": 1,
                                            "duration": 5.448,
                                            "bearings": [20, 32, 190, 201],
                                            "out": 0,
                                            "in": 3,
                                            "turn_duration": 0.019,
                                            "classes": ["toll", "motorway"],
                                            "entry": [true, true, false, false]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["toll", "motorway"],
                                            "in": 1,
                                            "bearings": [45, 209],
                                            "duration": 1.6,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 1.76,
                                            "geometry_index": 390,
                                            "location": [9.261914, 45.550187]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["toll", "motorway"],
                                            "in": 1,
                                            "bearings": [55, 228],
                                            "duration": 1.6,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 1.76,
                                            "geometry_index": 393,
                                            "location": [9.262177, 45.550362]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["toll", "motorway"],
                                            "in": 1,
                                            "bearings": [53, 235],
                                            "duration": 7.429,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 8.171,
                                            "geometry_index": 395,
                                            "location": [9.262465, 45.550505]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": [
                                              "tunnel",
                                              "toll",
                                              "motorway"
                                            ],
                                            "in": 1,
                                            "bearings": [51, 232],
                                            "duration": 1.326,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 1.459,
                                            "geometry_index": 399,
                                            "location": [9.263784, 45.551223]
                                          },
                                          {
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "location": [9.26385, 45.55126],
                                            "geometry_index": 400,
                                            "admin_index": 0,
                                            "weight": 16.667,
                                            "is_urban": true,
                                            "toll_collection": {
                                              "name": "Sesto San Giovanni",
                                              "type": "toll_booth"
                                            },
                                            "turn_weight": 15,
                                            "duration": 1.516,
                                            "bearings": [52, 231],
                                            "out": 0,
                                            "in": 1,
                                            "classes": [
                                              "tunnel",
                                              "toll",
                                              "motorway"
                                            ],
                                            "entry": [true, false]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["toll", "motorway"],
                                            "in": 1,
                                            "bearings": [52, 232],
                                            "duration": 5.771,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 6.204,
                                            "geometry_index": 401,
                                            "location": [9.263929, 45.551304]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["toll", "motorway"],
                                            "in": 1,
                                            "bearings": [57, 237],
                                            "duration": 0.457,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 0.491,
                                            "geometry_index": 405,
                                            "location": [9.264993, 45.551814]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["toll", "motorway"],
                                            "in": 1,
                                            "bearings": [57, 237],
                                            "duration": 3.829,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.116,
                                            "geometry_index": 406,
                                            "location": [9.26508, 45.551853]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["toll", "motorway"],
                                            "in": 1,
                                            "bearings": [51, 236],
                                            "duration": 6.114,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 6.573,
                                            "geometry_index": 408,
                                            "location": [9.26579, 45.552185]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["toll", "motorway"],
                                            "in": 1,
                                            "bearings": [27, 211],
                                            "duration": 0.8,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 0.86,
                                            "geometry_index": 414,
                                            "location": [9.266685, 45.552902]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["toll", "motorway"],
                                            "in": 1,
                                            "bearings": [19, 207],
                                            "duration": 13.657,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 14.681,
                                            "geometry_index": 415,
                                            "location": [9.266769, 45.553017]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["toll", "motorway"],
                                            "in": 0,
                                            "bearings": [159, 338],
                                            "duration": 0.229,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 0.246,
                                            "geometry_index": 426,
                                            "location": [9.266689, 45.555105]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "classes": ["toll", "motorway"],
                                            "in": 0,
                                            "bearings": [158, 332, 341],
                                            "duration": 7.016,
                                            "turn_duration": 0.028,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 7.512,
                                            "geometry_index": 427,
                                            "location": [9.266671, 45.555136]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["toll", "motorway"],
                                            "in": 0,
                                            "bearings": [145, 320],
                                            "duration": 12.257,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 13.483,
                                            "geometry_index": 432,
                                            "location": [9.265772, 45.556139]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["toll", "motorway"],
                                            "in": 0,
                                            "bearings": [115, 288],
                                            "duration": 8.657,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 9.523,
                                            "geometry_index": 439,
                                            "location": [9.264351, 45.556919]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": [
                                              "tunnel",
                                              "toll",
                                              "motorway"
                                            ],
                                            "in": 0,
                                            "bearings": [99, 279],
                                            "duration": 3.343,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.677,
                                            "geometry_index": 442,
                                            "location": [9.263088, 45.557115]
                                          },
                                          {
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "location": [9.262593, 45.557171],
                                            "geometry_index": 443,
                                            "admin_index": 0,
                                            "weight": 29.789,
                                            "is_urban": true,
                                            "classes": ["tunnel", "motorway"],
                                            "turn_duration": 0.021,
                                            "turn_weight": 1,
                                            "duration": 26.192,
                                            "bearings": [93, 99, 278],
                                            "out": 2,
                                            "in": 1,
                                            "entry": [false, false, true],
                                            "tunnel_name": "Galleria San Rocco"
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [126, 305],
                                            "duration": 0.73,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 0.803,
                                            "geometry_index": 449,
                                            "location": [9.257378, 45.558914]
                                          },
                                          {
                                            "entry": [false, false, true],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [38, 125, 305],
                                            "duration": 12.633,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 13.889,
                                            "geometry_index": 450,
                                            "location": [9.257227, 45.558989]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [117, 294, 308],
                                            "duration": 12.005,
                                            "turn_duration": 0.022,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 13.181,
                                            "geometry_index": 456,
                                            "location": [9.254637, 45.560182]
                                          },
                                          {
                                            "entry": [false, false, true],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [82, 93, 271],
                                            "duration": 11.289,
                                            "turn_duration": 0.022,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 12.675,
                                            "geometry_index": 465,
                                            "location": [9.251748, 45.560661]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [83, 263],
                                            "duration": 7.2,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 8.1,
                                            "geometry_index": 469,
                                            "location": [9.249584, 45.560534]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [84, 264],
                                            "duration": 12.867,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 14.475,
                                            "geometry_index": 471,
                                            "location": [9.248213, 45.560425]
                                          },
                                          {
                                            "entry": [false, false, true],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [75, 84, 263],
                                            "duration": 4.339,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 4.86,
                                            "geometry_index": 472,
                                            "location": [9.245754, 45.560238]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [83, 264, 270],
                                            "duration": 14.408,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 16.56,
                                            "geometry_index": 473,
                                            "location": [9.245222, 45.560191]
                                          },
                                          {
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "location": [9.242617, 45.560195],
                                            "geometry_index": 479,
                                            "admin_index": 0,
                                            "weight": 3.976,
                                            "is_urban": true,
                                            "turn_weight": 1,
                                            "duration": 2.597,
                                            "bearings": [89, 99, 283],
                                            "out": 2,
                                            "in": 1,
                                            "turn_duration": 0.009,
                                            "classes": ["motorway"],
                                            "entry": [false, false, true]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["tunnel", "motorway"],
                                            "in": 0,
                                            "bearings": [103, 287],
                                            "duration": 2.991,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.439,
                                            "geometry_index": 480,
                                            "location": [9.242047, 45.560287]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [109, 292],
                                            "duration": 4.669,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 5.369,
                                            "geometry_index": 482,
                                            "location": [9.241391, 45.560436]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [116, 299, 327],
                                            "duration": 4.307,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 4.943,
                                            "geometry_index": 484,
                                            "location": [9.240425, 45.560739]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["tunnel", "motorway"],
                                            "in": 0,
                                            "bearings": [126, 312],
                                            "duration": 3.904,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 4.392,
                                            "geometry_index": 487,
                                            "location": [9.239567, 45.561137]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [132, 313],
                                            "duration": 0.995,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.119,
                                            "geometry_index": 488,
                                            "location": [9.238827, 45.561596]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [133, 313],
                                            "duration": 8.384,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 9.432,
                                            "geometry_index": 489,
                                            "location": [9.238629, 45.561727]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [132, 312],
                                            "duration": 0.237,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 0.266,
                                            "geometry_index": 491,
                                            "location": [9.23697, 45.562814]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [132, 312],
                                            "duration": 21.742,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 24.46,
                                            "geometry_index": 492,
                                            "location": [9.236922, 45.562844]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["tunnel", "motorway"],
                                            "in": 0,
                                            "bearings": [126, 306],
                                            "duration": 2.031,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.285,
                                            "geometry_index": 494,
                                            "location": [9.232262, 45.565352]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [126, 311],
                                            "duration": 21.366,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 23.503,
                                            "geometry_index": 495,
                                            "location": [9.231803, 45.565587]
                                          },
                                          {
                                            "entry": [false, false, true],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [137, 146, 327],
                                            "duration": 2.644,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 2.9,
                                            "geometry_index": 500,
                                            "location": [9.227872, 45.568617]
                                          },
                                          {
                                            "tunnel_name": "De Amicis",
                                            "entry": [false, true],
                                            "classes": ["tunnel", "motorway"],
                                            "in": 0,
                                            "bearings": [147, 330],
                                            "duration": 5.967,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 6.415,
                                            "geometry_index": 501,
                                            "location": [9.227508, 45.569006]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [150, 334],
                                            "duration": 3.649,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.922,
                                            "geometry_index": 502,
                                            "location": [9.226742, 45.569953]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [154, 334],
                                            "duration": 0.341,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 0.366,
                                            "geometry_index": 503,
                                            "location": [9.226323, 45.570557]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [154, 334, 341],
                                            "duration": 9.559,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 10.268,
                                            "geometry_index": 504,
                                            "location": [9.226282, 45.570615]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [154, 334],
                                            "duration": 1.008,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.084,
                                            "geometry_index": 505,
                                            "location": [9.225175, 45.572227]
                                          },
                                          {
                                            "tunnel_name": "Montegrappa",
                                            "entry": [false, true],
                                            "classes": ["tunnel", "motorway"],
                                            "in": 0,
                                            "bearings": [154, 330],
                                            "duration": 9.378,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 10.081,
                                            "geometry_index": 506,
                                            "location": [9.22506, 45.572395]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [150, 320],
                                            "duration": 39.729,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 42.708,
                                            "geometry_index": 507,
                                            "location": [9.223701, 45.574033]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [90, 269, 275],
                                            "duration": 15.495,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 16.637,
                                            "geometry_index": 525,
                                            "location": [9.213028, 45.576742]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["tunnel", "motorway"],
                                            "in": 0,
                                            "bearings": [89, 269],
                                            "duration": 1.537,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.652,
                                            "geometry_index": 526,
                                            "location": [9.208233, 45.576698]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [89, 268],
                                            "duration": 11.52,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 12.384,
                                            "geometry_index": 527,
                                            "location": [9.207746, 45.576692]
                                          },
                                          {
                                            "entry": [false, false, true],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [52, 66, 241],
                                            "duration": 4.338,
                                            "turn_duration": 0.026,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 4.635,
                                            "geometry_index": 536,
                                            "location": [9.204358, 45.576218]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [53, 230],
                                            "duration": 18.795,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 20.205,
                                            "geometry_index": 539,
                                            "location": [9.203246, 45.575719]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [24, 205, 227],
                                            "duration": 19.679,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 21.147,
                                            "geometry_index": 546,
                                            "location": [9.200244, 45.572336]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [36, 216],
                                            "duration": 0.729,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 0.783,
                                            "geometry_index": 550,
                                            "location": [9.197558, 45.568679]
                                          },
                                          {
                                            "entry": [false, false, true],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [24, 36, 222],
                                            "duration": 6.646,
                                            "turn_duration": 0.01,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 7.134,
                                            "geometry_index": 551,
                                            "location": [9.197431, 45.568558]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [48, 234, 244],
                                            "duration": 8.747,
                                            "turn_duration": 0.01,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 9.392,
                                            "geometry_index": 554,
                                            "location": [9.196058, 45.567579]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["tunnel", "motorway"],
                                            "in": 0,
                                            "bearings": [65, 246],
                                            "duration": 1.035,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.113,
                                            "geometry_index": 567,
                                            "location": [9.193884, 45.566644]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [66, 246],
                                            "duration": 0.04,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 0.043,
                                            "geometry_index": 568,
                                            "location": [9.193618, 45.56656]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [66, 246],
                                            "duration": 2.25,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.419,
                                            "geometry_index": 569,
                                            "location": [9.193605, 45.566556]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["tunnel", "motorway"],
                                            "in": 0,
                                            "bearings": [66, 246],
                                            "duration": 1.022,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.124,
                                            "geometry_index": 570,
                                            "location": [9.193017, 45.566376]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [66, 246],
                                            "duration": 0.04,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 0.044,
                                            "geometry_index": 571,
                                            "location": [9.192751, 45.566295]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "bearings": [66, 246],
                                            "duration": 12.032,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 13.235,
                                            "geometry_index": 572,
                                            "location": [9.192738, 45.566291]
                                          },
                                          {
                                            "entry": [false, false, true],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [63, 69, 246],
                                            "duration": 0.811,
                                            "turn_duration": 0.022,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 0.868,
                                            "geometry_index": 577,
                                            "location": [9.189739, 45.565398]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["tunnel", "motorway"],
                                            "in": 0,
                                            "bearings": [66, 247],
                                            "duration": 4.846,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 5.331,
                                            "geometry_index": 578,
                                            "location": [9.189552, 45.565341]
                                          },
                                          {
                                            "bearings": [67, 246],
                                            "entry": [false, true],
                                            "classes": ["motorway"],
                                            "in": 0,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "geometry_index": 579,
                                            "location": [9.188311, 45.564966]
                                          }
                                        ],
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text":
                                                      "Como - Milano Bruzzano"
                                                }
                                              ],
                                              "type": "off ramp",
                                              "modifier": "right",
                                              "text": "Como - Milano Bruzzano"
                                            },
                                            "distanceAlongGeometry": 12352.84
                                          }
                                        ],
                                        "destinations":
                                            "Tangenziale Nord, Torino, Como, Lecco, Malpensa",
                                        "maneuver": {
                                          "type": "fork",
                                          "instruction":
                                              "Mantieni la destra per prendere A52/Tangenziale Nord di Milano verso Tangenziale Nord/Torino/Como/Lecco.",
                                          "modifier": "slight right",
                                          "bearing_after": 359,
                                          "bearing_before": 353,
                                          "location": [9.261373, 45.52009]
                                        },
                                        "name": "Tangenziale Nord di Milano",
                                        "duration": 626.225,
                                        "distance": 12352.84,
                                        "driving_side": "right",
                                        "weight": 724.605,
                                        "mode": "driving",
                                        "ref": "A52",
                                        "geometry":
                                            "sliyuAyrgtPwYJ__AtPeDd@wFd@kFLmFEuG_@wLmAwr@mHoJo@mIMgMxAmKxCqJpFsl@ra@e^tVoRbNsJ`HyIxFkFhCsGrCkF`B}DhA}Cp@eIvAgq@hKcFp@eHj@}HVeG?uEKgIg@aHeA{HiBeIyBeJ_EiEaCqH{E_EwCqEyDsHsHcHqI}HmLuFqKkFcL_Qca@{Nq\\wDyIaHiMyGsJaG}HcIeIgJ_I{IeGoKgFkIeDaIeCqOkCqIs@kIYgIPqH^yJz@aKpB{F`By@VcEpAmuBrs@uy@rYuIbDaJ`EmLnG{HjFgKlHgIzGwhAfaAkl@rX{zEjf@_V`CwLf@uID{DMgDMqKy@mKuAwJuBiKuCoI{CqXqLuO{GyB_Awc@sRgEkB{FcCmY_M{h@iU{PoHox@q]g_@kPcKgEaH{CyGoDgDuB}EaDgEiDcC{CsBuDeB{DcB{DyDcKsAkDmGmN}Qqa@{MaZiAcCwA}C{BcFoDeIqMo^}FuPmAmDkFkOkL_[qDgI{EkJiHgKqGkH}IaIqBsAeFgDwHaD_JqCgMsBkLeAkHUmHIsKr@wLfBkJ~B_NnEqI`E}@b@wHdFwH~FaSlQ{O~NgEpEwGdI}CjEkCvDeChFyKdViJ~XkA~H_BtKgC|T_Dhk@oB|]}D`x@yKj_AiD`TgE~ScJl\\obA~cCuClHcOr_@m[jx@eIxTkFzNkGbUaC`K}ClNgEbUgDnUsCrXgBlSsAbSw@hU_@zUGbHG|KH|Q~@d_@zDdfAhBpf@nBbm@tJtxC|Af`@nB~j@RxPHvWU|^g@jSwA|VwDrb@wB`QqD|UeG|[wIl^cCrJaEbLuMz[u[fm@eGjKez@pxAwGbM{@~Asp@~nAcjBfrEuMt[ke@b~@yc@bt@kh@js@ue@dk@ca@z_@iWvUez@zn@wd@dYsBpAwcBddAoIdFkeB|sAqGlIuFrG}HfKuKtOcIbMiH~LiJhQmIrQoGfOsFnNqH`T_FzOeE|NkO`l@_PvaAqKfxAsCx_ADniEvAtjHJl]Xfg@LdMR|Jb@zM~Bdb@jBxSvBpQtEtZxGf[jGjTrJbZdJ~SvAdDnQn\\bPxUlRjT~QlQ|SxOtpBnhA|{A~|@hsAjx@hVbR~Zj\\pF|FbWl^`JpL~Xxg@nFzMfFxL|CvHvCzHtCfIpDvK`DfKlBtGtAbF~A~FjBtHlBhIvAnGfDrOFXfJvc@`DrOFXri@xjCnBhK~BpMxAjIzAjIpBtJlVplAxGr[nEpTlD|PpFxXfGr[|EnWvCdPjC|N~CfQ"
                                      },
                                      {
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Prosegui per 1,5 miglia.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Prosegui per 1,5 miglia.",
                                            "distanceAlongGeometry": 2306.885
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra mezzo miglio, Prendi l'uscita <say-as interpret-as=\"address\">5</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra mezzo miglio, Prendi l'uscita 5.",
                                            "distanceAlongGeometry": 804.672
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Prendi l'uscita <say-as interpret-as=\"address\">5</say-as> verso <say-as interpret-as=\"address\">Incirano,Nova Milanese</say-as>. poi Entra nella rotonda e prendi la 1a uscita.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Prendi l'uscita 5 verso Incirano,Nova Milanese. poi Entra nella rotonda e prendi la 1a uscita.",
                                            "distanceAlongGeometry": 252.778
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [69, 245, 252],
                                            "duration": 29.599,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "trunk_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 32.549,
                                            "geometry_index": 588,
                                            "location": [9.185136, 45.564044]
                                          },
                                          {
                                            "entry": [false, true],
                                            "in": 0,
                                            "bearings": [72, 255],
                                            "duration": 37.617,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "trunk_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 40.429,
                                            "geometry_index": 603,
                                            "location": [9.181015, 45.563118]
                                          },
                                          {
                                            "entry": [false, false, true],
                                            "in": 0,
                                            "bearings": [171, 175, 355],
                                            "duration": 4.735,
                                            "turn_weight": 11,
                                            "turn_duration": 0.01,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 16.079,
                                            "geometry_index": 624,
                                            "location": [9.177498, 45.565604]
                                          },
                                          {
                                            "entry": [false, true],
                                            "in": 0,
                                            "bearings": [175, 355],
                                            "duration": 2.081,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.237,
                                            "geometry_index": 625,
                                            "location": [9.177403, 45.566359]
                                          },
                                          {
                                            "entry": [false, true],
                                            "in": 0,
                                            "bearings": [175, 354],
                                            "duration": 1.854,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.994,
                                            "geometry_index": 626,
                                            "location": [9.177362, 45.56669]
                                          },
                                          {
                                            "entry": [false, true],
                                            "in": 0,
                                            "bearings": [174, 354],
                                            "duration": 6.273,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 6.743,
                                            "geometry_index": 627,
                                            "location": [9.177319, 45.566993]
                                          },
                                          {
                                            "entry": [true, false, true],
                                            "in": 1,
                                            "bearings": [0, 174, 354],
                                            "duration": 61.164,
                                            "turn_duration": 0.021,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 65.729,
                                            "geometry_index": 628,
                                            "location": [9.177164, 45.568024]
                                          },
                                          {
                                            "bearings": [158, 174, 354],
                                            "entry": [false, false, true],
                                            "in": 1,
                                            "turn_duration": 0.021,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "geometry_index": 630,
                                            "location": [9.175804, 45.577742]
                                          }
                                        ],
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "exit",
                                                  "text": "Uscita"
                                                },
                                                {
                                                  "type": "exit-number",
                                                  "text": "5"
                                                },
                                                {
                                                  "type": "text",
                                                  "text":
                                                      "Incirano,Nova Milanese"
                                                }
                                              ],
                                              "type": "off ramp",
                                              "modifier": "right",
                                              "text":
                                                  "Uscita 5 Incirano,Nova Milanese"
                                            },
                                            "distanceAlongGeometry": 2336.885
                                          },
                                          {
                                            "sub": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text":
                                                      "Entra nella rotonda e prendi la 1a uscita"
                                                }
                                              ],
                                              "degrees": 84,
                                              "driving_side": "right",
                                              "type": "roundabout",
                                              "modifier": "right",
                                              "text":
                                                  "Entra nella rotonda e prendi la 1a uscita"
                                            },
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "exit",
                                                  "text": "Uscita"
                                                },
                                                {
                                                  "type": "exit-number",
                                                  "text": "5"
                                                },
                                                {
                                                  "type": "text",
                                                  "text":
                                                      "Incirano,Nova Milanese"
                                                }
                                              ],
                                              "type": "off ramp",
                                              "modifier": "right",
                                              "text":
                                                  "Uscita 5 Incirano,Nova Milanese"
                                            },
                                            "distanceAlongGeometry": 804.672
                                          }
                                        ],
                                        "destinations":
                                            "Como - Milano Bruzzano",
                                        "maneuver": {
                                          "type": "off ramp",
                                          "instruction":
                                              "Prendi l'uscita Como - Milano Bruzzano.",
                                          "modifier": "slight right",
                                          "bearing_after": 252,
                                          "bearing_before": 249,
                                          "location": [9.185136, 45.564044]
                                        },
                                        "name": "",
                                        "duration": 152.344,
                                        "distance": 2336.885,
                                        "driving_side": "right",
                                        "weight": 175.437,
                                        "mode": "driving",
                                        "ref": "SPexSS35",
                                        "geometry":
                                            "wg_|uA_vroPrFv`@`BlK|AhK`CbP`A`H~@tG|@zGp@~F~@zHrA|KlBzOfB`OfAzHvBbOhNp`AzDf^pAdNt@`NTrNA`KW`Ky@jNeAxKuAxHuBlIqB`G_DpG{CzEoD|DgEhDyEhCgFtB_G`BuIhB}[bEccAzMen@|DuSpA}QtAm_AtHaeL|y@ixD`YasAzJ"
                                      },
                                      {
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Entra nella rotonda e prendi la 1a uscita.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Entra nella rotonda e prendi la 1a uscita.",
                                            "distanceAlongGeometry": 154
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [true, false, true],
                                            "in": 1,
                                            "bearings": [5, 174, 355],
                                            "duration": 8.382,
                                            "turn_duration": 0.014,
                                            "mapbox_streets_v8": {
                                              "class": "trunk_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 8.995,
                                            "geometry_index": 631,
                                            "location": [9.175614, 45.579087]
                                          },
                                          {
                                            "entry": [true, false, true],
                                            "in": 1,
                                            "bearings": [77, 237, 269],
                                            "duration": 6.753,
                                            "turn_duration": 0.026,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 7.231,
                                            "geometry_index": 640,
                                            "location": [9.176138, 45.579711]
                                          },
                                          {
                                            "bearings": [77, 112, 258],
                                            "entry": [false, true, false],
                                            "turn_weight": 0.75,
                                            "turn_duration": 0.072,
                                            "in": 2,
                                            "yield_sign": true,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "geometry_index": 642,
                                            "location": [9.17703, 45.579854]
                                          }
                                        ],
                                        "exits": "5",
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text":
                                                      "Entra nella rotonda e prendi la 1a uscita"
                                                }
                                              ],
                                              "degrees": 84,
                                              "driving_side": "right",
                                              "type": "roundabout",
                                              "modifier": "right",
                                              "text":
                                                  "Entra nella rotonda e prendi la 1a uscita"
                                            },
                                            "distanceAlongGeometry": 180.486
                                          }
                                        ],
                                        "destinations":
                                            "Incirano,Nova Milanese",
                                        "maneuver": {
                                          "type": "off ramp",
                                          "instruction":
                                              "Prendi l'uscita 5 verso Incirano,Nova Milanese.",
                                          "modifier": "slight right",
                                          "bearing_after": 5,
                                          "bearing_before": 354,
                                          "location": [9.175614, 45.579087]
                                        },
                                        "name": "Uscita 5",
                                        "duration": 19.15,
                                        "distance": 180.486,
                                        "driving_side": "right",
                                        "weight": 21.214,
                                        "mode": "driving",
                                        "ref": "SS35",
                                        "geometry":
                                            "}s||uA{b`oPmEEaD_@wDy@kCmAgByA{BeCgC_EyAaEeBgGwD}a@eBySNiETkBZgAh@_At@aA"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "sub": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Via Valassina"
                                                }
                                              ],
                                              "type": "turn",
                                              "modifier": "slight right",
                                              "text": "Via Valassina"
                                            },
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Esci dalla rotonda"
                                                }
                                              ],
                                              "degrees": 84,
                                              "driving_side": "right",
                                              "type": "roundabout",
                                              "modifier": "right",
                                              "text": "Esci dalla rotonda"
                                            },
                                            "distanceAlongGeometry": 7.289
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Esci dalla rotonda. poi Svolta a destra su <say-as interpret-as=\"address\">Via Valassina</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Esci dalla rotonda. poi Svolta a destra su Via Valassina.",
                                            "distanceAlongGeometry": 7.289
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "bearings": [39, 166, 296],
                                            "entry": [false, true, false],
                                            "in": 2,
                                            "turn_weight": 9,
                                            "turn_duration": 0.194,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "geometry_index": 647,
                                            "location": [9.177286, 45.579773]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "roundabout",
                                          "exit": 1,
                                          "instruction":
                                              "Entra nella rotonda e prendi la 1a uscita.",
                                          "modifier": "right",
                                          "bearing_after": 166,
                                          "bearing_before": 116,
                                          "location": [9.177286, 45.579773]
                                        },
                                        "name": "",
                                        "duration": 1.29,
                                        "distance": 7.289,
                                        "driving_side": "right",
                                        "weight": 10.178,
                                        "mode": "driving",
                                        "geometry": "y~}|uAkkcoP~@K|@a@"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Via Valassina"
                                                }
                                              ],
                                              "type": "turn",
                                              "modifier": "slight right",
                                              "text": "Via Valassina"
                                            },
                                            "distanceAlongGeometry": 27.289
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Svolta a destra su <say-as interpret-as=\"address\">Via Valassina</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Svolta a destra su Via Valassina.",
                                            "distanceAlongGeometry": 27.289
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "bearings": [130, 200, 346],
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "turn_weight": 1.125,
                                            "turn_duration": 0.067,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "geometry_index": 649,
                                            "location": [9.177309, 45.57971]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "exit roundabout",
                                          "instruction": "Esci dalla rotonda.",
                                          "modifier": "slight right",
                                          "bearing_after": 200,
                                          "bearing_before": 166,
                                          "location": [9.177309, 45.57971]
                                        },
                                        "name": "",
                                        "duration": 3.307,
                                        "distance": 27.289,
                                        "driving_side": "right",
                                        "weight": 4.608,
                                        "mode": "driving",
                                        "geometry":
                                            "{z}|uAylcoPrAGx@Dz@\\n@d@`AlAzA|C"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Via Valassina"
                                                }
                                              ],
                                              "degrees": 195,
                                              "driving_side": "right",
                                              "type": "roundabout",
                                              "modifier": "right",
                                              "text": "Via Valassina"
                                            },
                                            "distanceAlongGeometry": 320.809
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra un quarto di miglio, Entra nella rotonda e prendi la 3a uscita per <say-as interpret-as=\"address\">Via Valassina</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra un quarto di miglio, Entra nella rotonda e prendi la 3a uscita per Via Valassina.",
                                            "distanceAlongGeometry": 304.143
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Entra nella rotonda e prendi la 3a uscita per <say-as interpret-as=\"address\">Via Valassina</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Entra nella rotonda e prendi la 3a uscita per Via Valassina.",
                                            "distanceAlongGeometry": 210
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [36, 62, 240],
                                            "duration": 2.239,
                                            "turn_weight": 6.125,
                                            "turn_duration": 0.03,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 8.5,
                                            "geometry_index": 655,
                                            "location": [9.177158, 45.579506]
                                          },
                                          {
                                            "entry": [false, true],
                                            "in": 0,
                                            "bearings": [60, 240],
                                            "duration": 7.282,
                                            "turn_weight": 0.75,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 8.578,
                                            "geometry_index": 656,
                                            "location": [9.176855, 45.579382]
                                          },
                                          {
                                            "entry": [false, true],
                                            "in": 0,
                                            "bearings": [71, 252],
                                            "duration": 2.925,
                                            "turn_weight": 0.75,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.894,
                                            "geometry_index": 662,
                                            "location": [9.175825, 45.579044]
                                          },
                                          {
                                            "entry": [false, true],
                                            "in": 0,
                                            "bearings": [72, 255],
                                            "duration": 12.032,
                                            "turn_weight": 0.75,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 13.684,
                                            "geometry_index": 663,
                                            "location": [9.175346, 45.578935]
                                          },
                                          {
                                            "entry": [false, true],
                                            "in": 0,
                                            "bearings": [87, 267],
                                            "duration": 1.895,
                                            "turn_weight": 0.75,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.787,
                                            "geometry_index": 669,
                                            "location": [9.173739, 45.578798]
                                          },
                                          {
                                            "bearings": [87, 177, 266, 313],
                                            "entry": [false, true, false, true],
                                            "turn_weight": 2,
                                            "turn_duration": 0.149,
                                            "in": 0,
                                            "yield_sign": true,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 3,
                                            "geometry_index": 670,
                                            "location": [9.173478, 45.57879]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "turn",
                                          "instruction":
                                              "Svolta a destra su Via Valassina.",
                                          "modifier": "slight right",
                                          "bearing_after": 240,
                                          "bearing_before": 216,
                                          "location": [9.177158, 45.579506]
                                        },
                                        "name": "Via Valassina",
                                        "duration": 30.122,
                                        "distance": 320.809,
                                        "driving_side": "right",
                                        "weight": 43.313,
                                        "mode": "driving",
                                        "geometry":
                                            "cn}|uAkccoPvF|QbDlKpBpHnA|EzA|GdBxIzBtNxE|\\x@fHz@fIx@dLb@pKPfKj@|i@NhOY|Ac@nAa@x@m@j@kAt@"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Via Valassina"
                                                }
                                              ],
                                              "degrees": 195,
                                              "driving_side": "right",
                                              "type": "roundabout",
                                              "modifier": "right",
                                              "text": "Via Valassina"
                                            },
                                            "distanceAlongGeometry": 53.481
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Esci dalla rotonda su <say-as interpret-as=\"address\">Via Valassina</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Esci dalla rotonda su Via Valassina.",
                                            "distanceAlongGeometry": 35.556
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [false, false, true],
                                            "in": 0,
                                            "bearings": [133, 218, 354],
                                            "duration": 1.187,
                                            "turn_weight": 1.125,
                                            "turn_duration": 0.107,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 2.286,
                                            "geometry_index": 675,
                                            "location": [9.173313, 45.578899]
                                          },
                                          {
                                            "entry": [true, false, true],
                                            "in": 1,
                                            "bearings": [38, 174, 314],
                                            "duration": 2.925,
                                            "turn_duration": 0.405,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 2.709,
                                            "geometry_index": 677,
                                            "location": [9.173305, 45.578957]
                                          },
                                          {
                                            "entry": [false, false, true],
                                            "in": 1,
                                            "bearings": [75, 134, 278],
                                            "duration": 0.644,
                                            "turn_duration": 0.301,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 0.369,
                                            "geometry_index": 681,
                                            "location": [9.173174, 45.579045]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [98, 248, 306],
                                            "duration": 2.319,
                                            "turn_duration": 0.192,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.287,
                                            "geometry_index": 682,
                                            "location": [9.173143, 45.579048]
                                          },
                                          {
                                            "bearings": [4, 68, 194],
                                            "entry": [false, false, true],
                                            "in": 1,
                                            "turn_duration": 1.016,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "geometry_index": 686,
                                            "location": [9.172987, 45.579004]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "roundabout",
                                          "exit": 3,
                                          "instruction":
                                              "Entra nella rotonda e prendi la 3a uscita per Via Valassina.",
                                          "modifier": "slight right",
                                          "bearing_after": 354,
                                          "bearing_before": 313,
                                          "location": [9.173313, 45.578899]
                                        },
                                        "name": "Via Valassina",
                                        "duration": 10.873,
                                        "distance": 53.481,
                                        "driving_side": "right",
                                        "weight": 10.641,
                                        "mode": "driving",
                                        "geometry":
                                            "eh||uAas{nPw@D{@Hi@^}@hAk@nA[jAE|@FzAHhAXfAj@hAr@t@x@b@~@Jx@Bn@G"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Via Renato Serra"
                                                }
                                              ],
                                              "degrees": 90,
                                              "driving_side": "right",
                                              "type": "roundabout",
                                              "modifier": "right",
                                              "text": "Via Renato Serra"
                                            },
                                            "distanceAlongGeometry": 394.855
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra un quarto di miglio, Entra nella rotonda e prendi la 1a uscita per <say-as interpret-as=\"address\">Via Renato Serra</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra un quarto di miglio, Entra nella rotonda e prendi la 1a uscita per Via Renato Serra.",
                                            "distanceAlongGeometry": 364.855
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Entra nella rotonda e prendi la 1a uscita per <say-as interpret-as=\"address\">Via Renato Serra</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Entra nella rotonda e prendi la 1a uscita per Via Renato Serra.",
                                            "distanceAlongGeometry": 122.222
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [14, 139, 216],
                                            "duration": 2.878,
                                            "turn_weight": 1.125,
                                            "turn_duration": 0.028,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 4.189,
                                            "geometry_index": 691,
                                            "location": [9.172938, 45.578864]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [36, 79, 251],
                                            "duration": 28.782,
                                            "turn_weight": 1.125,
                                            "turn_duration": 0.067,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 31.993,
                                            "geometry_index": 696,
                                            "location": [9.172803, 45.578734]
                                          },
                                          {
                                            "entry": [false, true],
                                            "in": 0,
                                            "bearings": [77, 257],
                                            "duration": 1.457,
                                            "turn_weight": 0.75,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.316,
                                            "geometry_index": 702,
                                            "location": [9.168718, 45.577808]
                                          },
                                          {
                                            "entry": [false, false, true],
                                            "in": 0,
                                            "bearings": [77, 246, 267],
                                            "duration": 1.214,
                                            "turn_weight": 1,
                                            "turn_duration": 0.014,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 2.29,
                                            "geometry_index": 703,
                                            "location": [9.168507, 45.577774]
                                          },
                                          {
                                            "bearings": [87, 163, 269, 317],
                                            "entry": [
                                              false,
                                              false,
                                              true,
                                              false
                                            ],
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.008,
                                            "in": 0,
                                            "yield_sign": true,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "geometry_index": 704,
                                            "location": [9.168435, 45.577771]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "exit roundabout",
                                          "instruction":
                                              "Esci dalla rotonda verso Via Valassina.",
                                          "modifier": "slight right",
                                          "bearing_after": 216,
                                          "bearing_before": 194,
                                          "location": [9.172938, 45.578864]
                                        },
                                        "name": "Via Valassina",
                                        "duration": 38.138,
                                        "distance": 394.855,
                                        "driving_side": "right",
                                        "weight": 46.373,
                                        "mode": "driving",
                                        "geometry":
                                            "_f||uAs{znPt@Dt@d@r@p@z@rAf@zAdRroArR~nAvFp`@nC`TfBjQpBtTbAdLDnC@rD@hD?dC"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Via Renato Serra"
                                                }
                                              ],
                                              "degrees": 90,
                                              "driving_side": "right",
                                              "type": "roundabout",
                                              "modifier": "right",
                                              "text": "Via Renato Serra"
                                            },
                                            "distanceAlongGeometry": 3.156
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Esci dalla rotonda su <say-as interpret-as=\"address\">Via Renato Serra</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Esci dalla rotonda su Via Renato Serra.",
                                            "distanceAlongGeometry": 3.156
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "bearings": [89, 162, 297],
                                            "entry": [false, false, true],
                                            "in": 0,
                                            "turn_weight": 6.125,
                                            "turn_duration": 0.045,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "geometry_index": 707,
                                            "location": [9.168193, 45.577769]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "roundabout",
                                          "exit": 1,
                                          "instruction":
                                              "Entra nella rotonda e prendi la 1a uscita per Via Renato Serra.",
                                          "modifier": "slight right",
                                          "bearing_after": 297,
                                          "bearing_before": 269,
                                          "location": [9.168193, 45.577769]
                                        },
                                        "name": "Via Renato Serra",
                                        "duration": 0.585,
                                        "distance": 3.156,
                                        "driving_side": "right",
                                        "weight": 6.705,
                                        "mode": "driving",
                                        "geometry": "qaz|uAasqnPYfA"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Viale Europa"
                                                },
                                                {
                                                  "type": "delimiter",
                                                  "text": "/"
                                                },
                                                {
                                                  "mapbox_shield": {
                                                    "text_color": "white",
                                                    "name": "rectangle-blue",
                                                    "display_ref": "SP119",
                                                    "base_url":
                                                        "https://api.mapbox.com/styles/v1"
                                                  },
                                                  "type": "icon",
                                                  "text": "SP119"
                                                }
                                              ],
                                              "degrees": 273,
                                              "driving_side": "right",
                                              "type": "roundabout",
                                              "modifier": "right",
                                              "text": "Viale Europa / SP119"
                                            },
                                            "distanceAlongGeometry": 228.267
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra 700 piedi, Entra nella rotonda e prendi la 3a uscita per <say-as interpret-as=\"address\">Viale Europa</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra 700 piedi, Entra nella rotonda e prendi la 3a uscita per Viale Europa.",
                                            "distanceAlongGeometry": 211.601
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Entra nella rotonda e prendi la 3a uscita per <say-as interpret-as=\"address\">Viale Europa</say-as>, <say-as interpret-as=\"address\">SP119</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Entra nella rotonda e prendi la 3a uscita per Viale Europa, SP119.",
                                            "distanceAlongGeometry": 122.222
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [117, 249, 323],
                                            "duration": 2.78,
                                            "turn_weight": 6.8,
                                            "turn_duration": 0.037,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 9.749,
                                            "geometry_index": 708,
                                            "location": [9.168157, 45.577782]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [143, 180, 347],
                                            "duration": 5.324,
                                            "turn_weight": 1.125,
                                            "turn_duration": 0.03,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 6.816,
                                            "geometry_index": 711,
                                            "location": [9.168031, 45.577899]
                                          },
                                          {
                                            "entry": [false, true],
                                            "in": 0,
                                            "bearings": [167, 347],
                                            "duration": 14.506,
                                            "turn_weight": 0.75,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 16.344,
                                            "geometry_index": 712,
                                            "location": [9.167884, 45.578339]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              false,
                                              false,
                                              true
                                            ],
                                            "in": 1,
                                            "bearings": [75, 168, 255, 347],
                                            "duration": 0.338,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.021,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 3,
                                            "weight": 1.841,
                                            "geometry_index": 714,
                                            "location": [9.167504, 45.579542]
                                          },
                                          {
                                            "bearings": [11, 167, 324],
                                            "entry": [true, false, false],
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.032,
                                            "in": 1,
                                            "yield_sign": true,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "geometry_index": 715,
                                            "location": [9.167495, 45.579569]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "exit roundabout",
                                          "instruction":
                                              "Esci dalla rotonda verso Via Renato Serra.",
                                          "modifier": "slight right",
                                          "bearing_after": 323,
                                          "bearing_before": 297,
                                          "location": [9.168157, 45.577782]
                                        },
                                        "name": "Via Renato Serra",
                                        "duration": 27.181,
                                        "distance": 228.267,
                                        "driving_side": "right",
                                        "weight": 40.765,
                                        "mode": "driving",
                                        "geometry":
                                            "kbz|uAypqnPuArBwAvA{@n@oZdHiCl@{eAhUu@PsBD{ASmA]qA_A"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Viale Europa"
                                                },
                                                {
                                                  "type": "delimiter",
                                                  "text": "/"
                                                },
                                                {
                                                  "mapbox_shield": {
                                                    "text_color": "white",
                                                    "name": "rectangle-blue",
                                                    "display_ref": "SP119",
                                                    "base_url":
                                                        "https://api.mapbox.com/styles/v1"
                                                  },
                                                  "type": "icon",
                                                  "text": "SP119"
                                                }
                                              ],
                                              "degrees": 273,
                                              "driving_side": "right",
                                              "type": "roundabout",
                                              "modifier": "straight",
                                              "text": "Viale Europa / SP119"
                                            },
                                            "distanceAlongGeometry": 51.282
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Esci dalla rotonda su <say-as interpret-as=\"address\">Viale Europa</say-as>, <say-as interpret-as=\"address\">SP119</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Esci dalla rotonda su Viale Europa, SP119.",
                                            "distanceAlongGeometry": 37.778
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [true, false, false],
                                            "in": 1,
                                            "bearings": [27, 192, 253],
                                            "duration": 1.1,
                                            "turn_weight": 6.125,
                                            "turn_duration": 0.02,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 7.286,
                                            "geometry_index": 719,
                                            "location": [9.167549, 45.579753]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [9, 125, 207],
                                            "duration": 0.859,
                                            "turn_duration": 0.077,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 0.841,
                                            "geometry_index": 721,
                                            "location": [9.167582, 45.579799]
                                          },
                                          {
                                            "entry": [true, false, true],
                                            "in": 1,
                                            "bearings": [28, 189, 320],
                                            "duration": 3.96,
                                            "turn_duration": 0.72,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 3.483,
                                            "geometry_index": 723,
                                            "location": [9.167593, 45.579846]
                                          },
                                          {
                                            "bearings": [75, 140, 243],
                                            "entry": [false, false, true],
                                            "in": 1,
                                            "turn_duration": 3.332,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "geometry_index": 728,
                                            "location": [9.167453, 45.579962]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "roundabout",
                                          "exit": 3,
                                          "instruction":
                                              "Entra nella rotonda e prendi la 3a uscita per Viale Europa/SP119.",
                                          "modifier": "slight right",
                                          "bearing_after": 27,
                                          "bearing_before": 12,
                                          "location": [9.167549, 45.579753]
                                        },
                                        "name": "Viale Europa",
                                        "duration": 12.552,
                                        "distance": 51.282,
                                        "driving_side": "right",
                                        "weight": 15.158,
                                        "mode": "driving",
                                        "ref": "SP119",
                                        "geometry":
                                            "q}}|uAyjpnPg@a@s@_@o@Qm@Cw@J}@j@y@fA]`AYtAIzAB~AVxAd@fAr@v@~@j@"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Viale Europa"
                                                },
                                                {
                                                  "type": "delimiter",
                                                  "text": "/"
                                                },
                                                {
                                                  "mapbox_shield": {
                                                    "text_color": "white",
                                                    "name": "rectangle-blue",
                                                    "display_ref": "SP119",
                                                    "base_url":
                                                        "https://api.mapbox.com/styles/v1"
                                                  },
                                                  "type": "icon",
                                                  "text": "SP119"
                                                }
                                              ],
                                              "degrees": 130,
                                              "driving_side": "right",
                                              "type": "roundabout",
                                              "modifier": "right",
                                              "text": "Viale Europa / SP119"
                                            },
                                            "distanceAlongGeometry": 490.622
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra un quarto di miglio, Entra nella rotonda e prendi la 2a uscita per <say-as interpret-as=\"address\">Viale Europa</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra un quarto di miglio, Entra nella rotonda e prendi la 2a uscita per Viale Europa.",
                                            "distanceAlongGeometry": 473.955
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Entra nella rotonda e prendi la 2a uscita per <say-as interpret-as=\"address\">Viale Europa</say-as>, <say-as interpret-as=\"address\">SP119</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Entra nella rotonda e prendi la 2a uscita per Viale Europa, SP119.",
                                            "distanceAlongGeometry": 122.222
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [59, 169, 229],
                                            "duration": 2.353,
                                            "turn_weight": 0.75,
                                            "turn_duration": 0.038,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 3.238,
                                            "geometry_index": 734,
                                            "location": [9.167228, 45.579876]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [49, 99, 255],
                                            "duration": 0.409,
                                            "turn_weight": 1.125,
                                            "turn_duration": 0.04,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 1.522,
                                            "geometry_index": 738,
                                            "location": [9.167056, 45.57977]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              false,
                                              true,
                                              false
                                            ],
                                            "in": 0,
                                            "bearings": [75, 162, 255, 341],
                                            "duration": 8.961,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 10.901,
                                            "geometry_index": 739,
                                            "location": [9.167001, 45.57976]
                                          },
                                          {
                                            "entry": [false, true, true, true],
                                            "in": 0,
                                            "bearings": [75, 165, 255, 345],
                                            "duration": 3.529,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 5.198,
                                            "geometry_index": 740,
                                            "location": [9.165806, 45.579532]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              false,
                                              true,
                                              false
                                            ],
                                            "in": 0,
                                            "bearings": [75, 163, 255, 342],
                                            "duration": 3.685,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 5.362,
                                            "geometry_index": 741,
                                            "location": [9.165249, 45.579425]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [75, 255, 345],
                                            "duration": 8.965,
                                            "turn_weight": 0.75,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 10.156,
                                            "geometry_index": 742,
                                            "location": [9.164666, 45.579312]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              false,
                                              true,
                                              false
                                            ],
                                            "in": 0,
                                            "bearings": [75, 163, 255, 344],
                                            "duration": 12.649,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 14.774,
                                            "geometry_index": 743,
                                            "location": [9.16334, 45.57906]
                                          },
                                          {
                                            "bearings": [
                                              78,
                                              175,
                                              248,
                                              284,
                                              358
                                            ],
                                            "entry": [
                                              false,
                                              false,
                                              false,
                                              true,
                                              false
                                            ],
                                            "turn_weight": 2,
                                            "turn_duration": 0.042,
                                            "in": 0,
                                            "yield_sign": true,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 3,
                                            "geometry_index": 747,
                                            "location": [9.161458, 45.578757]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "exit roundabout",
                                          "instruction":
                                              "Esci dalla rotonda verso Viale Europa/SP119.",
                                          "modifier": "straight",
                                          "bearing_after": 229,
                                          "bearing_before": 239,
                                          "location": [9.167228, 45.579876]
                                        },
                                        "name": "Viale Europa",
                                        "duration": 44.992,
                                        "distance": 490.622,
                                        "driving_side": "right",
                                        "weight": 57.771,
                                        "mode": "driving",
                                        "ref": "SP119",
                                        "geometry":
                                            "ge~|uAwvonPv@~@v@jAv@~Aj@jBRlBfMtiAtExa@`Flc@vNzqAdCzThD~^tDpd@vBdYG|BOdC]hCg@pC"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Viale Europa"
                                                },
                                                {
                                                  "type": "delimiter",
                                                  "text": "/"
                                                },
                                                {
                                                  "mapbox_shield": {
                                                    "text_color": "white",
                                                    "name": "rectangle-blue",
                                                    "display_ref": "SP119",
                                                    "base_url":
                                                        "https://api.mapbox.com/styles/v1"
                                                  },
                                                  "type": "icon",
                                                  "text": "SP119"
                                                }
                                              ],
                                              "degrees": 130,
                                              "driving_side": "right",
                                              "type": "roundabout",
                                              "modifier": "right",
                                              "text": "Viale Europa / SP119"
                                            },
                                            "distanceAlongGeometry": 22.456
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Esci dalla rotonda su <say-as interpret-as=\"address\">Viale Europa</say-as>, <say-as interpret-as=\"address\">SP119</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Esci dalla rotonda su Viale Europa, SP119.",
                                            "distanceAlongGeometry": 22.456
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [false, false, true],
                                            "in": 0,
                                            "bearings": [104, 177, 311],
                                            "duration": 0.842,
                                            "turn_weight": 1.125,
                                            "turn_duration": 0.042,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 1.965,
                                            "geometry_index": 751,
                                            "location": [9.161186, 45.578804]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [131, 278, 351],
                                            "duration": 2.126,
                                            "turn_duration": 0.241,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.98,
                                            "geometry_index": 752,
                                            "location": [9.161148, 45.578827]
                                          },
                                          {
                                            "bearings": [38, 98, 229],
                                            "entry": [false, false, true],
                                            "in": 1,
                                            "turn_duration": 0.772,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 2,
                                            "geometry_index": 755,
                                            "location": [9.161012, 45.578841]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "roundabout",
                                          "exit": 2,
                                          "instruction":
                                              "Entra nella rotonda e prendi la 2a uscita per Viale Europa/SP119.",
                                          "modifier": "slight right",
                                          "bearing_after": 311,
                                          "bearing_before": 284,
                                          "location": [9.161186, 45.578804]
                                        },
                                        "name": "Viale Europa",
                                        "duration": 5.341,
                                        "distance": 22.456,
                                        "driving_side": "right",
                                        "weight": 5.625,
                                        "mode": "driving",
                                        "ref": "SP119",
                                        "geometry":
                                            "gb||uAc}cnPm@jAYlAE~AB`B^jAv@dA"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Via per la Stazione"
                                                },
                                                {
                                                  "type": "delimiter",
                                                  "text": "/"
                                                },
                                                {
                                                  "mapbox_shield": {
                                                    "text_color": "white",
                                                    "name": "rectangle-blue",
                                                    "display_ref": "SP119",
                                                    "base_url":
                                                        "https://api.mapbox.com/styles/v1"
                                                  },
                                                  "type": "icon",
                                                  "text": "SP119"
                                                }
                                              ],
                                              "degrees": 42,
                                              "driving_side": "right",
                                              "type": "roundabout",
                                              "modifier": "right",
                                              "text":
                                                  "Via per la Stazione / SP119"
                                            },
                                            "distanceAlongGeometry": 434.457
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra un quarto di miglio, Entra nella rotonda e prendi la 2a uscita per <say-as interpret-as=\"address\">Via per la Stazione</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra un quarto di miglio, Entra nella rotonda e prendi la 2a uscita per Via per la Stazione.",
                                            "distanceAlongGeometry": 417.79
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Entra nella rotonda e prendi la 2a uscita per <say-as interpret-as=\"address\">Via per la Stazione</say-as>, <say-as interpret-as=\"address\">SP119</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Entra nella rotonda e prendi la 2a uscita per Via per la Stazione, SP119.",
                                            "distanceAlongGeometry": 133.333
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [49, 177, 250],
                                            "duration": 1.83,
                                            "turn_weight": 1.125,
                                            "turn_duration": 0.03,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 3.015,
                                            "geometry_index": 757,
                                            "location": [9.160939, 45.578797]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              false,
                                              true,
                                              false
                                            ],
                                            "in": 0,
                                            "bearings": [70, 173, 276, 349],
                                            "duration": 3.768,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.04,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 5.415,
                                            "geometry_index": 760,
                                            "location": [9.160775, 45.578756]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [101, 115, 305],
                                            "duration": 6.39,
                                            "turn_weight": 1.125,
                                            "turn_duration": 0.037,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 7.796,
                                            "geometry_index": 764,
                                            "location": [9.160412, 45.578794]
                                          },
                                          {
                                            "entry": [false, true],
                                            "in": 0,
                                            "bearings": [128, 308],
                                            "duration": 5.76,
                                            "turn_weight": 0.75,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 6.798,
                                            "geometry_index": 767,
                                            "location": [9.1598, 45.579116]
                                          },
                                          {
                                            "entry": [false, true],
                                            "in": 0,
                                            "bearings": [111, 277],
                                            "duration": 10.303,
                                            "turn_weight": 1.125,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 12.201,
                                            "geometry_index": 773,
                                            "location": [9.159266, 45.579329]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              false,
                                              true,
                                              false
                                            ],
                                            "in": 0,
                                            "bearings": [82, 142, 261, 351],
                                            "duration": 2.752,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.021,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 4.436,
                                            "geometry_index": 778,
                                            "location": [9.158211, 45.579273]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [81, 264, 308],
                                            "duration": 3.765,
                                            "turn_weight": 0.75,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 4.788,
                                            "geometry_index": 779,
                                            "location": [9.157926, 45.579242]
                                          },
                                          {
                                            "entry": [false, false, true],
                                            "in": 0,
                                            "bearings": [85, 251, 294],
                                            "duration": 2.506,
                                            "turn_weight": 1.125,
                                            "turn_duration": 0.052,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 3.764,
                                            "geometry_index": 782,
                                            "location": [9.157624, 45.579221]
                                          },
                                          {
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "location": [9.157447, 45.579276],
                                            "geometry_index": 785,
                                            "admin_index": 0,
                                            "weight": 2.518,
                                            "is_urban": true,
                                            "traffic_signal": true,
                                            "turn_duration": 2.04,
                                            "turn_weight": 1.5,
                                            "duration": 2.987,
                                            "bearings": [55, 114, 208, 320],
                                            "out": 3,
                                            "in": 1,
                                            "entry": [false, false, true, true]
                                          },
                                          {
                                            "entry": [false, true],
                                            "in": 0,
                                            "bearings": [140, 331],
                                            "duration": 2.52,
                                            "turn_weight": 1.125,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.834,
                                            "geometry_index": 786,
                                            "location": [9.157402, 45.579313]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [151, 187, 347],
                                            "duration": 0.619,
                                            "turn_weight": 1.125,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 1.77,
                                            "geometry_index": 789,
                                            "location": [9.157316, 45.579421]
                                          },
                                          {
                                            "entry": [false, true],
                                            "in": 0,
                                            "bearings": [167, 350],
                                            "duration": 4.629,
                                            "turn_weight": 0.75,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 5.726,
                                            "geometry_index": 790,
                                            "location": [9.157303, 45.57946]
                                          },
                                          {
                                            "entry": [true, false, true, true],
                                            "in": 1,
                                            "bearings": [84, 171, 269, 352],
                                            "duration": 4.465,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 3,
                                            "weight": 6.291,
                                            "geometry_index": 792,
                                            "location": [9.157247, 45.579696]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              false,
                                              false,
                                              true
                                            ],
                                            "in": 1,
                                            "bearings": [82, 172, 260, 353],
                                            "duration": 4.636,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 3,
                                            "weight": 6.476,
                                            "geometry_index": 793,
                                            "location": [9.1572, 45.579926]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 1,
                                            "bearings": [7, 173, 349],
                                            "duration": 3.618,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.018,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 5.37,
                                            "geometry_index": 794,
                                            "location": [9.157156, 45.58017]
                                          },
                                          {
                                            "bearings": [34, 90, 187, 270],
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.042,
                                            "in": 2,
                                            "yield_sign": true,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "geometry_index": 796,
                                            "location": [9.157184, 45.580327]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "exit roundabout",
                                          "instruction":
                                              "Esci dalla rotonda verso Viale Europa/SP119.",
                                          "modifier": "slight right",
                                          "bearing_after": 250,
                                          "bearing_before": 229,
                                          "location": [9.160939, 45.578797]
                                        },
                                        "name": "Viale Europa",
                                        "duration": 64.19,
                                        "distance": 434.457,
                                        "driving_side": "right",
                                        "weight": 85.568,
                                        "mode": "driving",
                                        "ref": "SP119",
                                        "geometry":
                                            "ya||uAumcnPf@lBVhBPnB@zBMfESnDk@`Fo@tBy@zByOt]kCtF}AxD_A|Cs@zCk@dD_@zC[jDMrDA`DJfEnCrj@|@xPZnGJdE@dCQnC_@hB{@fBiAxAgAjAiAt@eAh@mAX}AZyJrAkM|AgNvA}Dg@{BOeAQaAu@w@aAeAqB"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "sub": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Via per la Stazione"
                                                },
                                                {
                                                  "type": "delimiter",
                                                  "text": "/"
                                                },
                                                {
                                                  "mapbox_shield": {
                                                    "text_color": "white",
                                                    "name": "rectangle-blue",
                                                    "display_ref": "SP119",
                                                    "base_url":
                                                        "https://api.mapbox.com/styles/v1"
                                                  },
                                                  "type": "icon",
                                                  "text": "SP119"
                                                }
                                              ],
                                              "type": "turn",
                                              "modifier": "right",
                                              "text":
                                                  "Via per la Stazione / SP119"
                                            },
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Via per la Stazione"
                                                },
                                                {
                                                  "type": "delimiter",
                                                  "text": "/"
                                                },
                                                {
                                                  "mapbox_shield": {
                                                    "text_color": "white",
                                                    "name": "rectangle-blue",
                                                    "display_ref": "SP119",
                                                    "base_url":
                                                        "https://api.mapbox.com/styles/v1"
                                                  },
                                                  "type": "icon",
                                                  "text": "SP119"
                                                }
                                              ],
                                              "degrees": 42,
                                              "driving_side": "right",
                                              "type": "roundabout",
                                              "modifier": "right",
                                              "text":
                                                  "Via per la Stazione / SP119"
                                            },
                                            "distanceAlongGeometry": 11.686
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Esci dalla rotonda su <say-as interpret-as=\"address\">Via per la Stazione</say-as>, <say-as interpret-as=\"address\">SP119</say-as>. poi Svolta a destra per rimanere su <say-as interpret-as=\"address\">Via per la Stazione</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Esci dalla rotonda su Via per la Stazione, SP119. poi Svolta a destra per rimanere su Via per la Stazione.",
                                            "distanceAlongGeometry": 11.686
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "bearings": [83, 214, 298],
                                            "entry": [true, false, false],
                                            "in": 1,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.182,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "geometry_index": 800,
                                            "location": [9.15731, 45.580458]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "roundabout",
                                          "exit": 2,
                                          "instruction":
                                              "Entra nella rotonda e prendi la 2a uscita per Via per la Stazione/SP119.",
                                          "modifier": "right",
                                          "bearing_after": 83,
                                          "bearing_before": 34,
                                          "location": [9.15731, 45.580458]
                                        },
                                        "name": "Via per la Stazione",
                                        "duration": 2.582,
                                        "distance": 11.686,
                                        "driving_side": "right",
                                        "weight": 4.08,
                                        "mode": "driving",
                                        "ref": "SP119",
                                        "geometry": "si_}uA{j|mPWiH"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Via per la Stazione"
                                                },
                                                {
                                                  "type": "delimiter",
                                                  "text": "/"
                                                },
                                                {
                                                  "mapbox_shield": {
                                                    "text_color": "white",
                                                    "name": "rectangle-blue",
                                                    "display_ref": "SP119",
                                                    "base_url":
                                                        "https://api.mapbox.com/styles/v1"
                                                  },
                                                  "type": "icon",
                                                  "text": "SP119"
                                                }
                                              ],
                                              "type": "turn",
                                              "modifier": "right",
                                              "text":
                                                  "Via per la Stazione / SP119"
                                            },
                                            "distanceAlongGeometry": 15.661
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Svolta a destra per rimanere su <say-as interpret-as=\"address\">Via per la Stazione</say-as>, <say-as interpret-as=\"address\">SP119</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Svolta a destra per rimanere su Via per la Stazione, SP119.",
                                            "distanceAlongGeometry": 15.661
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "bearings": [46, 118, 144, 263],
                                            "entry": [true, true, true, false],
                                            "in": 3,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.072,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "geometry_index": 801,
                                            "location": [9.157459, 45.58047]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "exit roundabout",
                                          "instruction":
                                              "Esci dalla rotonda verso Via per la Stazione/SP119.",
                                          "modifier": "slight right",
                                          "bearing_after": 118,
                                          "bearing_before": 83,
                                          "location": [9.157459, 45.58047]
                                        },
                                        "name": "Via per la Stazione",
                                        "duration": 2.69,
                                        "distance": 15.661,
                                        "driving_side": "right",
                                        "weight": 4.315,
                                        "mode": "driving",
                                        "ref": "SP119",
                                        "geometry": "kj_}uAet|mPTkCf@mB`A_B"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Via Filippo Turati"
                                                }
                                              ],
                                              "degrees": 94,
                                              "driving_side": "right",
                                              "type": "roundabout",
                                              "modifier": "right",
                                              "text": "Via Filippo Turati"
                                            },
                                            "distanceAlongGeometry": 479.416
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra un quarto di miglio, Entra nella rotonda e prendi la 1a uscita per <say-as interpret-as=\"address\">Via Filippo Turati</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra un quarto di miglio, Entra nella rotonda e prendi la 1a uscita per Via Filippo Turati.",
                                            "distanceAlongGeometry": 450.226
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Entra nella rotonda e prendi la 1a uscita per <say-as interpret-as=\"address\">Via Filippo Turati</say-as>, <say-as interpret-as=\"address\">SP119</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Entra nella rotonda e prendi la 1a uscita per Via Filippo Turati, SP119.",
                                            "distanceAlongGeometry": 127.778
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [68, 151, 234, 298],
                                            "duration": 2.19,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.063,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.787,
                                            "geometry_index": 804,
                                            "location": [9.157632, 45.580406]
                                          },
                                          {
                                            "entry": [true, false, true],
                                            "in": 1,
                                            "bearings": [173, 331, 358],
                                            "duration": 12.586,
                                            "turn_weight": 1.125,
                                            "turn_duration": 0.03,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 14.623,
                                            "geometry_index": 806,
                                            "location": [9.15771, 45.580308]
                                          },
                                          {
                                            "entry": [false, true],
                                            "in": 0,
                                            "bearings": [71, 258],
                                            "duration": 2.458,
                                            "turn_weight": 0.75,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.393,
                                            "geometry_index": 825,
                                            "location": [9.157009, 45.57929]
                                          },
                                          {
                                            "entry": [false, true],
                                            "in": 0,
                                            "bearings": [78, 257],
                                            "duration": 14.751,
                                            "turn_weight": 0.75,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 16.608,
                                            "geometry_index": 826,
                                            "location": [9.156663, 45.579239]
                                          },
                                          {
                                            "bearings": [75, 251, 261],
                                            "entry": [false, false, true],
                                            "turn_weight": 1,
                                            "turn_duration": 0.01,
                                            "in": 0,
                                            "yield_sign": true,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 2,
                                            "geometry_index": 830,
                                            "location": [9.154565, 45.578884]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "continue",
                                          "instruction":
                                              "Svolta a destra per rimanere su Via per la Stazione/SP119.",
                                          "modifier": "right",
                                          "bearing_after": 173,
                                          "bearing_before": 118,
                                          "location": [9.157632, 45.580406]
                                        },
                                        "name": "Via per la Stazione",
                                        "duration": 57.596,
                                        "distance": 479.416,
                                        "driving_side": "right",
                                        "weight": 66.29,
                                        "mode": "driving",
                                        "ref": "SP119",
                                        "geometry":
                                            "kf_}uA__}mPjAiAvBqAtMwA~BQnBIfC?nBJ|ATdBf@jBr@jBfA|AjAxAtAlA~A|@zA|AjDnAjD|@~Ch@hC`@zC\\jDdBrTlCp[~Hb}@`CdStBfSvA|WfHnz@JbDMlDm@hD"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Via Filippo Turati"
                                                },
                                                {
                                                  "type": "delimiter",
                                                  "text": "/"
                                                },
                                                {
                                                  "mapbox_shield": {
                                                    "text_color": "white",
                                                    "name": "rectangle-blue",
                                                    "display_ref": "SP119",
                                                    "base_url":
                                                        "https://api.mapbox.com/styles/v1"
                                                  },
                                                  "type": "icon",
                                                  "text": "SP119"
                                                }
                                              ],
                                              "degrees": 94,
                                              "driving_side": "right",
                                              "type": "roundabout",
                                              "modifier": "right",
                                              "text":
                                                  "Via Filippo Turati / SP119"
                                            },
                                            "distanceAlongGeometry": 23.562
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Esci dalla rotonda su <say-as interpret-as=\"address\">Via Filippo Turati</say-as>, <say-as interpret-as=\"address\">SP119</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Esci dalla rotonda su Via Filippo Turati, SP119.",
                                            "distanceAlongGeometry": 23.562
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [false, false, true],
                                            "in": 0,
                                            "bearings": [97, 173, 308],
                                            "duration": 2.329,
                                            "turn_weight": 1.125,
                                            "turn_duration": 0.055,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 3.512,
                                            "geometry_index": 835,
                                            "location": [9.15296, 45.578716]
                                          },
                                          {
                                            "bearings": [68, 128, 272],
                                            "entry": [false, false, true],
                                            "in": 1,
                                            "turn_duration": 0.28,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 2,
                                            "geometry_index": 838,
                                            "location": [9.152843, 45.578781]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "roundabout",
                                          "exit": 1,
                                          "instruction":
                                              "Entra nella rotonda e prendi la 1a uscita per Via Filippo Turati/SP119.",
                                          "modifier": "slight right",
                                          "bearing_after": 308,
                                          "bearing_before": 277,
                                          "location": [9.15296, 45.578716]
                                        },
                                        "name": "Via Filippo Turati",
                                        "duration": 4.572,
                                        "distance": 23.562,
                                        "driving_side": "right",
                                        "weight": 5.574,
                                        "mode": "driving",
                                        "geometry":
                                            "w|{|uA_{smP{@dAg@bA]~AMnACpBBp@Fr@"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Via Monte Sabotino"
                                                }
                                              ],
                                              "type": "turn",
                                              "modifier": "left",
                                              "text": "Via Monte Sabotino"
                                            },
                                            "distanceAlongGeometry": 281.01
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra 900 piedi, Svolta a sinistra su <say-as interpret-as=\"address\">Via Monte Sabotino</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra 900 piedi, Svolta a sinistra su Via Monte Sabotino.",
                                            "distanceAlongGeometry": 264.344
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Svolta a sinistra su <say-as interpret-as=\"address\">Via Monte Sabotino</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Svolta a sinistra su Via Monte Sabotino.",
                                            "distanceAlongGeometry": 56.667
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [92, 221, 303],
                                            "duration": 4.486,
                                            "turn_weight": 1.125,
                                            "turn_duration": 0.055,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 5.777,
                                            "geometry_index": 842,
                                            "location": [9.152695, 45.578784]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [132, 166, 347],
                                            "duration": 3.252,
                                            "turn_weight": 1.125,
                                            "turn_duration": 0.067,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 4.548,
                                            "geometry_index": 846,
                                            "location": [9.152378, 45.578956]
                                          },
                                          {
                                            "entry": [false, false, true],
                                            "in": 0,
                                            "bearings": [167, 314, 348],
                                            "duration": 2.776,
                                            "turn_weight": 1,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 3.977,
                                            "geometry_index": 847,
                                            "location": [9.15231, 45.57916]
                                          },
                                          {
                                            "entry": [false, false, true],
                                            "in": 0,
                                            "bearings": [168, 273, 345],
                                            "duration": 1.331,
                                            "turn_weight": 1,
                                            "turn_duration": 0.022,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 2.407,
                                            "geometry_index": 849,
                                            "location": [9.152255, 45.579338]
                                          },
                                          {
                                            "bearings": [165, 266, 346],
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "turn_weight": 0.75,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 2,
                                            "geometry_index": 850,
                                            "location": [9.152229, 45.579407]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "exit roundabout",
                                          "instruction":
                                              "Esci dalla rotonda verso Via Filippo Turati/SP119. Prosegui su Via Filippo Turati.",
                                          "modifier": "slight right",
                                          "bearing_after": 303,
                                          "bearing_before": 272,
                                          "location": [9.152695, 45.578784]
                                        },
                                        "name": "Via Filippo Turati",
                                        "duration": 51.453,
                                        "distance": 281.01,
                                        "driving_side": "right",
                                        "weight": 59.04,
                                        "mode": "driving",
                                        "ref": "SP119",
                                        "geometry":
                                            "_a||uAmjsmPg@bCm@|A{AzDeDzEwKfCuCb@mEhAiCr@ieBtd@gD|@"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Via Sempione"
                                                }
                                              ],
                                              "type": "turn",
                                              "modifier": "left",
                                              "text": "Via Sempione"
                                            },
                                            "distanceAlongGeometry": 113.355
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra 400 piedi, Svolta a sinistra su <say-as interpret-as=\"address\">Via Sempione</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra 400 piedi, Svolta a sinistra su Via Sempione.",
                                            "distanceAlongGeometry": 103.355
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Svolta a sinistra su <say-as interpret-as=\"address\">Via Sempione</say-as>. poi Arriverai a destinazione.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Svolta a sinistra su Via Sempione. poi Arriverai a destinazione.",
                                            "distanceAlongGeometry": 58.333
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [true, false, true],
                                            "in": 1,
                                            "bearings": [90, 166, 274],
                                            "duration": 9.457,
                                            "turn_weight": 10,
                                            "turn_duration": 2.772,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 17.02,
                                            "geometry_index": 852,
                                            "location": [9.151595, 45.581128]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [94, 168, 274],
                                            "duration": 4.657,
                                            "turn_weight": 1,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 5.883,
                                            "geometry_index": 854,
                                            "location": [9.1511, 45.581152]
                                          },
                                          {
                                            "bearings": [92, 262, 351],
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "turn_weight": 1,
                                            "turn_duration": 0.038,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 1,
                                            "geometry_index": 856,
                                            "location": [9.150698, 45.581166]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "end of road",
                                          "instruction":
                                              "Svolta a sinistra su Via Monte Sabotino.",
                                          "modifier": "left",
                                          "bearing_after": 274,
                                          "bearing_before": 346,
                                          "location": [9.151595, 45.581128]
                                        },
                                        "name": "Via Monte Sabotino",
                                        "duration": 18.706,
                                        "distance": 113.355,
                                        "driving_side": "right",
                                        "weight": 28.683,
                                        "mode": "driving",
                                        "geometry":
                                            "os`}uAueqmPQ`K]zQQbKI~Kj@dL|@xJr@~G"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text":
                                                      "Arriverai a destinazione"
                                                }
                                              ],
                                              "type": "arrive",
                                              "modifier": "straight",
                                              "text": "Arriverai a destinazione"
                                            },
                                            "distanceAlongGeometry": 88.396
                                          },
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text":
                                                      "Sei arrivato a destinazione"
                                                }
                                              ],
                                              "type": "arrive",
                                              "modifier": "straight",
                                              "text":
                                                  "Sei arrivato a destinazione"
                                            },
                                            "distanceAlongGeometry": 41.667
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Sei arrivato a destinazione.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Sei arrivato a destinazione.",
                                            "distanceAlongGeometry": 41.667
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "bearings": [76, 165, 255],
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "turn_weight": 10,
                                            "turn_duration": 5.51,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 1,
                                            "geometry_index": 859,
                                            "location": [9.150154, 45.581087]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "turn",
                                          "instruction":
                                              "Svolta a sinistra su Via Sempione.",
                                          "modifier": "left",
                                          "bearing_after": 165,
                                          "bearing_before": 256,
                                          "location": [9.150154, 45.581087]
                                        },
                                        "name": "Via Sempione",
                                        "duration": 23.11,
                                        "distance": 88.396,
                                        "driving_side": "right",
                                        "weight": 28.48,
                                        "mode": "driving",
                                        "geometry": "}p`}uAsknmPzn@uQ"
                                      },
                                      {
                                        "bannerInstructions": [],
                                        "voiceInstructions": [],
                                        "intersections": [
                                          {
                                            "bearings": [345],
                                            "entry": [true],
                                            "in": 0,
                                            "admin_index": 0,
                                            "geometry_index": 860,
                                            "location": [9.150453, 45.580321]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "arrive",
                                          "instruction":
                                              "Sei arrivato a destinazione.",
                                          "bearing_after": 0,
                                          "bearing_before": 165,
                                          "location": [9.150453, 45.580321]
                                        },
                                        "name": "Via Sempione",
                                        "duration": 0,
                                        "distance": 0,
                                        "driving_side": "right",
                                        "weight": 0,
                                        "mode": "driving",
                                        "geometry": "aa_}uAi~nmP??"
                                      }
                                    ],
                                    "distance": 24212.146,
                                    "summary": "A51, A52"
                                  },
                                  {
                                    "via_waypoints": [],
                                    "admins": [
                                      {
                                        "iso_3166_1_alpha3": "ITA",
                                        "iso_3166_1": "IT"
                                      }
                                    ],
                                    "weight": 2160.225,
                                    "duration": 1730.041,
                                    "steps": [
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Via Magenta"
                                                },
                                                {
                                                  "type": "delimiter",
                                                  "text": "/"
                                                },
                                                {
                                                  "mapbox_shield": {
                                                    "text_color": "white",
                                                    "name": "rectangle-blue",
                                                    "display_ref": "SP119",
                                                    "base_url":
                                                        "https://api.mapbox.com/styles/v1"
                                                  },
                                                  "type": "icon",
                                                  "text": "SP119"
                                                }
                                              ],
                                              "type": "turn",
                                              "modifier": "right",
                                              "text": "Via Magenta / SP119"
                                            },
                                            "distanceAlongGeometry": 128.997
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Guida verso ovest su <say-as interpret-as=\"address\">Via Sempione</say-as>. poi Svolta a destra su <say-as interpret-as=\"address\">Via Magenta</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Guida verso ovest su Via Sempione. poi Svolta a destra su Via Magenta.",
                                            "distanceAlongGeometry": 128.997
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Svolta a destra su <say-as interpret-as=\"address\">Via Magenta</say-as>, <say-as interpret-as=\"address\">SP119</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Svolta a destra su Via Magenta, SP119.",
                                            "distanceAlongGeometry": 56.667
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "bearings": [270],
                                            "entry": [true],
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 0,
                                            "geometry_index": 0,
                                            "location": [9.150453, 45.580321]
                                          },
                                          {
                                            "entry": [false, true],
                                            "in": 0,
                                            "bearings": [90, 165],
                                            "duration": 14,
                                            "turn_weight": 1,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 15.7,
                                            "geometry_index": 1,
                                            "location": [9.150453, 45.580321]
                                          },
                                          {
                                            "bearings": [80, 167, 345],
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "turn_weight": 1,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "street"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "geometry_index": 2,
                                            "location": [9.150689, 45.579716]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "depart",
                                          "instruction":
                                              "Guida verso ovest su Via Sempione.",
                                          "bearing_after": 270,
                                          "bearing_before": 0,
                                          "location": [9.150453, 45.580321]
                                        },
                                        "name": "Via Sempione",
                                        "duration": 25.808,
                                        "distance": 128.997,
                                        "driving_side": "right",
                                        "weight": 29.385,
                                        "mode": "driving",
                                        "geometry": "aa_}uAi~nmP??xd@wMj_@uI"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Via Reali"
                                                }
                                              ],
                                              "degrees": 264,
                                              "driving_side": "right",
                                              "type": "roundabout",
                                              "modifier": "straight",
                                              "text": "Via Reali"
                                            },
                                            "distanceAlongGeometry": 377.773
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra un quarto di miglio, Entra nella rotonda e prendi la 3a uscita per <say-as interpret-as=\"address\">Via Reali</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra un quarto di miglio, Entra nella rotonda e prendi la 3a uscita per Via Reali.",
                                            "distanceAlongGeometry": 361.107
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Entra nella rotonda e prendi la 3a uscita per <say-as interpret-as=\"address\">Via Reali</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Entra nella rotonda e prendi la 3a uscita per Via Reali.",
                                            "distanceAlongGeometry": 116.667
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [79, 276, 347],
                                            "duration": 6.344,
                                            "turn_weight": 8,
                                            "turn_duration": 4.495,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 9.987,
                                            "geometry_index": 3,
                                            "location": [9.15086, 45.579198]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [96, 182, 278],
                                            "duration": 3.899,
                                            "turn_weight": 0.75,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 4.934,
                                            "geometry_index": 5,
                                            "location": [9.150618, 45.579215]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [95, 177, 261],
                                            "duration": 0.268,
                                            "turn_weight": 1.125,
                                            "turn_duration": 0.052,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 1.357,
                                            "geometry_index": 7,
                                            "location": [9.150113, 45.579254]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [81, 256, 345],
                                            "duration": 4.274,
                                            "turn_weight": 1.2,
                                            "turn_duration": 0.028,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 5.658,
                                            "geometry_index": 8,
                                            "location": [9.150069, 45.579249]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [75, 254, 345],
                                            "duration": 3.052,
                                            "turn_weight": 0.75,
                                            "turn_duration": 0.021,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.933,
                                            "geometry_index": 10,
                                            "location": [9.149502, 45.579148]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [74, 168, 255],
                                            "duration": 0.93,
                                            "turn_weight": 0.75,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 1.719,
                                            "geometry_index": 11,
                                            "location": [9.149105, 45.579069]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [75, 254, 346],
                                            "duration": 9.021,
                                            "turn_weight": 0.75,
                                            "turn_duration": 0.021,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": false,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 10.2,
                                            "geometry_index": 12,
                                            "location": [9.148975, 45.579045]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [74, 255, 344],
                                            "duration": 6.075,
                                            "turn_weight": 0.75,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 7.274,
                                            "geometry_index": 14,
                                            "location": [9.147739, 45.578801]
                                          },
                                          {
                                            "entry": [false, true, false],
                                            "in": 0,
                                            "bearings": [75, 254, 344],
                                            "duration": 2.021,
                                            "turn_weight": 0.75,
                                            "turn_duration": 0.021,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.9,
                                            "geometry_index": 15,
                                            "location": [9.147004, 45.578661]
                                          },
                                          {
                                            "bearings": [74, 231, 256],
                                            "entry": [false, false, true],
                                            "turn_weight": 1,
                                            "turn_duration": 0.007,
                                            "in": 0,
                                            "yield_sign": true,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "geometry_index": 16,
                                            "location": [9.146823, 45.578624]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "end of road",
                                          "instruction":
                                              "Svolta a destra su Via Magenta/SP119.",
                                          "modifier": "right",
                                          "bearing_after": 276,
                                          "bearing_before": 167,
                                          "location": [9.15086, 45.579198]
                                        },
                                        "name": "Via Magenta",
                                        "duration": 47.116,
                                        "distance": 377.773,
                                        "driving_side": "right",
                                        "weight": 61.028,
                                        "mode": "driving",
                                        "ref": "SP119",
                                        "geometry":
                                            "{z||uAwwomPEtC[lIaAfUKhHHvAPlCvD~]|CxWn@bGdFpc@`Gtg@vG|l@hAhJv@fI~@dIdBnN~@vC"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Via Reali"
                                                }
                                              ],
                                              "degrees": 264,
                                              "driving_side": "right",
                                              "type": "roundabout",
                                              "modifier": "straight",
                                              "text": "Via Reali"
                                            },
                                            "distanceAlongGeometry": 33.062
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Esci dalla rotonda su <say-as interpret-as=\"address\">Via Reali</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Esci dalla rotonda su Via Reali.",
                                            "distanceAlongGeometry": 33.062
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [false, false, true],
                                            "in": 0,
                                            "bearings": [69, 137, 254],
                                            "duration": 1.068,
                                            "turn_weight": 0.75,
                                            "turn_duration": 0.009,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 1.888,
                                            "geometry_index": 20,
                                            "location": [9.146172, 45.578481]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [74, 216, 306],
                                            "duration": 2.504,
                                            "turn_duration": 0.376,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.287,
                                            "geometry_index": 21,
                                            "location": [9.146109, 45.578468]
                                          },
                                          {
                                            "entry": [false, true, false],
                                            "in": 0,
                                            "bearings": [36, 187, 344],
                                            "duration": 3.721,
                                            "turn_duration": 2.178,
                                            "traffic_signal": true,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.659,
                                            "geometry_index": 24,
                                            "location": [9.146011, 45.578373]
                                          },
                                          {
                                            "bearings": [7, 172, 237],
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "turn_duration": 0.056,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "geometry_index": 26,
                                            "location": [9.145997, 45.578297]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "roundabout",
                                          "exit": 3,
                                          "instruction":
                                              "Entra nella rotonda e prendi la 3a uscita per Via Reali.",
                                          "modifier": "straight",
                                          "bearing_after": 254,
                                          "bearing_before": 249,
                                          "location": [9.146172, 45.578481]
                                        },
                                        "name": "Via Reali",
                                        "duration": 8.377,
                                        "distance": 33.062,
                                        "driving_side": "right",
                                        "weight": 6.939,
                                        "mode": "driving",
                                        "geometry":
                                            "an{|uAwrfmPX|Bp@tAz@|@nAn@jAVjABjBU"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text":
                                                      "Entra in Via Strada Statale 35 dei Giovi e prendi la 2a uscita"
                                                }
                                              ],
                                              "degrees": 137,
                                              "driving_side": "right",
                                              "type": "roundabout",
                                              "modifier": "right",
                                              "text":
                                                  "Entra in Via Strada Statale 35 dei Giovi e prendi la 2a uscita"
                                            },
                                            "distanceAlongGeometry": 2192.856
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Prosegui per 1,5 miglia.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Prosegui per 1,5 miglia.",
                                            "distanceAlongGeometry": 2176.19
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra un quarto di miglio, Entra in <say-as interpret-as=\"address\">Via Strada Statale 35 dei Giovi</say-as> e prendi la 2a uscita.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra un quarto di miglio, Entra in Via Strada Statale 35 dei Giovi e prendi la 2a uscita.",
                                            "distanceAlongGeometry": 402.336
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Entra nella rotonda e prendi la 2a uscita.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Entra nella rotonda e prendi la 2a uscita.",
                                            "distanceAlongGeometry": 100
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [121, 170, 352],
                                            "duration": 1.066,
                                            "turn_weight": 5.5,
                                            "turn_duration": 0.021,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 6.624,
                                            "geometry_index": 27,
                                            "location": [9.146008, 45.578243]
                                          },
                                          {
                                            "entry": [true, true, false, false],
                                            "in": 3,
                                            "bearings": [77, 170, 259, 350],
                                            "duration": 0.739,
                                            "turn_weight": 1,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.774,
                                            "geometry_index": 28,
                                            "location": [9.146027, 45.578164]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [168, 308, 350],
                                            "duration": 0.422,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.022,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 0.93,
                                            "geometry_index": 29,
                                            "location": [9.14604, 45.578111]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [87, 170, 275, 348],
                                            "duration": 3.908,
                                            "turn_weight": 1,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 5.192,
                                            "geometry_index": 30,
                                            "location": [9.14605, 45.578077]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [13, 171, 350],
                                            "duration": 5.419,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 6.305,
                                            "geometry_index": 31,
                                            "location": [9.146136, 45.577732]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [170, 260, 350],
                                            "duration": 4.683,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 5.513,
                                            "geometry_index": 34,
                                            "location": [9.146278, 45.577145]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [82, 171, 260, 350],
                                            "duration": 3.455,
                                            "turn_weight": 1,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 4.694,
                                            "geometry_index": 36,
                                            "location": [9.146399, 45.576642]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [82, 171, 351],
                                            "duration": 2.998,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.703,
                                            "geometry_index": 37,
                                            "location": [9.146486, 45.576271]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [171, 260, 351],
                                            "duration": 2.254,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.902,
                                            "geometry_index": 38,
                                            "location": [9.146534, 45.57606]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [82, 171, 351],
                                            "duration": 5.109,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 5.971,
                                            "geometry_index": 39,
                                            "location": [9.146572, 45.575896]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [82, 171, 351],
                                            "duration": 2.502,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.169,
                                            "geometry_index": 40,
                                            "location": [9.146657, 45.575535]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [80, 171, 351],
                                            "duration": 14.295,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 15.847,
                                            "geometry_index": 41,
                                            "location": [9.146699, 45.575359]
                                          },
                                          {
                                            "entry": [false, true, false],
                                            "in": 2,
                                            "bearings": [131, 173, 351],
                                            "duration": 3.032,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.751,
                                            "geometry_index": 43,
                                            "location": [9.146924, 45.57434]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [77, 174, 353],
                                            "duration": 1.417,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.014,
                                            "geometry_index": 45,
                                            "location": [9.146955, 45.574157]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [46, 171, 241, 354],
                                            "duration": 2.527,
                                            "turn_weight": 1,
                                            "turn_duration": 0.022,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.692,
                                            "geometry_index": 46,
                                            "location": [9.146968, 45.574074]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [169, 262, 351],
                                            "duration": 4.821,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.021,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 5.66,
                                            "geometry_index": 48,
                                            "location": [9.146998, 45.573936]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [167, 258, 349],
                                            "duration": 5.269,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 6.144,
                                            "geometry_index": 49,
                                            "location": [9.147084, 45.57362]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [77, 167, 346],
                                            "duration": 8.408,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 9.53,
                                            "geometry_index": 51,
                                            "location": [9.147185, 45.573317]
                                          },
                                          {
                                            "entry": [true, true, true, false],
                                            "in": 3,
                                            "bearings": [69, 162, 251, 345],
                                            "duration": 7.98,
                                            "turn_weight": 1,
                                            "turn_duration": 0.022,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 9.555,
                                            "geometry_index": 54,
                                            "location": [9.147354, 45.572832]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [70, 161, 341],
                                            "duration": 8.924,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 10.073,
                                            "geometry_index": 56,
                                            "location": [9.147522, 45.572478]
                                          },
                                          {
                                            "entry": [false, true, true, false],
                                            "in": 3,
                                            "bearings": [68, 164, 253, 342],
                                            "duration": 13.057,
                                            "turn_weight": 1,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 15.029,
                                            "geometry_index": 59,
                                            "location": [9.147715, 45.572075]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [166, 258, 346],
                                            "duration": 9.196,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 10.379,
                                            "geometry_index": 63,
                                            "location": [9.14809, 45.57107]
                                          },
                                          {
                                            "entry": [true, true, true, false],
                                            "in": 3,
                                            "bearings": [63, 166, 251, 346],
                                            "duration": 20.952,
                                            "turn_weight": 1,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 23.516,
                                            "geometry_index": 65,
                                            "location": [9.148392, 45.570225]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [165, 255, 346],
                                            "duration": 13.928,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 15.452,
                                            "geometry_index": 66,
                                            "location": [9.148793, 45.569114]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [165, 222, 346],
                                            "duration": 2.31,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.963,
                                            "geometry_index": 68,
                                            "location": [9.149066, 45.568375]
                                          },
                                          {
                                            "entry": [false, true, true, false],
                                            "in": 3,
                                            "bearings": [66, 165, 249, 345],
                                            "duration": 1.115,
                                            "turn_weight": 2,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.191,
                                            "geometry_index": 69,
                                            "location": [9.149114, 45.568251]
                                          },
                                          {
                                            "entry": [true, true, false, false],
                                            "in": 3,
                                            "bearings": [68, 167, 251, 345],
                                            "duration": 2.367,
                                            "turn_weight": 1,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.536,
                                            "geometry_index": 70,
                                            "location": [9.14914, 45.568184]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [167, 298, 347],
                                            "duration": 3.826,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.605,
                                            "geometry_index": 71,
                                            "location": [9.149195, 45.568019]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [1, 166, 347],
                                            "duration": 12.852,
                                            "turn_weight": 5.5,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 19.309,
                                            "geometry_index": 73,
                                            "location": [9.149295, 45.567714]
                                          },
                                          {
                                            "entry": [false, true, true, false],
                                            "in": 3,
                                            "bearings": [125, 166, 253, 346],
                                            "duration": 3.735,
                                            "turn_weight": 1,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 5.008,
                                            "geometry_index": 74,
                                            "location": [9.149786, 45.566345]
                                          },
                                          {
                                            "entry": [false, true, true, false],
                                            "in": 3,
                                            "bearings": [44, 99, 166, 346],
                                            "duration": 2.835,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 3.541,
                                            "geometry_index": 76,
                                            "location": [9.149879, 45.566091]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [17, 166, 346],
                                            "duration": 10.015,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 11.259,
                                            "geometry_index": 77,
                                            "location": [9.149979, 45.565807]
                                          },
                                          {
                                            "entry": [false, true, false],
                                            "in": 2,
                                            "bearings": [73, 165, 346],
                                            "duration": 2.827,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.519,
                                            "geometry_index": 78,
                                            "location": [9.150407, 45.564595]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [166, 253, 345],
                                            "duration": 22.183,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 24.339,
                                            "geometry_index": 79,
                                            "location": [9.150532, 45.56426]
                                          },
                                          {
                                            "entry": [false, true, false],
                                            "in": 2,
                                            "bearings": [113, 166, 346],
                                            "duration": 9.325,
                                            "turn_weight": 0.75,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 10.766,
                                            "geometry_index": 80,
                                            "location": [9.151018, 45.562918]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              true,
                                              true,
                                              false
                                            ],
                                            "in": 4,
                                            "bearings": [28, 59, 166, 246, 346],
                                            "duration": 18.989,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 21.905,
                                            "geometry_index": 83,
                                            "location": [9.151149, 45.562538]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [49, 166, 346],
                                            "duration": 14.607,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 16.195,
                                            "geometry_index": 86,
                                            "location": [9.151514, 45.56153]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [166, 256, 346],
                                            "duration": 0.704,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 1.249,
                                            "geometry_index": 88,
                                            "location": [9.151743, 45.56089]
                                          },
                                          {
                                            "bearings": [166, 258, 346],
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "turn_weight": 0.75,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "geometry_index": 89,
                                            "location": [9.151763, 45.560834]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "exit roundabout",
                                          "instruction":
                                              "Esci dalla rotonda verso Via Reali.",
                                          "modifier": "straight",
                                          "bearing_after": 170,
                                          "bearing_before": 172,
                                          "location": [9.146008, 45.578243]
                                        },
                                        "name": "Via Reali",
                                        "duration": 277.518,
                                        "distance": 2192.856,
                                        "driving_side": "right",
                                        "weight": 334.77,
                                        "mode": "driving",
                                        "geometry":
                                            "e_{|uAohfmP|Ce@hBYbASpTkDtDi@tJ{AhRuCpTeDzHkAdVmDdL_BfIkApUiD~IsAzT}Cxh@cH|BWnFe@dDYpAS`Eg@vRkDnCi@lM_DzV}FfBg@dBk@jKuDvHyCdPiGrBw@jC_AtCaAzPwE`[gIdKkCf`@wJpRcFldAaXfk@kO|@UvF_BdCs@hImB`AW~OoDptAu]hEkApHmBvPgEvjAwY|SyFzrAk]jIsBtA[tIuBxJgCn@Stp@}Pt^kJhG}AnBg@|Cy@|gBqd@"
                                      },
                                      {
                                        "destinations": "A52",
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "mapbox_shield": {
                                                    "text_color": "white",
                                                    "name": "it-motorway",
                                                    "display_ref": "A52",
                                                    "base_url":
                                                        "https://api.mapbox.com/styles/v1"
                                                  },
                                                  "type": "icon",
                                                  "text": "A52"
                                                }
                                              ],
                                              "degrees": 137,
                                              "driving_side": "right",
                                              "type": "roundabout",
                                              "modifier": "right",
                                              "text": "A52"
                                            },
                                            "distanceAlongGeometry": 80.112
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Esci dalla rotonda su <say-as interpret-as=\"address\">A52</say-as>, <say-as interpret-as=\"address\">Tangenziale Nord di Milano</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Esci dalla rotonda su A52, Tangenziale Nord di Milano.",
                                            "distanceAlongGeometry": 52.778
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [false, true, false],
                                            "in": 2,
                                            "bearings": [92, 244, 346],
                                            "duration": 1.833,
                                            "turn_weight": 1,
                                            "turn_duration": 1.113,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.774,
                                            "geometry_index": 91,
                                            "location": [9.152393, 45.559076]
                                          },
                                          {
                                            "entry": [false, true],
                                            "in": 0,
                                            "bearings": [64, 235],
                                            "duration": 1.8,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.935,
                                            "geometry_index": 92,
                                            "railway_crossing": true,
                                            "location": [9.152331, 45.559055]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [55, 212, 259],
                                            "duration": 2.977,
                                            "turn_duration": 0.097,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.096,
                                            "geometry_index": 94,
                                            "location": [9.152223, 45.559003]
                                          },
                                          {
                                            "bearings": [32, 180, 300],
                                            "entry": [false, true, false],
                                            "in": 0,
                                            "turn_duration": 0.207,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "geometry_index": 96,
                                            "location": [9.152118, 45.558885]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "rotary",
                                          "exit": 2,
                                          "instruction":
                                              "Entra in Via Strada Statale 35 dei Giovi e prendi la 2a uscita.",
                                          "modifier": "right",
                                          "bearing_after": 244,
                                          "bearing_before": 166,
                                          "location": [9.152393, 45.559076]
                                        },
                                        "rotary_name":
                                            "Via Strada Statale 35 dei Giovi",
                                        "name": "",
                                        "duration": 15.637,
                                        "distance": 80.112,
                                        "driving_side": "right",
                                        "weight": 16.286,
                                        "mode": "driving",
                                        "geometry":
                                            "gqu{uAqwrmPh@zBPx@tA|ClBzB|BtAfDl@hDW~C{AlCaDdBwE"
                                      },
                                      {
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra mezzo miglio, Prendi l'uscita <say-as interpret-as=\"address\">11</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra mezzo miglio, Prendi l'uscita 11.",
                                            "distanceAlongGeometry": 849.416
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Prendi l'uscita <say-as interpret-as=\"address\">11</say-as> per <say-as interpret-as=\"address\">A4</say-as>, <say-as interpret-as=\"address\">SS 35</say-as> verso <say-as interpret-as=\"address\">Cormano</say-as>, <say-as interpret-as=\"address\">Cusano Milanino</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Prendi l'uscita 11 per A4, SS 35 verso Cormano, Cusano Milanino.",
                                            "distanceAlongGeometry": 220
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [101, 193, 314],
                                            "duration": 17.215,
                                            "turn_weight": 2.5,
                                            "turn_duration": 0.348,
                                            "mapbox_streets_v8": {
                                              "class": "secondary_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 20.632,
                                            "geometry_index": 101,
                                            "location": [9.152342, 45.558514]
                                          },
                                          {
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "location": [9.151228, 45.558482],
                                            "geometry_index": 140,
                                            "admin_index": 0,
                                            "weight": 29.922,
                                            "is_urban": true,
                                            "turn_weight": 27.4,
                                            "duration": 2.356,
                                            "bearings": [76, 251, 256],
                                            "out": 0,
                                            "in": 1,
                                            "turn_duration": 0.01,
                                            "classes": ["motorway"],
                                            "entry": [true, false, false]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "bearings": [76, 256],
                                            "duration": 4.533,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.873,
                                            "geometry_index": 141,
                                            "location": [9.151947, 45.558608]
                                          },
                                          {
                                            "bearings": [77, 256],
                                            "entry": [true, false],
                                            "classes": ["motorway"],
                                            "in": 1,
                                            "mapbox_streets_v8": {
                                              "class": "motorway"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "geometry_index": 142,
                                            "location": [9.153218, 45.558832]
                                          }
                                        ],
                                        "bannerInstructions": [
                                          {
                                            "secondary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Cormano"
                                                },
                                                {"type": "text", "text": "/"},
                                                {
                                                  "type": "text",
                                                  "text": "Cusano Milanino"
                                                }
                                              ],
                                              "type": "off ramp",
                                              "modifier": "right",
                                              "text":
                                                  "Cormano / Cusano Milanino"
                                            },
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "exit",
                                                  "text": "Uscita"
                                                },
                                                {
                                                  "type": "exit-number",
                                                  "text": "11"
                                                },
                                                {
                                                  "mapbox_shield": {
                                                    "text_color": "white",
                                                    "name": "it-motorway",
                                                    "display_ref": "A4",
                                                    "base_url":
                                                        "https://api.mapbox.com/styles/v1"
                                                  },
                                                  "type": "icon",
                                                  "text": "A4"
                                                },
                                                {
                                                  "type": "delimiter",
                                                  "text": "/"
                                                },
                                                {
                                                  "mapbox_shield": {
                                                    "text_color": "white",
                                                    "name": "rectangle-blue",
                                                    "display_ref": "SS35",
                                                    "base_url":
                                                        "https://api.mapbox.com/styles/v1"
                                                  },
                                                  "type": "icon",
                                                  "text": "SS 35"
                                                }
                                              ],
                                              "type": "off ramp",
                                              "modifier": "right",
                                              "text": "Uscita 11 A4 / SS 35"
                                            },
                                            "distanceAlongGeometry": 879.083
                                          }
                                        ],
                                        "destinations": "A52",
                                        "maneuver": {
                                          "type": "exit rotary",
                                          "instruction":
                                              "Esci dalla rotonda verso A52/Tangenziale Nord di Milano.",
                                          "modifier": "right",
                                          "bearing_after": 193,
                                          "bearing_before": 134,
                                          "location": [9.152342, 45.558514]
                                        },
                                        "name": "Tangenziale Nord di Milano",
                                        "duration": 36.895,
                                        "distance": 879.083,
                                        "driving_side": "right",
                                        "weight": 69.178,
                                        "mode": "driving",
                                        "ref": "A52",
                                        "geometry":
                                            "cnt{uAktrmPjBJ|Bj@zB|@pBrA`FhEtHtKnDpGbDrGtB~FfBrGpCzMlBrMzA`OxAjPR~C?|CMrC_@rCk@fCk@bBu@zAy@pAcAjA}AlAqBz@eB\\aBH_BIwAY}Am@yAaAgAeAaAqAu@wAi@sA{@_D}AcIsCgQqIgk@{F}k@_MmnA_CkW_BqViAqTo@yWF_V\\{Qh@uLpDka@rC}PrIa`@"
                                      },
                                      {
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra un quarto di miglio, Mantieni la destra per prendere l'uscita <say-as interpret-as=\"address\">11</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra un quarto di miglio, Mantieni la destra per prendere l'uscita 11.",
                                            "distanceAlongGeometry": 493.125
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Mantieni la la destra per prendere l'uscita <say-as interpret-as=\"address\">11</say-as> su <say-as interpret-as=\"address\">A4</say-as>, <say-as interpret-as=\"address\">SS 35</say-as> verso <say-as interpret-as=\"address\">Cormano</say-as>, <say-as interpret-as=\"address\">Cusano Milanino</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Mantieni la la destra per prendere l'uscita 11 su A4, SS 35 verso Cormano, Cusano Milanino.",
                                            "distanceAlongGeometry": 120
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [114, 129, 295],
                                            "duration": 4.101,
                                            "turn_duration": 0.018,
                                            "mapbox_streets_v8": {
                                              "class": "trunk_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 4.492,
                                            "geometry_index": 152,
                                            "location": [9.156982, 45.558632]
                                          },
                                          {
                                            "bearings": [115, 297],
                                            "entry": [true, false],
                                            "in": 1,
                                            "mapbox_streets_v8": {
                                              "class": "trunk_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "geometry_index": 154,
                                            "location": [9.157805, 45.55829]
                                          }
                                        ],
                                        "exits": "11",
                                        "bannerInstructions": [
                                          {
                                            "secondary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Cormano"
                                                },
                                                {"type": "text", "text": "/"},
                                                {
                                                  "type": "text",
                                                  "text": "Cusano Milanino"
                                                }
                                              ],
                                              "type": "fork",
                                              "modifier": "right",
                                              "text":
                                                  "Cormano / Cusano Milanino"
                                            },
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "exit",
                                                  "text": "Uscita"
                                                },
                                                {
                                                  "type": "exit-number",
                                                  "text": "11"
                                                },
                                                {
                                                  "mapbox_shield": {
                                                    "text_color": "white",
                                                    "name": "it-motorway",
                                                    "display_ref": "A4",
                                                    "base_url":
                                                        "https://api.mapbox.com/styles/v1"
                                                  },
                                                  "type": "icon",
                                                  "text": "A4"
                                                },
                                                {
                                                  "type": "delimiter",
                                                  "text": "/"
                                                },
                                                {
                                                  "mapbox_shield": {
                                                    "text_color": "white",
                                                    "name": "rectangle-blue",
                                                    "display_ref": "SS35",
                                                    "base_url":
                                                        "https://api.mapbox.com/styles/v1"
                                                  },
                                                  "type": "icon",
                                                  "text": "SS 35"
                                                }
                                              ],
                                              "type": "fork",
                                              "modifier": "right",
                                              "text": "Uscita 11 A4 / SS 35"
                                            },
                                            "distanceAlongGeometry": 509.792
                                          }
                                        ],
                                        "destinations":
                                            "A4, SS 35: Cormano, Cusano Milanino, Paderno Dugnano, SS35 Milano-Meda",
                                        "maneuver": {
                                          "type": "off ramp",
                                          "instruction":
                                              "Prendi l'uscita 11 per A4/SS 35 verso Cormano/Cusano Milanino.",
                                          "modifier": "slight right",
                                          "bearing_after": 129,
                                          "bearing_before": 115,
                                          "location": [9.156982, 45.558632]
                                        },
                                        "name": "Uscita 11",
                                        "duration": 27.421,
                                        "distance": 509.792,
                                        "driving_side": "right",
                                        "weight": 30.143,
                                        "mode": "driving",
                                        "ref": "A52",
                                        "geometry":
                                            "out{uAkv{mPxCaDpOkm@zGmZdBoLj@cFr@eIz@qNb@sJJwKw@irCXkYl@yUhBma@lAwL"
                                      },
                                      {
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Prosegui per 4 miglia.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Prosegui per 4 miglia.",
                                            "distanceAlongGeometry": 7193.294
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra un quarto di miglio, Svolta a destra su <say-as interpret-as=\"address\">Via Gioacchino Murat</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra un quarto di miglio, Svolta a destra su Via Gioacchino Murat.",
                                            "distanceAlongGeometry": 402.336
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Svolta a destra su <say-as interpret-as=\"address\">Via Gioacchino Murat</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Svolta a destra su Via Gioacchino Murat.",
                                            "distanceAlongGeometry": 94.444
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [106, 116, 283],
                                            "duration": 24.075,
                                            "turn_duration": 0.015,
                                            "mapbox_streets_v8": {
                                              "class": "trunk_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 26.466,
                                            "geometry_index": 166,
                                            "location": [9.163291, 45.557895]
                                          },
                                          {
                                            "entry": [false, true, false],
                                            "in": 2,
                                            "bearings": [7, 188, 356],
                                            "duration": 2.672,
                                            "turn_weight": 11.75,
                                            "turn_duration": 0.017,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 14.67,
                                            "geometry_index": 181,
                                            "location": [9.164967, 45.55489]
                                          },
                                          {
                                            "entry": [false, true],
                                            "in": 0,
                                            "bearings": [8, 187],
                                            "duration": 2.475,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.722,
                                            "geometry_index": 182,
                                            "location": [9.164868, 45.554365]
                                          },
                                          {
                                            "entry": [false, true],
                                            "in": 0,
                                            "bearings": [7, 187],
                                            "duration": 11.07,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 12.177,
                                            "geometry_index": 183,
                                            "location": [9.16478, 45.553878]
                                          },
                                          {
                                            "entry": [false, true],
                                            "in": 0,
                                            "bearings": [7, 187],
                                            "duration": 14.04,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 15.444,
                                            "geometry_index": 184,
                                            "location": [9.164384, 45.551684]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [14, 197, 213],
                                            "duration": 8.873,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 9.752,
                                            "geometry_index": 188,
                                            "location": [9.163678, 45.548927]
                                          },
                                          {
                                            "entry": [false, true],
                                            "classes": ["tunnel"],
                                            "in": 0,
                                            "bearings": [19, 199],
                                            "duration": 1.015,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.117,
                                            "geometry_index": 191,
                                            "location": [9.1629, 45.547247]
                                          },
                                          {
                                            "entry": [false, true],
                                            "in": 0,
                                            "bearings": [19, 199],
                                            "duration": 15.99,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 17.589,
                                            "geometry_index": 192,
                                            "location": [9.162809, 45.54706]
                                          },
                                          {
                                            "entry": [false, true, false],
                                            "in": 0,
                                            "bearings": [10, 185, 359],
                                            "duration": 42.178,
                                            "turn_duration": 0.028,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 46.365,
                                            "geometry_index": 197,
                                            "location": [9.16168, 45.544096]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [174, 345, 355],
                                            "duration": 12.084,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 13.785,
                                            "geometry_index": 207,
                                            "location": [9.162182, 45.536542]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [167, 346],
                                            "duration": 2.555,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.81,
                                            "geometry_index": 213,
                                            "location": [9.162723, 45.534717]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [173, 184, 350],
                                            "duration": 29.692,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 32.653,
                                            "geometry_index": 217,
                                            "location": [9.162834, 45.534332]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [167, 344, 347],
                                            "duration": 2.571,
                                            "turn_weight": 6,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 8.819,
                                            "geometry_index": 228,
                                            "location": [9.163595, 45.530157]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [159, 343],
                                            "duration": 5.43,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 5.974,
                                            "geometry_index": 230,
                                            "location": [9.163734, 45.529796]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [141, 327],
                                            "duration": 10.183,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 11.201,
                                            "geometry_index": 234,
                                            "location": [9.164253, 45.529084]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["tunnel"],
                                            "in": 1,
                                            "bearings": [136, 317],
                                            "duration": 1.2,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 1.32,
                                            "geometry_index": 236,
                                            "location": [9.165089, 45.528418]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [137, 316],
                                            "duration": 11.686,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 12.855,
                                            "geometry_index": 237,
                                            "location": [9.165289, 45.528274]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [136, 308, 317],
                                            "duration": 5.878,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 6.458,
                                            "geometry_index": 240,
                                            "location": [9.167128, 45.526888]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [137, 316],
                                            "duration": 8.031,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 8.834,
                                            "geometry_index": 241,
                                            "location": [9.168066, 45.526199]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [137, 317],
                                            "duration": 2.025,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.227,
                                            "geometry_index": 242,
                                            "location": [9.169337, 45.525244]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [137, 317],
                                            "duration": 9,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 9.9,
                                            "geometry_index": 243,
                                            "location": [9.169654, 45.525008]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [139, 317],
                                            "duration": 1.8,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 1.98,
                                            "geometry_index": 244,
                                            "location": [9.171141, 45.523896]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [139, 319],
                                            "duration": 3.759,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.135,
                                            "geometry_index": 245,
                                            "location": [9.171429, 45.523662]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [135, 146, 319],
                                            "duration": 3.244,
                                            "lanes": [
                                              {
                                                "indications": ["straight"],
                                                "valid_indication": "straight",
                                                "valid": true,
                                                "active": true
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid_indication": "straight",
                                                "valid": true,
                                                "active": true
                                              },
                                              {
                                                "indications": ["slight right"],
                                                "valid": false,
                                                "active": false
                                              }
                                            ],
                                            "turn_duration": 0.026,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 3.54,
                                            "geometry_index": 246,
                                            "location": [9.172023, 45.523175]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [137, 315],
                                            "duration": 5.291,
                                            "turn_weight": 5,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 10.82,
                                            "geometry_index": 247,
                                            "location": [9.172564, 45.522801]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [137, 317],
                                            "duration": 1.036,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 1.14,
                                            "geometry_index": 248,
                                            "location": [9.173414, 45.522161]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [136, 317],
                                            "duration": 5.673,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 6.24,
                                            "geometry_index": 249,
                                            "location": [9.173586, 45.522034]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [134, 314],
                                            "duration": 7.145,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 7.86,
                                            "geometry_index": 251,
                                            "location": [9.174544, 45.52138]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [133, 308, 313],
                                            "duration": 19.319,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 21.73,
                                            "geometry_index": 253,
                                            "location": [9.175755, 45.520568]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [152, 330],
                                            "duration": 0.2,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 0.22,
                                            "geometry_index": 258,
                                            "location": [9.177339, 45.519245]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [152, 332],
                                            "duration": 3,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 3.3,
                                            "geometry_index": 259,
                                            "location": [9.177352, 45.519228]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [154, 333],
                                            "duration": 20.2,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 22.22,
                                            "geometry_index": 261,
                                            "location": [9.17753, 45.518987]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [167, 347],
                                            "duration": 4.7,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 5.17,
                                            "geometry_index": 265,
                                            "location": [9.178281, 45.517253]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [167, 189, 348],
                                            "duration": 4.476,
                                            "lanes": [
                                              {
                                                "indications": ["left"],
                                                "valid": false,
                                                "active": false
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid_indication": "straight",
                                                "valid": true,
                                                "active": true
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid_indication": "straight",
                                                "valid": true,
                                                "active": true
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid_indication": "straight",
                                                "valid": true,
                                                "active": true
                                              },
                                              {
                                                "indications": ["right"],
                                                "valid": false,
                                                "active": false
                                              }
                                            ],
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.916,
                                            "geometry_index": 267,
                                            "location": [9.178409, 45.516841]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [76, 168, 256, 347],
                                            "duration": 1.249,
                                            "lanes": [
                                              {
                                                "indications": ["left"],
                                                "valid": false,
                                                "active": false
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid_indication": "straight",
                                                "valid": true,
                                                "active": true
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid_indication": "straight",
                                                "valid": true,
                                                "active": true
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid_indication": "straight",
                                                "valid": true,
                                                "active": true
                                              }
                                            ],
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "trunk"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.366,
                                            "geometry_index": 269,
                                            "location": [9.178513, 45.516525]
                                          },
                                          {
                                            "entry": [
                                              true,
                                              true,
                                              false,
                                              true,
                                              false
                                            ],
                                            "in": 4,
                                            "bearings": [
                                              70,
                                              168,
                                              221,
                                              270,
                                              348
                                            ],
                                            "duration": 1.007,
                                            "lanes": [
                                              {
                                                "indications": ["left"],
                                                "valid": false,
                                                "active": false
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid_indication": "straight",
                                                "valid": true,
                                                "active": true
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid_indication": "straight",
                                                "valid": true,
                                                "active": true
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid_indication": "straight",
                                                "valid": true,
                                                "active": true
                                              }
                                            ],
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.1,
                                            "geometry_index": 270,
                                            "location": [9.178539, 45.516439]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [62, 170, 242, 348],
                                            "duration": 2.708,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.97,
                                            "geometry_index": 271,
                                            "location": [9.178564, 45.516354]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [167, 321, 350],
                                            "duration": 6.322,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.022,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 7.43,
                                            "geometry_index": 272,
                                            "location": [9.178624, 45.516115]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [168, 347],
                                            "duration": 8,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 8.8,
                                            "geometry_index": 273,
                                            "location": [9.178808, 45.515567]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [168, 348],
                                            "duration": 9,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 9.9,
                                            "geometry_index": 274,
                                            "location": [9.179016, 45.514861]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [77, 168, 258, 348],
                                            "duration": 1.207,
                                            "lanes": [
                                              {
                                                "indications": ["left"],
                                                "valid": false,
                                                "active": false
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid_indication": "straight",
                                                "valid": true,
                                                "active": true
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid_indication": "straight",
                                                "valid": true,
                                                "active": true
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid_indication": "straight",
                                                "valid": true,
                                                "active": true
                                              }
                                            ],
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.32,
                                            "geometry_index": 276,
                                            "location": [9.179248, 45.514072]
                                          },
                                          {
                                            "lanes": [
                                              {
                                                "indications": ["left"],
                                                "valid": false,
                                                "active": false
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid_indication": "straight",
                                                "valid": true,
                                                "active": true
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid_indication": "straight",
                                                "valid": true,
                                                "active": true
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid_indication": "straight",
                                                "valid": true,
                                                "active": true
                                              }
                                            ],
                                            "location": [9.179279, 45.513967],
                                            "geometry_index": 277,
                                            "admin_index": 0,
                                            "weight": 2.044,
                                            "is_urban": true,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "turn_duration": 0.008,
                                            "turn_weight": 0.5,
                                            "duration": 1.411,
                                            "bearings": [77, 170, 348],
                                            "out": 1,
                                            "in": 2,
                                            "entry": [false, true, false]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [77, 167, 350],
                                            "duration": 35.216,
                                            "turn_duration": 0.022,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 39.593,
                                            "geometry_index": 278,
                                            "location": [9.179329, 45.513761]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [148, 340],
                                            "duration": 7.039,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 7.919,
                                            "geometry_index": 284,
                                            "location": [9.181208, 45.508031]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [142, 155, 323],
                                            "duration": 3.778,
                                            "lanes": [
                                              {
                                                "indications": ["straight"],
                                                "valid_indication": "straight",
                                                "valid": true,
                                                "active": true
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid_indication": "straight",
                                                "valid": true,
                                                "active": true
                                              },
                                              {
                                                "indications": ["slight right"],
                                                "valid": false,
                                                "active": false
                                              }
                                            ],
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.337,
                                            "geometry_index": 286,
                                            "location": [9.182174, 45.507068]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [143, 322],
                                            "duration": 5.143,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 5.914,
                                            "geometry_index": 287,
                                            "location": [9.182692, 45.506595]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["tunnel"],
                                            "in": 1,
                                            "bearings": [143, 323],
                                            "duration": 3.6,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.14,
                                            "geometry_index": 288,
                                            "location": [9.183387, 45.505955]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [142, 323],
                                            "duration": 14.824,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 17.047,
                                            "geometry_index": 289,
                                            "location": [9.183806, 45.505562]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [144, 286, 325],
                                            "duration": 11.748,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 13.988,
                                            "geometry_index": 291,
                                            "location": [9.185382, 45.504029]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [144, 324],
                                            "duration": 3.832,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.503,
                                            "geometry_index": 292,
                                            "location": [9.186148, 45.503296]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [144, 324],
                                            "duration": 5.806,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 6.823,
                                            "geometry_index": 293,
                                            "location": [9.186395, 45.50306]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [144, 324],
                                            "duration": 4.418,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 5.191,
                                            "geometry_index": 294,
                                            "location": [9.186771, 45.502701]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [84, 144, 324],
                                            "duration": 9.607,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 11.28,
                                            "geometry_index": 295,
                                            "location": [9.186975, 45.502506]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [144, 324],
                                            "duration": 10,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 11.75,
                                            "geometry_index": 296,
                                            "location": [9.18734, 45.502156]
                                          },
                                          {
                                            "lanes": [
                                              {
                                                "indications": ["left"],
                                                "valid": false,
                                                "active": false
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid_indication": "straight",
                                                "valid": true,
                                                "active": true
                                              }
                                            ],
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [144, 324],
                                            "duration": 9.4,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 11.045,
                                            "geometry_index": 297,
                                            "location": [9.18772, 45.501792]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [18, 126, 193, 309],
                                            "duration": 2.022,
                                            "lanes": [
                                              {
                                                "indications": ["left"],
                                                "valid": false,
                                                "active": false
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid": false,
                                                "active": false
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid_indication": "straight",
                                                "valid": true,
                                                "active": true
                                              }
                                            ],
                                            "turn_duration": 0.022,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.35,
                                            "geometry_index": 301,
                                            "location": [9.188128, 45.501485]
                                          },
                                          {
                                            "lanes": [
                                              {
                                                "indications": ["left"],
                                                "valid": false,
                                                "active": false
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid": false,
                                                "active": false
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid_indication": "straight",
                                                "valid": true,
                                                "active": true
                                              }
                                            ],
                                            "location": [9.188228, 45.501434],
                                            "geometry_index": 302,
                                            "admin_index": 0,
                                            "weight": 8.615,
                                            "is_urban": true,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "turn_duration": 0.009,
                                            "turn_weight": 6.5,
                                            "duration": 1.809,
                                            "bearings": [18, 129, 197, 306],
                                            "out": 1,
                                            "in": 3,
                                            "entry": [true, true, false, false]
                                          },
                                          {
                                            "lanes": [
                                              {
                                                "indications": [
                                                  "left",
                                                  "straight"
                                                ],
                                                "valid_indication": "straight",
                                                "valid": true,
                                                "active": true
                                              },
                                              {
                                                "indications": ["right"],
                                                "valid": false,
                                                "active": false
                                              }
                                            ],
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [130, 309],
                                            "duration": 1.4,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 1.645,
                                            "geometry_index": 303,
                                            "location": [9.188319, 45.501382]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [17, 130, 197, 310],
                                            "duration": 5.607,
                                            "lanes": [
                                              {
                                                "indications": [
                                                  "left",
                                                  "straight"
                                                ],
                                                "valid_indication": "straight",
                                                "valid": true,
                                                "active": true
                                              },
                                              {
                                                "indications": ["right"],
                                                "valid": false,
                                                "active": false
                                              }
                                            ],
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 6.58,
                                            "geometry_index": 305,
                                            "location": [9.188386, 45.501343]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [123, 194, 310],
                                            "duration": 20.033,
                                            "lanes": [
                                              {
                                                "indications": [
                                                  "left",
                                                  "straight"
                                                ],
                                                "valid_indication": "straight",
                                                "valid": true,
                                                "active": true
                                              },
                                              {
                                                "indications": ["right"],
                                                "valid": false,
                                                "active": false
                                              }
                                            ],
                                            "turn_duration": 0.033,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 23.5,
                                            "geometry_index": 307,
                                            "location": [9.188666, 45.50118]
                                          },
                                          {
                                            "lanes": [
                                              {
                                                "indications": [
                                                  "left",
                                                  "straight"
                                                ],
                                                "valid": false,
                                                "active": false
                                              },
                                              {
                                                "indications": ["right"],
                                                "valid_indication": "right",
                                                "valid": true,
                                                "active": true
                                              }
                                            ],
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [98, 286],
                                            "duration": 3.4,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 3.995,
                                            "geometry_index": 312,
                                            "location": [9.189855, 45.500875]
                                          },
                                          {
                                            "bearings": [0, 67, 182, 278],
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "turn_duration": 0.165,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "geometry_index": 314,
                                            "location": [9.190066, 45.500854]
                                          }
                                        ],
                                        "exits": "11",
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Via Gioacchino Murat"
                                                }
                                              ],
                                              "type": "turn",
                                              "modifier": "right",
                                              "text": "Via Gioacchino Murat"
                                            },
                                            "distanceAlongGeometry": 7206.627
                                          }
                                        ],
                                        "destinations":
                                            "A4, SS 35: Cormano, Cusano Milanino, SS35 Milano",
                                        "maneuver": {
                                          "type": "fork",
                                          "instruction":
                                              "Mantieni la destra per prendere l'uscita 11 per A4/SS 35 verso Cormano/Cusano Milanino.",
                                          "modifier": "slight right",
                                          "bearing_after": 116,
                                          "bearing_before": 103,
                                          "location": [9.163291, 45.557895]
                                        },
                                        "name": "",
                                        "duration": 494.92,
                                        "distance": 7206.627,
                                        "driving_side": "right",
                                        "weight": 584.608,
                                        "mode": "driving",
                                        "ref": "SPexSS35",
                                        "geometry":
                                            "mgs{uAu`hnPbCcKzLwe@hE_KrCkGfH{IbJiJrLkIjKoD`NwBrMg@lMTbo@|HpDHpDMbH]x_@dEl]nDbhCvWxUbCn|A|Srp@rOjElAvb@dNjf@zQz\\pMtJtDlCbAfu@pZ|\\fLfk@nMjs@bLjVvAnTr@bd@vArj@}@hqA{GvxCeNjRaAbf@uCzQu@``@aCdF]~H{@r[_FhRsEzX{G`VoG`Bc@|D}@vFoAhFk@pVgCdKe@zIE~q@]dR_@~Hk@hH}@~MqBhdA_T~VyEnOiDhLkCfHiCxHgDfP{ItGaGvGgGdQiTlV}]~GoKxSuZ|Xma@zf@ys@`j@sy@tz@mnAvMyRndA}{ArM_Ql]cd@jVy`@~f@ct@|FwIzJmO~[mj@zT{^z[yj@xZgi@zNqRvNaPbPmNbEuC`@YrGqElEqCjJ{F`UaKb\\aKxl@}M~M{CvIcBzNgDzBg@jDs@hDq@|MwBfa@oJbk@_L`m@qLfB]pE}@zKcBrtA_\\~ZqGxWqFdpB_a@`jAaUl^gO|SqQff@yh@p\\k_@~f@mj@pWeYn\\_`@haAo`Axl@{n@vMmNlUoVdKwKzTyUvUwVdIsI`BuBpCuGj@oAdBgEfBuDb@_Ah@eA~DiIdCeFrA_D|@qCt@{Bb@}BtJ}w@b@cIDaBGmBqA{D"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "sub": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Viale Marche"
                                                }
                                              ],
                                              "type": "turn",
                                              "modifier": "left",
                                              "text": "Viale Marche"
                                            },
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Via Gioacchino Murat"
                                                }
                                              ],
                                              "type": "turn",
                                              "modifier": "slight right",
                                              "text": "Via Gioacchino Murat"
                                            },
                                            "distanceAlongGeometry": 462.094
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra un quarto di miglio, Svolta a destra per rimanere su <say-as interpret-as=\"address\">Via Gioacchino Murat</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra un quarto di miglio, Svolta a destra per rimanere su Via Gioacchino Murat.",
                                            "distanceAlongGeometry": 445.427
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Svolta a destra per rimanere su <say-as interpret-as=\"address\">Via Gioacchino Murat</say-as>. poi Svolta a sinistra su <say-as interpret-as=\"address\">Viale Marche</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Svolta a destra per rimanere su Via Gioacchino Murat. poi Svolta a sinistra su Viale Marche.",
                                            "distanceAlongGeometry": 122.222
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [
                                              true,
                                              true,
                                              false,
                                              true,
                                              true
                                            ],
                                            "in": 2,
                                            "bearings": [
                                              68,
                                              163,
                                              247,
                                              284,
                                              345
                                            ],
                                            "duration": 18.283,
                                            "turn_weight": 6.5,
                                            "turn_duration": 2.883,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 24.595,
                                            "geometry_index": 316,
                                            "location": [9.190215, 45.500899]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [73, 162, 253, 344],
                                            "duration": 1.421,
                                            "turn_duration": 0.021,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.645,
                                            "geometry_index": 319,
                                            "location": [9.190488, 45.500234]
                                          },
                                          {
                                            "entry": [false, true, false],
                                            "in": 2,
                                            "bearings": [75, 164, 342],
                                            "duration": 1.015,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.184,
                                            "geometry_index": 320,
                                            "location": [9.190517, 45.500171]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [75, 164, 253, 344],
                                            "duration": 10.819,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 12.69,
                                            "geometry_index": 321,
                                            "location": [9.190541, 45.500113]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [163, 253, 344],
                                            "duration": 3.919,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.583,
                                            "geometry_index": 323,
                                            "location": [9.190812, 45.499463]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [75, 163, 253, 343],
                                            "duration": 0.619,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 0.705,
                                            "geometry_index": 324,
                                            "location": [9.190908, 45.499243]
                                          },
                                          {
                                            "entry": [false, true, false],
                                            "in": 2,
                                            "bearings": [115, 164, 343],
                                            "duration": 2.819,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.36,
                                            "geometry_index": 325,
                                            "location": [9.190922, 45.49921]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [75, 165, 344],
                                            "duration": 3.111,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.724,
                                            "geometry_index": 326,
                                            "location": [9.190997, 45.499027]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [75, 164, 253, 345],
                                            "duration": 4.365,
                                            "turn_duration": 0.021,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 5.214,
                                            "geometry_index": 327,
                                            "location": [9.191083, 45.498808]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [163, 253, 344],
                                            "duration": 6.847,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 8.193,
                                            "geometry_index": 328,
                                            "location": [9.191204, 45.498508]
                                          },
                                          {
                                            "entry": [true, true, true, false],
                                            "in": 3,
                                            "bearings": [76, 164, 255, 343],
                                            "duration": 5.91,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 7.069,
                                            "geometry_index": 329,
                                            "location": [9.191408, 45.498039]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [61, 164, 344],
                                            "duration": 7.409,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 8.867,
                                            "geometry_index": 330,
                                            "location": [9.191539, 45.497726]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [164, 253, 344],
                                            "duration": 10.219,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 12.24,
                                            "geometry_index": 331,
                                            "location": [9.191678, 45.497394]
                                          },
                                          {
                                            "bearings": [70, 161, 249, 344],
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "turn_duration": 0.024,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "geometry_index": 332,
                                            "location": [9.191859, 45.496952]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "turn",
                                          "instruction":
                                              "Svolta a destra su Via Gioacchino Murat.",
                                          "modifier": "right",
                                          "bearing_after": 163,
                                          "bearing_before": 67,
                                          "location": [9.190215, 45.500899]
                                        },
                                        "name": "Via Gioacchino Murat",
                                        "duration": 77.581,
                                        "distance": 462.094,
                                        "driving_side": "right",
                                        "weight": 95.029,
                                        "mode": "driving",
                                        "geometry":
                                            "e}cxuAms|oPlCaAzb@oMf@O|By@rBo@TI|f@sOvL_E`A[lJuCtLkDvQqFh\\wKpReGvSuGrZiJhAc@"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Viale Marche"
                                                }
                                              ],
                                              "type": "turn",
                                              "modifier": "left",
                                              "text": "Viale Marche"
                                            },
                                            "distanceAlongGeometry": 78.576
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Svolta a sinistra su <say-as interpret-as=\"address\">Viale Marche</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Svolta a sinistra su Viale Marche.",
                                            "distanceAlongGeometry": 57.576
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [165, 201, 341],
                                            "duration": 3.7,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.1,
                                            "mapbox_streets_v8": {
                                              "class": "primary_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 4.092,
                                            "geometry_index": 333,
                                            "location": [9.191877, 45.496915]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              false,
                                              true,
                                              false
                                            ],
                                            "in": 0,
                                            "bearings": [21, 165, 196, 345],
                                            "duration": 3.883,
                                            "turn_duration": 0.026,
                                            "mapbox_streets_v8": {
                                              "class": "primary_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 2.777,
                                            "geometry_index": 334,
                                            "location": [9.191811, 45.496795]
                                          },
                                          {
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "bearings": [16, 199, 289],
                                            "duration": 4.059,
                                            "turn_duration": 0.009,
                                            "mapbox_streets_v8": {
                                              "class": "primary_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.916,
                                            "geometry_index": 335,
                                            "location": [9.191759, 45.496667]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              false,
                                              true,
                                              false
                                            ],
                                            "in": 0,
                                            "bearings": [19, 113, 198, 291],
                                            "duration": 1.582,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 1.134,
                                            "geometry_index": 337,
                                            "location": [9.191684, 45.49651]
                                          },
                                          {
                                            "entry": [false, false, true, true],
                                            "in": 0,
                                            "bearings": [18, 110, 200, 291],
                                            "duration": 3.331,
                                            "turn_weight": 7,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "primary_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 2,
                                            "weight": 9.393,
                                            "geometry_index": 338,
                                            "location": [9.191654, 45.496447]
                                          },
                                          {
                                            "bearings": [20, 200, 291],
                                            "entry": [false, true, true],
                                            "in": 0,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary_link"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "geometry_index": 339,
                                            "location": [9.191599, 45.496343]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "continue",
                                          "instruction":
                                              "Svolta a destra per rimanere su Via Gioacchino Murat.",
                                          "modifier": "slight right",
                                          "bearing_after": 201,
                                          "bearing_before": 161,
                                          "location": [9.191877, 45.496915]
                                        },
                                        "name": "Via Gioacchino Murat",
                                        "duration": 19.609,
                                        "distance": 78.576,
                                        "driving_side": "right",
                                        "weight": 22.505,
                                        "mode": "driving",
                                        "geometry":
                                            "ed|wuAi{_pPnFbC~FfBfFlBpAf@|Bz@nElB|DbB"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Viale Abruzzi"
                                                }
                                              ],
                                              "type": "turn",
                                              "modifier": "slight right",
                                              "text": "Viale Abruzzi"
                                            },
                                            "distanceAlongGeometry": 2302.506
                                          },
                                          {
                                            "sub": {
                                              "components": [
                                                {
                                                  "active": false,
                                                  "directions": [
                                                    "left",
                                                    "straight"
                                                  ],
                                                  "type": "lane",
                                                  "text": ""
                                                },
                                                {
                                                  "active": false,
                                                  "directions": ["straight"],
                                                  "type": "lane",
                                                  "text": ""
                                                },
                                                {
                                                  "active": false,
                                                  "directions": ["straight"],
                                                  "type": "lane",
                                                  "text": ""
                                                },
                                                {
                                                  "active_direction": "right",
                                                  "active": true,
                                                  "directions": [
                                                    "straight",
                                                    "right"
                                                  ],
                                                  "type": "lane",
                                                  "text": ""
                                                }
                                              ],
                                              "text": ""
                                            },
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Viale Abruzzi"
                                                }
                                              ],
                                              "type": "turn",
                                              "modifier": "slight right",
                                              "text": "Viale Abruzzi"
                                            },
                                            "distanceAlongGeometry": 402.336
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Prosegui per 1,5 miglia.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Prosegui per 1,5 miglia.",
                                            "distanceAlongGeometry": 2285.839
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra un quarto di miglio, Svolta a destra su <say-as interpret-as=\"address\">Viale Abruzzi</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra un quarto di miglio, Svolta a destra su Viale Abruzzi.",
                                            "distanceAlongGeometry": 402.336
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Svolta a destra su <say-as interpret-as=\"address\">Viale Abruzzi</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Svolta a destra su Viale Abruzzi.",
                                            "distanceAlongGeometry": 88.889
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "entry": [false, true, false],
                                            "in": 0,
                                            "bearings": [20, 111, 291],
                                            "duration": 12.687,
                                            "turn_weight": 8.75,
                                            "turn_duration": 5.275,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 17.644,
                                            "geometry_index": 340,
                                            "location": [9.191549, 45.496248]
                                          },
                                          {
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "in": 2,
                                            "bearings": [110, 179, 291, 353],
                                            "duration": 2.56,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 3.049,
                                            "geometry_index": 341,
                                            "location": [9.191968, 45.496136]
                                          },
                                          {
                                            "entry": [true, true, false, true],
                                            "in": 2,
                                            "bearings": [111, 187, 290, 349],
                                            "duration": 2.407,
                                            "turn_weight": 2,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.88,
                                            "geometry_index": 342,
                                            "location": [9.192118, 45.496097]
                                          },
                                          {
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "in": 2,
                                            "bearings": [111, 197, 291, 358],
                                            "duration": 6.807,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 8.16,
                                            "geometry_index": 343,
                                            "location": [9.192256, 45.49606]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [112, 201, 291],
                                            "duration": 0.608,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 0.72,
                                            "geometry_index": 345,
                                            "location": [9.192658, 45.495952]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [23, 111, 199, 292],
                                            "duration": 1.607,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.92,
                                            "geometry_index": 346,
                                            "location": [9.192694, 45.495942]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [23, 111, 291],
                                            "duration": 9.536,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 11.935,
                                            "geometry_index": 347,
                                            "location": [9.192792, 45.495916]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [111, 201, 291],
                                            "duration": 13.348,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 16.009,
                                            "geometry_index": 348,
                                            "location": [9.193334, 45.49577]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [23, 111, 201, 291],
                                            "duration": 1.277,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.557,
                                            "geometry_index": 350,
                                            "location": [9.194089, 45.495567]
                                          },
                                          {
                                            "entry": [false, true, true, false],
                                            "in": 3,
                                            "bearings": [23, 110, 201, 291],
                                            "duration": 0.958,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.15,
                                            "geometry_index": 351,
                                            "location": [9.19416, 45.495548]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [112, 290],
                                            "duration": 2.035,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.493,
                                            "geometry_index": 352,
                                            "location": [9.194238, 45.495528]
                                          },
                                          {
                                            "entry": [false, true, true, false],
                                            "in": 3,
                                            "bearings": [21, 111, 201, 292],
                                            "duration": 1.729,
                                            "turn_weight": 2,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 4.109,
                                            "geometry_index": 354,
                                            "location": [9.194398, 45.495483]
                                          },
                                          {
                                            "entry": [true, true, false, false],
                                            "in": 3,
                                            "bearings": [23, 111, 201, 291],
                                            "duration": 1.74,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.623,
                                            "geometry_index": 356,
                                            "location": [9.194535, 45.495446]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [112, 291],
                                            "duration": 0.8,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 0.98,
                                            "geometry_index": 358,
                                            "location": [9.194685, 45.495405]
                                          },
                                          {
                                            "entry": [true, true, false, false],
                                            "in": 3,
                                            "bearings": [21, 111, 201, 292],
                                            "duration": 0.94,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.143,
                                            "geometry_index": 359,
                                            "location": [9.194756, 45.495385]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [21, 111, 201, 291],
                                            "duration": 0.94,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.143,
                                            "geometry_index": 360,
                                            "location": [9.194844, 45.495361]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [112, 291],
                                            "duration": 0.533,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 0.653,
                                            "geometry_index": 361,
                                            "location": [9.194923, 45.49534]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [111, 163, 292],
                                            "duration": 14.407,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 17.64,
                                            "geometry_index": 362,
                                            "location": [9.194973, 45.495326]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [111, 291],
                                            "duration": 1.895,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.321,
                                            "geometry_index": 364,
                                            "location": [9.195883, 45.495079]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [21, 111, 201, 291],
                                            "duration": 2.091,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.553,
                                            "geometry_index": 366,
                                            "location": [9.195997, 45.495049]
                                          },
                                          {
                                            "entry": [true, true, true, false],
                                            "in": 3,
                                            "bearings": [21, 112, 203, 291],
                                            "duration": 0.908,
                                            "turn_weight": 1,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.103,
                                            "geometry_index": 367,
                                            "location": [9.196133, 45.495013]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [21, 110, 201, 292],
                                            "duration": 0.428,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 0.501,
                                            "geometry_index": 369,
                                            "location": [9.196264, 45.494976]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [111, 290],
                                            "duration": 6.873,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 8.419,
                                            "geometry_index": 370,
                                            "location": [9.196319, 45.494962]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [111, 291],
                                            "duration": 0.491,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 0.601,
                                            "geometry_index": 371,
                                            "location": [9.197318, 45.494693]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [23, 111, 203, 291],
                                            "duration": 0.989,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.203,
                                            "geometry_index": 372,
                                            "location": [9.197389, 45.494674]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [109, 201, 291],
                                            "duration": 0.728,
                                            "turn_duration": 0.022,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 0.865,
                                            "geometry_index": 374,
                                            "location": [9.19753, 45.494636]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [110, 289],
                                            "duration": 6,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 7.35,
                                            "geometry_index": 375,
                                            "location": [9.197652, 45.494606]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [106, 200, 286],
                                            "duration": 0.713,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 0.865,
                                            "geometry_index": 378,
                                            "location": [9.198683, 45.494373]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [111, 286],
                                            "duration": 1.323,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 1.62,
                                            "geometry_index": 379,
                                            "location": [9.198812, 45.494347]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [114, 291],
                                            "duration": 1.102,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 1.35,
                                            "geometry_index": 380,
                                            "location": [9.199028, 45.494289]
                                          },
                                          {
                                            "entry": [true, true, false, false],
                                            "in": 3,
                                            "bearings": [114, 132, 200, 294],
                                            "duration": 6.972,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 8.532,
                                            "geometry_index": 381,
                                            "location": [9.199202, 45.494235]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [121, 296],
                                            "duration": 1.722,
                                            "turn_weight": 5,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 7.109,
                                            "geometry_index": 383,
                                            "location": [9.200236, 45.493896]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [122, 301],
                                            "duration": 5.713,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 6.999,
                                            "geometry_index": 384,
                                            "location": [9.200483, 45.493792]
                                          },
                                          {
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [125, 272, 291, 305],
                                            "duration": 0.694,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 0.827,
                                            "geometry_index": 386,
                                            "location": [9.201261, 45.493433]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [125, 305],
                                            "duration": 3.462,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.24,
                                            "geometry_index": 387,
                                            "location": [9.201325, 45.493402]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [126, 218, 305],
                                            "duration": 0.573,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 0.678,
                                            "geometry_index": 388,
                                            "location": [9.201584, 45.493275]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [133, 306],
                                            "duration": 29.25,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 35.831,
                                            "geometry_index": 389,
                                            "location": [9.201629, 45.493252]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [126, 307],
                                            "duration": 3.15,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 3.859,
                                            "geometry_index": 392,
                                            "location": [9.202945, 45.492531]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [124, 282, 306],
                                            "duration": 14.646,
                                            "turn_duration": 0.021,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 17.916,
                                            "geometry_index": 393,
                                            "location": [9.203089, 45.492457]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [37, 125, 215, 304],
                                            "duration": 0.682,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 0.827,
                                            "geometry_index": 395,
                                            "location": [9.203782, 45.492127]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [37, 126, 218, 305],
                                            "duration": 2.044,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.481,
                                            "geometry_index": 396,
                                            "location": [9.203812, 45.492112]
                                          },
                                          {
                                            "entry": [false, true, true, false],
                                            "in": 3,
                                            "bearings": [38, 125, 218, 306],
                                            "duration": 2.482,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 4.517,
                                            "geometry_index": 397,
                                            "location": [9.203901, 45.492067]
                                          },
                                          {
                                            "entry": [true, true, false, false],
                                            "in": 3,
                                            "bearings": [39, 126, 220, 305],
                                            "duration": 1.639,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.484,
                                            "geometry_index": 398,
                                            "location": [9.204033, 45.492001]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [38, 125, 220, 306],
                                            "duration": 0.739,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 0.882,
                                            "geometry_index": 399,
                                            "location": [9.204126, 45.491953]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [37, 126, 218, 305],
                                            "duration": 2.719,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.307,
                                            "geometry_index": 400,
                                            "location": [9.204165, 45.491934]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [126, 220, 306],
                                            "duration": 13.093,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 16.015,
                                            "geometry_index": 401,
                                            "location": [9.204324, 45.491853]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [35, 125, 215, 306],
                                            "duration": 1.914,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.321,
                                            "geometry_index": 402,
                                            "location": [9.20504, 45.49149]
                                          },
                                          {
                                            "entry": [false, true, true, false],
                                            "in": 3,
                                            "bearings": [38, 126, 220, 305],
                                            "duration": 3.099,
                                            "turn_duration": 2.019,
                                            "traffic_signal": true,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.323,
                                            "geometry_index": 403,
                                            "location": [9.20514, 45.49144]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [38, 126, 218, 306],
                                            "duration": 7.939,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 9.702,
                                            "geometry_index": 405,
                                            "location": [9.205205, 45.491407]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [126, 306],
                                            "duration": 6.12,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 7.497,
                                            "geometry_index": 406,
                                            "location": [9.205665, 45.491174]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 4,
                                            "bearings": [
                                              68,
                                              126,
                                              175,
                                              244,
                                              306
                                            ],
                                            "duration": 4.305,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 5.25,
                                            "geometry_index": 407,
                                            "location": [9.206016, 45.490995]
                                          },
                                          {
                                            "entry": [true, true, false, false],
                                            "in": 3,
                                            "bearings": [37, 123, 214, 306],
                                            "duration": 2.972,
                                            "turn_duration": 2.024,
                                            "traffic_signal": true,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.161,
                                            "geometry_index": 410,
                                            "location": [9.206273, 45.490863]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [124, 215, 303],
                                            "duration": 0.807,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 0.98,
                                            "geometry_index": 412,
                                            "location": [9.206328, 45.490838]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [34, 123, 214, 304],
                                            "duration": 3.621,
                                            "turn_duration": 0.021,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 4.41,
                                            "geometry_index": 413,
                                            "location": [9.206375, 45.490816]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [123, 251, 303],
                                            "duration": 7.007,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 8.561,
                                            "geometry_index": 414,
                                            "location": [9.206565, 45.490731]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [123, 217, 302],
                                            "duration": 2.019,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.45,
                                            "geometry_index": 417,
                                            "location": [9.206918, 45.490571]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [23, 123, 201, 303],
                                            "duration": 2.619,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.185,
                                            "geometry_index": 418,
                                            "location": [9.207025, 45.490523]
                                          },
                                          {
                                            "entry": [true, true, true, false],
                                            "in": 3,
                                            "bearings": [34, 123, 210, 303],
                                            "duration": 3.165,
                                            "turn_duration": 2.019,
                                            "traffic_signal": true,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.403,
                                            "geometry_index": 419,
                                            "location": [9.207161, 45.490462]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [38, 127, 218, 303],
                                            "duration": 0.153,
                                            "turn_duration": 0.009,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 0.176,
                                            "geometry_index": 420,
                                            "location": [9.207236, 45.490428]
                                          },
                                          {
                                            "entry": [true, false],
                                            "classes": ["tunnel"],
                                            "in": 1,
                                            "bearings": [126, 307],
                                            "duration": 32.727,
                                            "turn_weight": 5,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 45.091,
                                            "geometry_index": 421,
                                            "location": [9.207259, 45.490416]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [126, 306],
                                            "duration": 0.847,
                                            "turn_weight": 5,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 6.038,
                                            "geometry_index": 422,
                                            "location": [9.209323, 45.48935]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [32, 127, 213, 306],
                                            "duration": 1.278,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.557,
                                            "geometry_index": 423,
                                            "location": [9.209362, 45.48933]
                                          },
                                          {
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "location": [9.209427, 45.489296],
                                            "geometry_index": 424,
                                            "admin_index": 0,
                                            "weight": 9.9,
                                            "is_urban": true,
                                            "traffic_signal": true,
                                            "turn_duration": 2.008,
                                            "turn_weight": 5,
                                            "duration": 6.008,
                                            "bearings": [34, 130, 214, 307],
                                            "out": 1,
                                            "in": 3,
                                            "entry": [false, true, true, false]
                                          },
                                          {
                                            "entry": [true, true, false, false],
                                            "in": 3,
                                            "bearings": [32, 130, 214, 310],
                                            "duration": 3.333,
                                            "turn_duration": 2.007,
                                            "traffic_signal": true,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.625,
                                            "geometry_index": 425,
                                            "location": [9.209621, 45.489182]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [37, 126, 217, 310],
                                            "duration": 11.016,
                                            "turn_duration": 0.026,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 13.462,
                                            "geometry_index": 426,
                                            "location": [9.20969, 45.489142]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [37, 126, 306],
                                            "duration": 0.967,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.161,
                                            "geometry_index": 427,
                                            "location": [9.210299, 45.488836]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [34, 128, 213, 306],
                                            "duration": 1.334,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.625,
                                            "geometry_index": 428,
                                            "location": [9.21035, 45.48881]
                                          },
                                          {
                                            "entry": [true, true, false, false],
                                            "in": 3,
                                            "bearings": [37, 123, 215, 308],
                                            "duration": 3.468,
                                            "turn_duration": 2.028,
                                            "traffic_signal": true,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.764,
                                            "geometry_index": 429,
                                            "location": [9.210423, 45.48877]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [37, 126, 215, 303],
                                            "duration": 14.048,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 17.199,
                                            "geometry_index": 430,
                                            "location": [9.210506, 45.488732]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [37, 126, 215, 306],
                                            "duration": 1.459,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.764,
                                            "geometry_index": 431,
                                            "location": [9.211315, 45.488325]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [125, 217, 306],
                                            "duration": 1.925,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.335,
                                            "geometry_index": 432,
                                            "location": [9.211394, 45.488285]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [35, 126, 215, 305],
                                            "duration": 12.937,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 15.824,
                                            "geometry_index": 433,
                                            "location": [9.211484, 45.48824]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [37, 125, 306],
                                            "duration": 2.137,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.594,
                                            "geometry_index": 434,
                                            "location": [9.212115, 45.487923]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [37, 126, 215, 305],
                                            "duration": 2.56,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.113,
                                            "geometry_index": 435,
                                            "location": [9.212217, 45.487872]
                                          },
                                          {
                                            "entry": [
                                              true,
                                              true,
                                              false,
                                              true,
                                              false
                                            ],
                                            "in": 4,
                                            "bearings": [
                                              37,
                                              126,
                                              165,
                                              217,
                                              306
                                            ],
                                            "duration": 4.772,
                                            "turn_duration": 2.019,
                                            "traffic_signal": true,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.372,
                                            "geometry_index": 437,
                                            "location": [9.212346, 45.487807]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [35, 126, 215, 306],
                                            "duration": 19.078,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 23.347,
                                            "geometry_index": 439,
                                            "location": [9.212477, 45.487741]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [35, 126, 215, 306],
                                            "duration": 1.713,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.075,
                                            "geometry_index": 440,
                                            "location": [9.213419, 45.487267]
                                          },
                                          {
                                            "entry": [true, true, true, false],
                                            "in": 3,
                                            "bearings": [30, 125, 201, 306],
                                            "duration": 2.719,
                                            "turn_weight": 2,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 5.307,
                                            "geometry_index": 441,
                                            "location": [9.213504, 45.487224]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [30, 125, 208, 305],
                                            "duration": 17.794,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 21.774,
                                            "geometry_index": 442,
                                            "location": [9.213634, 45.487161]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [125, 220, 305],
                                            "duration": 11.779,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 14.406,
                                            "geometry_index": 443,
                                            "location": [9.214464, 45.486749]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [35, 125, 215, 305],
                                            "duration": 3.379,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 4.116,
                                            "geometry_index": 444,
                                            "location": [9.214973, 45.486498]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [125, 177, 305],
                                            "duration": 1.369,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 1.654,
                                            "geometry_index": 445,
                                            "location": [9.215123, 45.486425]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [125, 139, 305],
                                            "duration": 4.069,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.961,
                                            "geometry_index": 446,
                                            "location": [9.215191, 45.486392]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [63, 122, 305],
                                            "duration": 4.193,
                                            "turn_duration": 0.024,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 5.106,
                                            "geometry_index": 447,
                                            "location": [9.21538, 45.486299]
                                          },
                                          {
                                            "entry": [false, true, true, false],
                                            "in": 3,
                                            "bearings": [80, 122, 258, 302],
                                            "duration": 5.719,
                                            "turn_weight": 7,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 13.983,
                                            "geometry_index": 449,
                                            "location": [9.215618, 45.486194]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [122, 267, 302],
                                            "duration": 2.359,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.866,
                                            "geometry_index": 451,
                                            "location": [9.216035, 45.486011]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 1,
                                            "bearings": [123, 302, 346],
                                            "duration": 2.672,
                                            "turn_weight": 1,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.25,
                                            "geometry_index": 452,
                                            "location": [9.216179, 45.485948]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [30, 119, 211, 303],
                                            "duration": 1.159,
                                            "turn_duration": 0.022,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 1.393,
                                            "geometry_index": 454,
                                            "location": [9.216327, 45.48588]
                                          },
                                          {
                                            "entry": [
                                              true,
                                              true,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 4,
                                            "bearings": [
                                              34,
                                              119,
                                              215,
                                              275,
                                              299
                                            ],
                                            "duration": 1.608,
                                            "turn_weight": 2,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.96,
                                            "geometry_index": 455,
                                            "location": [9.216391, 45.485855]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [35, 123, 218, 299],
                                            "duration": 0.609,
                                            "turn_duration": 0.009,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 0.735,
                                            "geometry_index": 456,
                                            "location": [9.21648, 45.48582]
                                          },
                                          {
                                            "bearings": [118, 303],
                                            "entry": [true, false],
                                            "in": 1,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "geometry_index": 458,
                                            "location": [9.216511, 45.485806]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "end of road",
                                          "instruction":
                                              "Svolta a sinistra su Viale Marche.",
                                          "modifier": "left",
                                          "bearing_after": 111,
                                          "bearing_before": 200,
                                          "location": [9.191549, 45.496248]
                                        },
                                        "name": "Viale Marche",
                                        "duration": 418.217,
                                        "distance": 2302.506,
                                        "driving_side": "right",
                                        "weight": 537.006,
                                        "mode": "driving",
                                        "geometry":
                                            "ozzwuAyf_pP~EeYlAkHhAsGpEoWDSRgAr@cEbH{`@`K{k@RiAd@mCf@{Cf@iCp@uDd@mCb@cCx@sEVwAf@mCn@oDh@}CZcBzM}u@P}@d@oCTsAfAoGHa@~@cFZmBxOm}@d@mC@EhAsGz@sFrGi`@`BqPzAqLr@aGrBoLjB{IhMyk@zEyRnEmNvIwWtJ{V|@_C|FeOl@yAxGkLtCcGp^w{@rC_H|Q{f@t@mB\\{@xAqDbCgG~AyDd@mA`D}HtUwk@bBgEl@}ARc@pMw[dJ}T|DsJr@_BTm@Nc@`@iAj@}AhD{Jx@uB~DqLdAyC~AuExBoGbAuCVm@raA_`Cf@mAbAaCbFcKnAiCbRae@r@eBnAqCjAeDlXqq@nA}CxAsDxRmf@dBkEnB_FPa@N_@rBeFr\\{y@tAiD|BcGvX{r@tNy^pCkH`AgCxDyJbAyClCaIbEaMhD_K|B_HZaAjBeFp@_CdAqDFORm@rCiK"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Viale Gran Sasso"
                                                }
                                              ],
                                              "type": "turn",
                                              "modifier": "left",
                                              "text": "Viale Gran Sasso"
                                            },
                                            "distanceAlongGeometry": 224.646
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra 700 piedi, Svolta a sinistra su <say-as interpret-as=\"address\">Viale Gran Sasso</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra 700 piedi, Svolta a sinistra su Viale Gran Sasso.",
                                            "distanceAlongGeometry": 207.98
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Svolta a sinistra su <say-as interpret-as=\"address\">Viale Gran Sasso</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Svolta a sinistra su Viale Gran Sasso.",
                                            "distanceAlongGeometry": 94.444
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "lanes": [
                                              {
                                                "indications": [
                                                  "left",
                                                  "straight"
                                                ],
                                                "valid": false,
                                                "active": false
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid": false,
                                                "active": false
                                              },
                                              {
                                                "indications": ["straight"],
                                                "valid": false,
                                                "active": false
                                              },
                                              {
                                                "indications": [
                                                  "straight",
                                                  "right"
                                                ],
                                                "valid_indication": "right",
                                                "valid": true,
                                                "active": true
                                              }
                                            ],
                                            "location": [9.216708, 45.485732],
                                            "geometry_index": 459,
                                            "admin_index": 0,
                                            "weight": 9.655,
                                            "is_urban": true,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "turn_duration": 0.088,
                                            "turn_weight": 5,
                                            "duration": 3.888,
                                            "bearings": [92, 156, 298],
                                            "out": 1,
                                            "in": 2,
                                            "entry": [true, true, false]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [83, 176, 265, 336],
                                            "duration": 2.826,
                                            "turn_duration": 0.026,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.43,
                                            "geometry_index": 467,
                                            "location": [9.216808, 45.485578]
                                          },
                                          {
                                            "entry": [false, true, false],
                                            "in": 2,
                                            "bearings": [56, 179, 356],
                                            "duration": 2.851,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.482,
                                            "geometry_index": 471,
                                            "location": [9.21682, 45.485449]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [179, 270, 359],
                                            "duration": 17.16,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 21.012,
                                            "geometry_index": 472,
                                            "location": [9.216825, 45.485312]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [89, 179, 270, 359],
                                            "duration": 2.125,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.594,
                                            "geometry_index": 473,
                                            "location": [9.21684, 45.484584]
                                          },
                                          {
                                            "entry": [true, true, true, false],
                                            "in": 3,
                                            "bearings": [89, 179, 275, 359],
                                            "duration": 16.195,
                                            "turn_duration": 2.007,
                                            "traffic_signal": true,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 17.381,
                                            "geometry_index": 474,
                                            "location": [9.216843, 45.484496]
                                          },
                                          {
                                            "bearings": [120, 181, 301, 359],
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "turn_duration": 0.008,
                                            "mapbox_streets_v8": {
                                              "class": "primary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "geometry_index": 475,
                                            "location": [9.216862, 45.483895]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "turn",
                                          "instruction":
                                              "Svolta a destra su Viale Abruzzi.",
                                          "modifier": "slight right",
                                          "bearing_after": 156,
                                          "bearing_before": 118,
                                          "location": [9.216708, 45.485732]
                                        },
                                        "name": "Viale Abruzzi",
                                        "duration": 48.865,
                                        "distance": 224.646,
                                        "driving_side": "right",
                                        "weight": 62.223,
                                        "mode": "driving",
                                        "geometry":
                                            "gifwuAgkpqPT]T[X]VUj@_@j@Uf@OtASn@I|@GhAChAApGInl@]nDEpd@e@`IF"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Via Giovanni Pacini"
                                                }
                                              ],
                                              "degrees": 242,
                                              "driving_side": "right",
                                              "type": "roundabout",
                                              "modifier": "right",
                                              "text": "Via Giovanni Pacini"
                                            },
                                            "distanceAlongGeometry": 593.706
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra un quarto di miglio, Entra in <say-as interpret-as=\"address\">Piazzale Gabrio Piola</say-as> e prendi la 5a uscita per <say-as interpret-as=\"address\">Via Giovanni Pacini</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra un quarto di miglio, Entra in Piazzale Gabrio Piola e prendi la 5a uscita per Via Giovanni Pacini.",
                                            "distanceAlongGeometry": 545.135
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Entra in <say-as interpret-as=\"address\">Piazzale Gabrio Piola</say-as> e prendi la 5a uscita per <say-as interpret-as=\"address\">Via Giovanni Pacini</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Entra in Piazzale Gabrio Piola e prendi la 5a uscita per Via Giovanni Pacini.",
                                            "distanceAlongGeometry": 133.333
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "location": [9.216858, 45.483734],
                                            "geometry_index": 476,
                                            "admin_index": 0,
                                            "weight": 15.68,
                                            "is_urban": true,
                                            "traffic_signal": true,
                                            "turn_duration": 2.828,
                                            "turn_weight": 8,
                                            "duration": 9.228,
                                            "bearings": [
                                              1,
                                              97,
                                              117,
                                              130,
                                              179,
                                              306
                                            ],
                                            "out": 3,
                                            "in": 0,
                                            "entry": [
                                              false,
                                              false,
                                              false,
                                              true,
                                              true,
                                              true
                                            ]
                                          },
                                          {
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "location": [9.217169, 45.483548],
                                            "geometry_index": 477,
                                            "admin_index": 0,
                                            "weight": 4.152,
                                            "is_urban": true,
                                            "traffic_signal": true,
                                            "turn_duration": 2.038,
                                            "turn_weight": 3,
                                            "duration": 2.998,
                                            "bearings": [119, 180, 310, 359],
                                            "out": 0,
                                            "in": 2,
                                            "entry": [true, false, false, true]
                                          },
                                          {
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "in": 2,
                                            "bearings": [124, 179, 299, 359],
                                            "duration": 2.65,
                                            "turn_weight": 1,
                                            "turn_duration": 0.01,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.168,
                                            "geometry_index": 478,
                                            "location": [9.217256, 45.483514]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [126, 265, 304],
                                            "duration": 29.15,
                                            "turn_weight": 1,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 35.971,
                                            "geometry_index": 479,
                                            "location": [9.217489, 45.483405]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [0, 124, 179, 306],
                                            "duration": 1.392,
                                            "turn_weight": 1,
                                            "turn_duration": 0.021,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.646,
                                            "geometry_index": 480,
                                            "location": [9.219261, 45.482511]
                                          },
                                          {
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "location": [9.219343, 45.482472],
                                            "geometry_index": 481,
                                            "admin_index": 0,
                                            "weight": 2.44,
                                            "is_urban": true,
                                            "traffic_signal": true,
                                            "turn_duration": 2.007,
                                            "turn_weight": 1,
                                            "duration": 3.207,
                                            "bearings": [126, 179, 304, 359],
                                            "out": 0,
                                            "in": 2,
                                            "entry": [true, true, false, false]
                                          },
                                          {
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "in": 2,
                                            "bearings": [125, 177, 306, 359],
                                            "duration": 4.152,
                                            "turn_weight": 1,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 5.96,
                                            "geometry_index": 482,
                                            "location": [9.219436, 45.482425]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [126, 305],
                                            "duration": 5.2,
                                            "turn_weight": 0.5,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 6.74,
                                            "geometry_index": 483,
                                            "location": [9.219763, 45.482262]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [126, 306],
                                            "duration": 4.533,
                                            "turn_weight": 0.5,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 5.94,
                                            "geometry_index": 484,
                                            "location": [9.220174, 45.482056]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [126, 228, 306],
                                            "duration": 9.346,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 11.693,
                                            "geometry_index": 485,
                                            "location": [9.220531, 45.481877]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [1, 125, 182, 306],
                                            "duration": 1.492,
                                            "turn_weight": 1,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 2.767,
                                            "geometry_index": 486,
                                            "location": [9.221118, 45.481579]
                                          },
                                          {
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "location": [9.221212, 45.481532],
                                            "geometry_index": 487,
                                            "admin_index": 0,
                                            "weight": 2.111,
                                            "is_urban": true,
                                            "traffic_signal": true,
                                            "turn_duration": 2.007,
                                            "turn_weight": 1,
                                            "duration": 2.933,
                                            "bearings": [1, 127, 179, 305],
                                            "out": 1,
                                            "in": 3,
                                            "entry": [true, true, false, false]
                                          },
                                          {
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "bearings": [1, 127, 182, 307],
                                            "duration": 1.961,
                                            "turn_weight": 1,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 3.345,
                                            "geometry_index": 488,
                                            "location": [9.221306, 45.481483]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [125, 267, 307],
                                            "duration": 6.878,
                                            "turn_weight": 0.5,
                                            "turn_duration": 0.021,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 8.729,
                                            "geometry_index": 489,
                                            "location": [9.221504, 45.481377]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [126, 305],
                                            "duration": 12.343,
                                            "turn_weight": 0.5,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 15.311,
                                            "geometry_index": 490,
                                            "location": [9.221922, 45.48117]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [127, 306],
                                            "duration": 2.914,
                                            "turn_weight": 0.5,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 3.997,
                                            "geometry_index": 491,
                                            "location": [9.222677, 45.480791]
                                          },
                                          {
                                            "bearings": [37, 131, 215, 307],
                                            "entry": [
                                              false,
                                              true,
                                              false,
                                              false
                                            ],
                                            "in": 3,
                                            "turn_weight": 1,
                                            "turn_duration": 0.009,
                                            "mapbox_streets_v8": {
                                              "class": "secondary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "geometry_index": 492,
                                            "location": [9.222854, 45.480699]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "turn",
                                          "instruction":
                                              "Svolta a sinistra su Viale Gran Sasso.",
                                          "modifier": "left",
                                          "bearing_after": 119,
                                          "bearing_before": 181,
                                          "location": [9.216858, 45.483734]
                                        },
                                        "name": "Viale Gran Sasso",
                                        "duration": 103.132,
                                        "distance": 593.706,
                                        "driving_side": "right",
                                        "weight": 135.941,
                                        "mode": "driving",
                                        "geometry":
                                            "klbwuAstpqPrJmRbAmDxEqMzv@wmBlAcD|AyDdImSzKuXdJiUrQuc@|A{D`B{DrEkK|KcYtVen@vDaJ~D{H"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text": "Via Giovanni Pacini"
                                                }
                                              ],
                                              "degrees": 242,
                                              "driving_side": "right",
                                              "type": "roundabout",
                                              "modifier": "right",
                                              "text": "Via Giovanni Pacini"
                                            },
                                            "distanceAlongGeometry": 236.825
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Esci dalla rotonda su <say-as interpret-as=\"address\">Via Giovanni Pacini</say-as>.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Esci dalla rotonda su Via Giovanni Pacini.",
                                            "distanceAlongGeometry": 94.444
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "location": [9.223012, 45.480603],
                                            "geometry_index": 493,
                                            "admin_index": 0,
                                            "weight": 11.815,
                                            "is_urban": true,
                                            "traffic_signal": true,
                                            "turn_duration": 2.782,
                                            "turn_weight": 6,
                                            "duration": 7.628,
                                            "bearings": [30, 203, 311],
                                            "out": 1,
                                            "in": 2,
                                            "entry": [false, true, false]
                                          },
                                          {
                                            "entry": [false, true, false],
                                            "in": 0,
                                            "bearings": [10, 169, 280],
                                            "duration": 6.089,
                                            "turn_duration": 0.09,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 1,
                                            "weight": 7.2,
                                            "geometry_index": 496,
                                            "location": [9.222886, 45.480305]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [129, 225, 331],
                                            "duration": 6.69,
                                            "turn_duration": 0.09,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 7.92,
                                            "geometry_index": 500,
                                            "location": [9.223061, 45.479975]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [106, 165, 300],
                                            "duration": 1.852,
                                            "turn_duration": 0.052,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.16,
                                            "geometry_index": 504,
                                            "location": [9.223402, 45.479809]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [89, 135, 286],
                                            "duration": 7.148,
                                            "turn_duration": 2.066,
                                            "traffic_signal": true,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 6.099,
                                            "geometry_index": 505,
                                            "location": [9.223485, 45.479792]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [72, 201, 268],
                                            "duration": 1.771,
                                            "turn_duration": 0.056,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.057,
                                            "geometry_index": 507,
                                            "location": [9.223791, 45.479799]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [58, 182, 252],
                                            "duration": 5.452,
                                            "turn_duration": 0.052,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 6.48,
                                            "geometry_index": 508,
                                            "location": [9.223913, 45.479827]
                                          },
                                          {
                                            "bearings": [25, 124, 227],
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "turn_duration": 0.097,
                                            "mapbox_streets_v8": {
                                              "class": "roundabout"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "geometry_index": 512,
                                            "location": [9.224241, 45.480004]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "rotary",
                                          "exit": 5,
                                          "instruction":
                                              "Entra in Piazzale Gabrio Piola e prendi la 5a uscita per Via Giovanni Pacini.",
                                          "modifier": "right",
                                          "bearing_after": 203,
                                          "bearing_before": 131,
                                          "location": [9.223012, 45.480603]
                                        },
                                        "rotary_name": "Piazzale Gabrio Piola",
                                        "name": "Via Giovanni Pacini",
                                        "duration": 47.338,
                                        "distance": 236.825,
                                        "driving_side": "right",
                                        "weight": 56.199,
                                        "mode": "driving",
                                        "geometry":
                                            "uh|vuAgu|qPvDlChErApEXpDYjDcA`DmBrCqCjBwC|AkDhA}Dv@gD`@eDDyGSiIw@sFg@eCuAcEiBoDyBuCmDoC{D_BeEk@gEJaE`A"
                                      },
                                      {
                                        "bannerInstructions": [
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text":
                                                      "La tua destinazione sarà sulla sinistra"
                                                }
                                              ],
                                              "type": "arrive",
                                              "modifier": "left",
                                              "text":
                                                  "La tua destinazione sarà sulla sinistra"
                                            },
                                            "distanceAlongGeometry": 438.469
                                          },
                                          {
                                            "primary": {
                                              "components": [
                                                {
                                                  "type": "text",
                                                  "text":
                                                      "La tua destinazione è sulla sinistra"
                                                }
                                              ],
                                              "type": "arrive",
                                              "modifier": "left",
                                              "text":
                                                  "La tua destinazione è sulla sinistra"
                                            },
                                            "distanceAlongGeometry": 69.444
                                          }
                                        ],
                                        "voiceInstructions": [
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Tra un quarto di miglio, La tua destinazione sarà sulla sinistra.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "Tra un quarto di miglio, La tua destinazione sarà sulla sinistra.",
                                            "distanceAlongGeometry": 421.802
                                          },
                                          {
                                            "ssmlAnnouncement":
                                                "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">La tua destinazione è sulla sinistra.</prosody></amazon:effect></speak>",
                                            "announcement":
                                                "La tua destinazione è sulla sinistra.",
                                            "distanceAlongGeometry": 69.444
                                          }
                                        ],
                                        "intersections": [
                                          {
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "location": [9.224344, 45.480481],
                                            "geometry_index": 517,
                                            "admin_index": 0,
                                            "weight": 8.986,
                                            "is_urban": true,
                                            "traffic_signal": true,
                                            "turn_duration": 2.882,
                                            "turn_weight": 6,
                                            "duration": 5.423,
                                            "bearings": [66, 172, 338],
                                            "out": 0,
                                            "in": 1,
                                            "entry": [true, false, true]
                                          },
                                          {
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "in": 2,
                                            "bearings": [65, 153, 246, 334],
                                            "duration": 2.56,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.486,
                                            "geometry_index": 518,
                                            "location": [9.224488, 45.480527]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 1,
                                            "bearings": [64, 245, 334],
                                            "duration": 7.432,
                                            "turn_weight": 1,
                                            "turn_duration": 0.021,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 9.709,
                                            "geometry_index": 519,
                                            "location": [9.224629, 45.480573]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [65, 153, 244],
                                            "duration": 1.407,
                                            "turn_weight": 0.75,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.395,
                                            "geometry_index": 520,
                                            "location": [9.225038, 45.480711]
                                          },
                                          {
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "in": 2,
                                            "bearings": [64, 153, 245, 335],
                                            "duration": 14.421,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.021,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 18.42,
                                            "geometry_index": 521,
                                            "location": [9.225119, 45.480737]
                                          },
                                          {
                                            "entry": [true, false, true],
                                            "in": 1,
                                            "bearings": [64, 244, 344],
                                            "duration": 6.372,
                                            "turn_weight": 0.75,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 8.215,
                                            "geometry_index": 523,
                                            "location": [9.225944, 45.48102]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [63, 125, 244],
                                            "duration": 2.944,
                                            "turn_weight": 0.75,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.187,
                                            "geometry_index": 524,
                                            "location": [9.226286, 45.481139]
                                          },
                                          {
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "in": 2,
                                            "bearings": [64, 176, 243, 358],
                                            "duration": 1.594,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 3.351,
                                            "geometry_index": 525,
                                            "location": [9.226431, 45.48119]
                                          },
                                          {
                                            "entry": [true, false],
                                            "in": 1,
                                            "bearings": [63, 244],
                                            "duration": 0.072,
                                            "turn_weight": 0.75,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 0.835,
                                            "geometry_index": 526,
                                            "location": [9.226515, 45.481219]
                                          },
                                          {
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "location": [9.226526, 45.481223],
                                            "geometry_index": 527,
                                            "admin_index": 0,
                                            "weight": 5.93,
                                            "is_urban": true,
                                            "traffic_signal": true,
                                            "turn_duration": 2.019,
                                            "turn_weight": 4.2,
                                            "duration": 3.492,
                                            "bearings": [64, 179, 243, 358],
                                            "out": 0,
                                            "in": 2,
                                            "entry": [true, true, false, true]
                                          },
                                          {
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "in": 2,
                                            "bearings": [64, 179, 244, 359],
                                            "duration": 1.165,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.846,
                                            "geometry_index": 528,
                                            "location": [9.226629, 45.481259]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [64, 179, 244],
                                            "duration": 12.019,
                                            "turn_weight": 0.75,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 14.85,
                                            "geometry_index": 529,
                                            "location": [9.226713, 45.481288]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [64, 121, 244],
                                            "duration": 1.486,
                                            "turn_weight": 0.75,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.473,
                                            "geometry_index": 530,
                                            "location": [9.227751, 45.48165]
                                          },
                                          {
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "in": 2,
                                            "bearings": [64, 153, 244, 334],
                                            "duration": 0.819,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.44,
                                            "geometry_index": 531,
                                            "location": [9.227881, 45.481695]
                                          },
                                          {
                                            "entry": [true, true, false],
                                            "in": 2,
                                            "bearings": [64, 153, 244],
                                            "duration": 1.165,
                                            "turn_weight": 0.75,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.096,
                                            "geometry_index": 532,
                                            "location": [9.227953, 45.48172]
                                          },
                                          {
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "in": 2,
                                            "bearings": [62, 153, 244, 334],
                                            "duration": 1.002,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.021,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 2.654,
                                            "geometry_index": 534,
                                            "location": [9.228039, 45.48175]
                                          },
                                          {
                                            "entry": [true, false, true],
                                            "in": 1,
                                            "bearings": [64, 242, 334],
                                            "duration": 7.207,
                                            "turn_weight": 0.75,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 9.21,
                                            "geometry_index": 535,
                                            "location": [9.228102, 45.481773]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [64, 122, 244],
                                            "duration": 3.187,
                                            "turn_weight": 0.75,
                                            "turn_duration": 0.019,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 4.472,
                                            "geometry_index": 536,
                                            "location": [9.228679, 45.481974]
                                          },
                                          {
                                            "entry": [true, false, false],
                                            "in": 2,
                                            "bearings": [62, 180, 244],
                                            "duration": 1.021,
                                            "turn_weight": 0.75,
                                            "turn_duration": 0.021,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "weight": 1.925,
                                            "geometry_index": 537,
                                            "location": [9.228936, 45.482061]
                                          },
                                          {
                                            "bearings": [64, 153, 242, 335],
                                            "entry": [
                                              true,
                                              false,
                                              false,
                                              false
                                            ],
                                            "in": 2,
                                            "turn_weight": 1.5,
                                            "turn_duration": 0.007,
                                            "mapbox_streets_v8": {
                                              "class": "tertiary"
                                            },
                                            "is_urban": true,
                                            "admin_index": 0,
                                            "out": 0,
                                            "geometry_index": 538,
                                            "location": [9.228994, 45.482083]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "exit rotary",
                                          "instruction":
                                              "Esci dalla rotonda verso Via Giovanni Pacini.",
                                          "modifier": "right",
                                          "bearing_after": 66,
                                          "bearing_before": 352,
                                          "location": [9.224344, 45.480481]
                                        },
                                        "name": "Via Giovanni Pacini",
                                        "duration": 81.608,
                                        "distance": 438.469,
                                        "driving_side": "right",
                                        "weight": 118.983,
                                        "mode": "driving",
                                        "geometry":
                                            "aa|vuAoh_rP{A_H{AyGsGqXs@aDcDiNqKgc@mFkTeBaHy@gDGUgAmEy@gDsU{_AyAcGq@oCg@mBS}@m@}BqKac@mDaOk@sBoGmW"
                                      },
                                      {
                                        "bannerInstructions": [],
                                        "voiceInstructions": [],
                                        "intersections": [
                                          {
                                            "bearings": [244],
                                            "entry": [true],
                                            "in": 0,
                                            "admin_index": 0,
                                            "geometry_index": 539,
                                            "location": [9.229385, 45.482219]
                                          }
                                        ],
                                        "maneuver": {
                                          "type": "arrive",
                                          "instruction":
                                              "La tua destinazione è sulla sinistra.",
                                          "modifier": "left",
                                          "bearing_after": 0,
                                          "bearing_before": 64,
                                          "location": [9.229385, 45.482219]
                                        },
                                        "name": "Via Giovanni Pacini",
                                        "duration": 0,
                                        "distance": 0,
                                        "driving_side": "right",
                                        "weight": 0,
                                        "mode": "driving",
                                        "geometry": "um_wuAqcirP??"
                                      }
                                    ],
                                    "distance": 15745.124,
                                    "summary":
                                        "Via Sempione, Via Magenta, Via Reali, Via Strada Statale 35 dei Giovi, A52, SPexSS35, Via Gioacchino Murat, Viale Marche, Viale Abruzzi, Viale Gran Sasso, Piazzale Gabrio Piola, Via Giovanni Pacini"
                                  }
                                ],
                                "geometry":
                                    "um_wuAqcirPyoAsfF_qBtl@}JyeCeGcNuS@qGmIjGcpDwm@cmR}WctDktAwu@|p@miB{uCzhA{aTu|Fe_N}cJamUhXudOjoCqkHw_G}hThoG{{Jw`E{oDmnHetErsAu~FhvV{PdmXm~KzvTikMznK{rBrpItc@p}XpxNpgM|uFlrUh_@~xLok]bxC{i@ogB|Bm@vKlH|d@hoFdAlVlcApgHYfAezB~d@uF`S~aArxJLlNa[~uEwjAxJWiH~ByIlaAjWdf@rjGgCpOoqCvcApA`yAzn@uQdeAmXxk@~cHzMfI|ld@anKbb@dBrq@z}C_y@{_M`m@iiKlvBspB~wXl|EvjXofCd{Re}XbsU}dGdrKidLpi@slC~wF{fBth@nS~qC}}Of}Nod_@z{BkHtbEs_KrFgrAskBazH",
                                "voiceLocale": "it-IT"
                              },
                            );
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          child: const Text("Start Multi Stop"),
                          onPressed: () async {
                            _isMultipleStop = true;
                            var wayPoints = <WayPoint>[];
                            wayPoints.add(_origin);
                            wayPoints.add(_stop1);
                            wayPoints.add(_stop2);
                            wayPoints.add(_stop3);
                            wayPoints.add(_destination);

                            MapBoxNavigation.instance.startNavigation(
                                wayPoints: wayPoints,
                                options: MapBoxOptions(
                                    mode: MapBoxNavigationMode.driving,
                                    simulateRoute: true,
                                    language: "en",
                                    allowsUTurnAtWayPoints: true,
                                    units: VoiceUnits.metric));
                            //after 10 seconds add a new stop
                            await Future.delayed(const Duration(seconds: 10));
                            var stop = WayPoint(
                                name: "Gas Station",
                                latitude: 38.911176544398,
                                longitude: -77.04014366543564);
                            MapBoxNavigation.instance
                                .addWayPoints(wayPoints: [stop]);
                          },
                        )
                      ],
                    ),
                    Container(
                      color: Colors.grey,
                      width: double.infinity,
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: (Text(
                          "Embedded Navigation",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _isNavigating
                              ? null
                              : () {
                                  if (_routeBuilt) {
                                    _controller?.clearRoute();
                                  } else {
                                    var wayPoints = <WayPoint>[];
                                    wayPoints.add(_home);
                                    wayPoints.add(_store);
                                    _isMultipleStop = wayPoints.length > 2;
                                    _controller?.buildRoute(
                                        wayPoints: wayPoints,
                                        options: _navigationOption);
                                  }
                                },
                          child: Text(_routeBuilt && !_isNavigating
                              ? "Clear Route"
                              : "Build Route"),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          child: const Text("Start "),
                          onPressed: _routeBuilt && !_isNavigating
                              ? () {
                                  _controller?.startNavigation();
                                }
                              : null,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          child: const Text("Cancel "),
                          onPressed: _isNavigating
                              ? () {
                                  _controller?.finishNavigation();
                                }
                              : null,
                        )
                      ],
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Long-Press Embedded Map to Set Destination",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.grey,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: (Text(
                          _instruction == null
                              ? "Banner Instruction Here"
                              : _instruction!,
                          style: const TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, top: 20, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              const Text("Duration Remaining: "),
                              Text(_durationRemaining != null
                                  ? "${(_durationRemaining! / 60).toStringAsFixed(0)} minutes"
                                  : "---")
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              const Text("Distance Remaining: "),
                              Text(_distanceRemaining != null
                                  ? "${(_distanceRemaining! * 0.000621371).toStringAsFixed(1)} miles"
                                  : "---")
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider()
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.grey,
                child: MapBoxNavigationView(
                    options: _navigationOption,
                    onRouteEvent: _onEmbeddedRouteEvent,
                    onCreated:
                        (MapBoxNavigationViewController controller) async {
                      _controller = controller;
                      controller.initialize();
                    }),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Future<void> _onEmbeddedRouteEvent(e) async {
    _distanceRemaining = await MapBoxNavigation.instance.getDistanceRemaining();
    _durationRemaining = await MapBoxNavigation.instance.getDurationRemaining();

    switch (e.eventType) {
      case MapBoxEvent.progress_change:
        var progressEvent = e.data as RouteProgressEvent;
        if (progressEvent.currentStepInstruction != null) {
          _instruction = progressEvent.currentStepInstruction;
        }
        break;
      case MapBoxEvent.route_building:
      case MapBoxEvent.route_built:
        setState(() {
          _routeBuilt = true;
        });
        break;
      case MapBoxEvent.route_build_failed:
        setState(() {
          _routeBuilt = false;
        });
        break;
      case MapBoxEvent.navigation_running:
        setState(() {
          _isNavigating = true;
        });
        break;
      case MapBoxEvent.on_arrival:
        if (!_isMultipleStop) {
          await Future.delayed(const Duration(seconds: 3));
          await _controller?.finishNavigation();
        } else {}
        break;
      case MapBoxEvent.navigation_finished:
      case MapBoxEvent.navigation_cancelled:
        setState(() {
          _routeBuilt = false;
          _isNavigating = false;
        });
        break;
      default:
        break;
    }
    setState(() {});
  }
}
