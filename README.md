# flutter_mapbox_navigation

Add Turn By Turn Navigation to Your Flutter Application Using MapBox. Never leave your app when you need to navigate your users to a location.

## Features

* A full-fledged turn-by-turn navigation UI for Flutter that’s ready to drop into your application
* [Professionally designed map styles](https://www.mapbox.com/maps/) for daytime and nighttime driving
* Worldwide driving, cycling, and walking directions powered by [open data](https://www.mapbox.com/about/open/) and user feedback
* Traffic avoidance and proactive rerouting based on current conditions in [over 55 countries](https://docs.mapbox.com/help/how-mapbox-works/directions/#traffic-data)
* Natural-sounding turn instructions powered by [Amazon Polly](https://aws.amazon.com/polly/) (no configuration needed)
* [Support for over two dozen languages](https://docs.mapbox.com/ios/navigation/overview/localization-and-internationalization/)

## IOS Configuration

1. Mapbox APIs and vector tiles require a Mapbox account and API access token. In the project editor, select the application target, then go to the Info tab. Under the “Custom iOS Target Properties” section, set `MGLMapboxAccessToken` to your access token. You can obtain an access token from the [Mapbox account page](https://account.mapbox.com/access-tokens/).

1. In order for the SDK to track the user’s location as they move along the route, set `NSLocationWhenInUseUsageDescription` to:
   > Shows your location on the map and helps improve OpenStreetMap.

1. Users expect the SDK to continue to track the user’s location and deliver audible instructions even while a different application is visible or the device is locked. Go to the Capabilities tab. Under the Background Modes section, enable “Audio, AirPlay, and Picture in Picture” and “Location updates”. (Alternatively, add the `audio` and `location` values to the `UIBackgroundModes` array in the Info tab.)


## Android Configuration

1. Mapbox APIs and vector tiles require a Mapbox account and API access token. Add your token in strings.xml file of your android apps res/values/ path. The string key should be "mapbox_access_token". You can obtain an access token from the [Mapbox account page](https://account.mapbox.com/access-tokens/).
```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="app_name">Navigation map</string>
    <string name="mapbox_access_token" translatable="false">ADD_MAPBOX_ACCESS_TOKEN_HERE</string>
    <string name="user_location_permission_explanation">This app needs location permissions to show its functionality.</string>
    <string name="user_location_permission_not_granted">You didn\'t grant location permissions.</string>
</resources>
```

1. Add the following permission to the app level Android Manifest
```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
```

## Usage

```dart

  MapboxNavigation _directions;

```

```dart

    initState()
    {
      _directions = MapboxNavigation(onRouteEvent: (e) async{
      
            _distanceRemaining = await _directions.distanceRemaining;
            _durationRemaining = await _directions.durationRemaining;
      
            switch (e.eventType) {
                case MapBoxEvent.progress_change:
                  var progressEvent = e.data as RouteProgressEvent;
                  _arrived = progressEvent.arrived;
                  _distanceRemaining = progressEvent.distance;
                  _durationRemaining = progressEvent.duration;
                  _instruction = progressEvent.currentStepInstruction;
                  break;
                case MapBoxEvent.route_build_failed:
                  print(e.data);
                  break;
                case MapBoxEvent.on_arrival:
                  _arrived = true;
                  //await Future.delayed(Duration(seconds: 3));
                  //await _directions.finishNavigation();
                  break;
                default:
                  break;
            }
            setState(() {});
      });
    }

    final cityhall = WayPoint(name: "City Hall", latitude: 42.886448, longitude: -78.878372);
    final downtown = WayPoint(name: "Downtown Buffalo", latitude: 42.8866177, longitude: -78.8814924);
            
    await _directions.startNavigation(
                                origin: cityhall, 
                                destination: downtown, 
                                mode: MapBoxNavigationMode.drivingWithTraffic, 
                                simulateRoute: false,
                                mapStyleURL: "mapbox://styles/eopeter/ckffcmgtl0car1ap80jhp4hsr",
                                language: "en");
  
```

## Multiple Stops / WayPoints

```dart

    final _origin = WayPoint(name: "A", latitude: 38.8842107, longitude: -77.000346);
    final _stop1 = WayPoint(name: "B", latitude: 38.883281, longitude: -77.0037567);
    final _stop2 = WayPoint(name: "C", latitude: 38.91040213277608, longitude: -77.03848242759705);
    final _stop3 = WayPoint(name: "D", latitude: 38.909650771013034, longitude: -77.03850388526917);

    var wayPoints = List<WayPoint>();
                wayPoints.add(_origin);
                wayPoints.add(_stop1);
                wayPoints.add(_stop2);
                wayPoints.add(_stop3);
                wayPoints.add(_origin);

                await _directions.startNavigationWithWayPoints(
                    wayPoints: wayPoints,
                    mode: MapBoxNavigationMode.driving,
                    simulateRoute: true,
                    language: "en", 
                    allowsUTurnAtWayPoints: true, 
                    isOptimized: false,
                    mapStyleURL: "mapbox://styles/eopeter/ckffcmgtl0car1ap80jhp4hsr",
                    units: VoiceUnits.metric);

```



## Embedding Navigation View
![Navigation View](screenshots/screenshot3.png?raw=true "Embedded iOS View") | ![Navigation View](screenshots/screenshot4.png?raw=true "Embedded Android View")
|:---:|:---:|
| Embedded iOS View | Embedded Android View |


## Embedded Sample Code


#### Declare Controller
```dart
      MapBoxNavigationViewController _controller;
```

#### Navigation View As Widget
```dart
            Container(
                color: Colors.grey,
                child: MapBoxNavigationView(
                    options: MapBoxOptions(
                        initialLatitude: 36.1175275,
                        initialLongitude: -115.1839524,
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
                        simulateRoute: false,
                        language: "en"),
                    onRouteEvent: _onEmbeddedRouteEvent,
                    onCreated:
                        (MapBoxNavigationViewController controller) async {
                      _controller = controller;
                    }),
              ),
```
#### Build Route

```dart
        var wayPoints = List<WayPoint>();
                            wayPoints.add(_origin);
                            wayPoints.add(_stop1);
                            wayPoints.add(_stop2);
                            wayPoints.add(_stop3);
                            wayPoints.add(_stop4);
                            wayPoints.add(_origin);
                            _controller.buildRoute(wayPoints: wayPoints);
```

#### Start Navigation

```dart
    _controller.startNavigation();
```

### Additional IOS Configuration
Add the following to your `info.plist` file

```xml
    <key>io.flutter.embedded_views_preview</key>
	<true/>
```

### Additional Android Configuration
Modify your `MainActivity` to instantiate the plugin for native embedding

```kotlin
class MainActivity: FlutterActivity() {
    companion object {

        @JvmStatic
        var flutterEngineInstance: FlutterEngine? = null
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        flutterEngineInstance = flutterEngine
    }

    override fun onResume() {
        super.onResume()

        flutterEngineInstance?.let {
            FlutterMapboxNavigationPlugin.registerWith(it)
        }
    }

 
}

```
## Screenshots
![Navigation View](screenshots/screenshot1.png?raw=true "iOS View") | ![Android View](screenshots/screenshot2.png?raw=true "Android View")
|:---:|:---:|
| iOS View | Android View |

## To Do
* [DONE] Android Implementation
* [DONE] Add more settings like Navigation Mode (driving, walking, etc)
* [DONE] Stream Events like relevant navigation notifications, metrics, current location, etc. 
* [DONE] Embeddable Navigation View 