part of navigation;

/// Controller for a single MapBox Navigation instance running on the host platform.
class MapBoxNavigationViewController implements IMapBoxNavigation {
  MethodChannel _methodChannel;
  EventChannel _eventChannel;

  ValueSetter<RouteEvent> _routeEventNotifier;

  MapBoxNavigationViewController(
      int id, ValueSetter<RouteEvent> eventNotifier) {
    _methodChannel = new MethodChannel('flutter_mapbox_navigation/$id');
    _methodChannel.setMethodCallHandler(_handleMethod);

    _eventChannel = EventChannel('flutter_mapbox_navigation/events');
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

  ///Show the Navigation View and Begins Direction Routing
  ///
  /// [origin] must not be null. It must have a longitude, latitude and name.
  /// [destination] must not be null. It must have a longitude, latitude and name.
  /// [options] options used to generate the route and used while navigating
  ///
  /// Begins to generate Route Progress
  ///
  Future startNavigation(
      {WayPoint origin,
      WayPoint destination,
      MapBoxOptions options}) async {
    assert(origin != null);
    assert(origin.name != null);
    assert(origin.latitude != null);
    assert(origin.longitude != null);
    assert(destination != null);
    assert(destination.name != null);
    assert(destination.latitude != null);
    assert(destination.longitude != null);
    final Map<String, Object> wayPointMap = <String, dynamic>{
      "originName": origin.name,
      "originLatitude": origin.latitude,
      "originLongitude": origin.longitude,
      "destinationName": destination.name,
      "destinationLatitude": destination.latitude,
      "destinationLongitude": destination.longitude
    };

    var args = {};
    args.addAll(wayPointMap);
    args.addAll(options.toMap());

    _routeEventSubscription = _streamRouteEvent.listen(_onProgressData);
    await _methodChannel
        .invokeMethod('startNavigation', args)
        .then<String>((dynamic result) => result);
  }

  ///Show the Navigation View and Begins Direction Routing
  ///
  /// [wayPoints] must not be null. A collection of [WayPoint](longitude, latitude and name). Must be at least 2 or at most 25. Cannot use drivingWithTraffic mode if more than 3-waypoints.
  /// [options] options used to generate the route and used while navigating
  /// Begins to generate Route Progress
  ///
  Future startNavigationWithWayPoints(
      {List<WayPoint> wayPoints, MapBoxOptions options}) async {
    assert(wayPoints != null);
    assert(wayPoints.length > 1);
    if (Platform.isIOS && wayPoints.length > 3) {
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

    var  args = options.toMap();
    args["wayPoints"] = wayPointMap;

    _routeEventSubscription = _streamRouteEvent.listen(_onProgressData);
    await _methodChannel
        .invokeMethod('startNavigationWithWayPoints', args)
        .then<String>((dynamic result) => result);
  }

  Future buildRoute(
      {WayPoint origin,
        WayPoint destination,
        MapBoxOptions options}) async {
    assert(origin != null);
    assert(origin.name != null);
    assert(origin.latitude != null);
    assert(origin.longitude != null);
    assert(destination != null);
    assert(destination.name != null);
    assert(destination.latitude != null);
    assert(destination.longitude != null);
    final Map<String, Object> wayPointMap = <String, dynamic>{
      "originName": origin.name,
      "originLatitude": origin.latitude,
      "originLongitude": origin.longitude,
      "destinationName": destination.name,
      "destinationLatitude": destination.latitude,
      "destinationLongitude": destination.longitude
    };

    var args = {};
    args.addAll(wayPointMap);
    if(options != null)
      args.addAll(options.toMap());

    _routeEventSubscription = _streamRouteEvent.listen(_onProgressData);
    await _methodChannel
        .invokeMethod('buildRoute', args)
        .then<String>((dynamic result) => result);
  }

  ///Ends Navigation and Closes the Navigation View
  Future<bool> finishNavigation() async {
    var success = await _methodChannel.invokeMethod('finishNavigation', null);
    return success;
  }

  Future<String> startEmbeddedNavigation(MapBoxOptions options) async {
    return _methodChannel.invokeMethod(
        'startEmbeddedNavigation', options.toMap());
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case 'sendFromNative':
        String text = call.arguments as String;
        return new Future.value("Text from native: $text");
    }
  }

  Future<void> _receiveFromFlutter(String text) async {
    try {
      final String result = await _methodChannel
          .invokeMethod('receiveFromFlutter', {"text": text});
      print("Result from native: $result");
    } on PlatformException catch (e) {
      print("Error from native: $e.message");
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
