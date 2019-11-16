# flutter_mapbox_navigation_example

Demonstrates how to use the flutter_mapbox_navigation plugin.

## Usage

```dart

  MapboxNavigation _directions;

```

```dart

    initState()
    {
      _directions = MapboxNavigation(onRouteProgress: (arrived) async{
      
            _distanceRemaining = await _directions.distanceRemaining;
            _durationRemaining = await _directions.durationRemaining;
      
            setState(() {
              _arrived = arrived;
            });
            if(arrived)
              await _directions.finishNavigation();
      
          });
    }

      final cityhall = Location(name: "City Hall", latitude: 42.886448, longitude: -78.878372);
      final downtown = Location(name: "Downtown Buffalo", latitude: 42.8866177, longitude: -78.8814924);
      
      await _directions.startNavigation(
                          origin: cityhall, 
                          destination: downtown, 
                          mode: NavigationMode.drivingWithTraffic, 
                          simulateRoute: false);
  
```
