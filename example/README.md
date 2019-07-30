# flutter_mapbox_navigation_example

Demonstrates how to use the flutter_mapbox_navigation plugin.

## Usage

```dart

  final origin = Location(name: "Buffalo, NY", latitude: 42.886448, longitude: -78.878372);
  final destination = Location(name: "Boston, MA", latitude: 42.360081, longitude: -71.058884);
  
  await FlutterMapboxNavigation.startNavigation(origin, destination);
  
```
