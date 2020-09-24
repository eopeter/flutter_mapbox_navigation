part of navigation;

/// Configuration options for the MapBoxNavigation.
///
/// When used to change configuration, null values will be interpreted as
/// "do not change this configuration option".
///
class MapBoxOptions {
  final double initialLatitude;
  final double initialLongitude;

  /// 2-letter ISO 639-1 code for language. This property affects the sentence contained within the RouteStep.instructions property, but it does not affect any road names contained in that property or other properties such as RouteStep.name. Defaults to "en" if an unsupported language is specified. The languages in this link are supported: https://docs.mapbox.com/android/navigation/overview/localization/ or https://docs.mapbox.com/ios/api/navigation/0.14.1/localization-and-internationalization.html
  final String language;
  final double zoom;
  final double bearing;
  final double tilt;
  final bool alternatives;

  /// The navigation mode desired. Defaults to drivingWithTraffic
  final MapBoxNavigationMode mode;

  final VoiceUnits units;

  /// If the value of this property is true, a returned route may require an immediate U-turn at an intermediate waypoint. At an intermediate waypoint, if the value of this property is false, each returned route may continue straight ahead or turn to either side but may not U-turn. This property has no effect if only two waypoints are specified.
  /// same as 'not continueStraight' on Android
  final bool allowsUTurnAtWayPoints;

  final bool enableRefresh;
  final bool voiceInstructionsEnabled;
  final bool bannerInstructionsEnabled;

  /// if true will simulate the route as if you were driving. Always true on iOS Simulator
  final bool simulateRoute;

  /// The Url of the style the Navigation MapView should use
  final String mapStyleURL;

  /// if true, will reorder the routes to optimize navigation for time and shortest distance using the Travelling Salesman Algorithm. Always false for now
  final bool isOptimized;
  final EdgeInsets padding;

  MapBoxOptions(
      {this.initialLatitude,
      this.initialLongitude,
      this.language,
      this.zoom,
      this.bearing,
      this.tilt,
      this.alternatives,
      this.mode,
      this.units,
      this.allowsUTurnAtWayPoints,
      this.enableRefresh,
      this.voiceInstructionsEnabled,
      this.bannerInstructionsEnabled,
      this.simulateRoute,
      this.isOptimized,
      this.mapStyleURL, this.padding});

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> optionsMap = new Map<String, dynamic>();
    void addIfNonNull(String fieldName, dynamic value) {
      if (value != null) {
        optionsMap[fieldName] = value;
      }
    }

    addIfNonNull("initialLatitude", initialLatitude);

    if (this.initialLongitude != null)
      optionsMap['initialLongitude'] = this.initialLongitude;
    if (this.language != null) optionsMap['language'] = this.language;
    if (this.zoom != null) optionsMap['zoom'] = this.zoom;
    if (this.bearing != null) optionsMap['bearing'] = this.bearing;
    if (this.tilt != null) optionsMap['tilt'] = this.tilt;
    if (this.alternatives != null) optionsMap['alternatives'] = this.alternatives;
    if (this.mode != null)
      optionsMap['mode'] = this.mode?.toString()?.split('.')?.last;
    if (this.units != null)
      optionsMap['units'] = this.units?.toString()?.split('.')?.last;
    if (this.allowsUTurnAtWayPoints != null)
      optionsMap['allowsUTurnAtWayPoints'] = this.allowsUTurnAtWayPoints;
    if (this.enableRefresh != null) optionsMap['enableRefresh'] = this.enableRefresh;

    addIfNonNull("voiceInstructionsEnabled", voiceInstructionsEnabled);
    addIfNonNull("bannerInstructionsEnabled", bannerInstructionsEnabled);

    if (this.mapStyleURL != null) optionsMap['mapStyleURL'] = this.mapStyleURL;
    if (this.simulateRoute != null) optionsMap['simulateRoute'] = this.simulateRoute;
    if (this.isOptimized != null) optionsMap['isOptimized'] = this.isOptimized;

    addIfNonNull('padding', <double>[
      padding?.top,
      padding?.left,
      padding?.bottom,
      padding?.right,
    ]);

    return optionsMap;
  }

  Map<String, dynamic> updatesMap(MapBoxOptions newOptions) {
    final Map<String, dynamic> prevOptionsMap = toMap();

    return newOptions.toMap()
      ..removeWhere(
              (String key, dynamic value) => prevOptionsMap[key] == value);
  }

}
