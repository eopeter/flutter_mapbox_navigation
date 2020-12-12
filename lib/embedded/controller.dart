part of navigation;

/// Controller for a single MapBox Navigation instance running on the host platform.
class MapBoxNavigationViewController {
  MethodChannel _methodChannel;
  EventChannel _eventChannel;

  ValueSetter<RouteEvent> _routeEventNotifier;

  MapBoxNavigationViewController(
      int id, ValueSetter<RouteEvent> eventNotifier) {
    _methodChannel = new MethodChannel('flutter_mapbox_navigation/$id');
    _methodChannel.setMethodCallHandler(_handleMethod);

    _eventChannel = EventChannel('flutter_mapbox_navigation/$id/events');
    _routeEventNotifier = eventNotifier;
  }

  Stream<RouteEvent> _onRouteEvent;
  StreamSubscription<RouteEvent> _routeEventSubscription;

  ///Current Device OS Version
  Future<String> get platformVersion => _methodChannel
      .invokeMethod('getPlatformVersion')
      .then<String>((dynamic result) => result);

  ///Total distance remaining in meters along route.
  Future<double> get distanceRemaining => _methodChannel
      .invokeMethod<double>('getDistanceRemaining')
      .then<double>((dynamic result) => result);

  ///Total seconds remaining on all legs.
  Future<double> get durationRemaining => _methodChannel
      .invokeMethod<double>('getDurationRemaining')
      .then<double>((dynamic result) => result);

  ///Build the Route Used for the Navigation
  ///
  /// [wayPoints] must not be null. A collection of [WayPoint](longitude, latitude and name). Must be at least 2 or at most 25. Cannot use drivingWithTraffic mode if more than 3-waypoints.
  /// [options] options used to generate the route and used while navigating
  ///
  Future<bool> buildRoute(
      {List<WayPoint> wayPoints, MapBoxOptions options}) async {
    assert(wayPoints != null);
    assert(wayPoints.length > 1);
    if (Platform.isIOS && wayPoints.length > 3 && options?.mode != null) {
      assert(options.mode != MapBoxNavigationMode.drivingWithTraffic,
          "Error: Cannot use drivingWithTraffic Mode when you have more than 3 Stops");
    }
    var pointList = List<Map<String, Object>>();

    for (int i = 0; i < wayPoints.length; i++) {
      var wayPoint = wayPoints[i];
      assert(wayPoint != null);
      assert(wayPoint.name != null);
      assert(wayPoint.latitude != null);
      assert(wayPoint.longitude != null);

      final pointMap = <String, dynamic>{
        "Order": i,
        "Name": wayPoint.name,
        "Latitude": wayPoint.latitude,
        "Longitude": wayPoint.longitude,
      };
      pointList.add(pointMap);
    }
    var i = 0;
    var wayPointMap =
        Map.fromIterable(pointList, key: (e) => i++, value: (e) => e);

    Map<String, dynamic> args = Map<String, dynamic>();
    if (options != null) args = options.toMap();
    args["wayPoints"] = wayPointMap;

    _routeEventSubscription = _streamRouteEvent.listen(_onProgressData);
    return await _methodChannel
        .invokeMethod('buildRoute', args)
        .then<bool>((dynamic result) => result);
  }

  /// starts listening for events
  Future<void> initialize() async {
    _routeEventSubscription = _streamRouteEvent.listen(_onProgressData);
  }

  /// Clear the built route and resets the map
  Future<bool> clearRoute() async {
    return _methodChannel.invokeMethod('clearRoute', null);
  }

  /// Starts the Navigation
  Future<bool> startNavigation({MapBoxOptions options}) async {
    Map<String, dynamic> args;
    if (options != null) args = options.toMap();
    //_routeEventSubscription = _streamRouteEvent.listen(_onProgressData);
    return _methodChannel.invokeMethod('startNavigation', args);
  }

  ///Ends Navigation and Closes the Navigation View
  Future<bool> finishNavigation() async {
    var success = await _methodChannel.invokeMethod('finishNavigation', null);
    return success;
  }

  /// Generic Handler for Messages sent from the Platform
  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case 'sendFromNative':
        String text = call.arguments as String;
        return new Future.value("Text from native: $text");
    }
  }

  void _onProgressData(RouteEvent event) {
    if (_routeEventNotifier != null) _routeEventNotifier(event);

    if (event.eventType == MapBoxEvent.on_arrival)
      _routeEventSubscription.cancel();
  }

  Stream<RouteEvent> get _streamRouteEvent {
    if (_onRouteEvent == null) {
      _onRouteEvent = _eventChannel
          .receiveBroadcastStream()
          .map((dynamic event) => _parseRouteEvent(event));
    }
    return _onRouteEvent;
  }

  RouteEvent _parseRouteEvent(String jsonString) {
    RouteEvent event;
    var map = json.decode(jsonString);
    var progressEvent = RouteProgressEvent.fromJson(map);
    if (progressEvent != null && progressEvent.isProgressEvent) {
      event = RouteEvent(
          eventType: MapBoxEvent.progress_change, data: progressEvent);
    } else
      event = RouteEvent.fromJson(map);
    return event;
  }
}
