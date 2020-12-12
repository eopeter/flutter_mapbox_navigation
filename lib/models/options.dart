part of navigation;

/// Configuration options for the MapBoxNavigation.
///
/// When used to change configuration, null values will be interpreted as
/// "do not change this configuration option".
///
class MapBoxOptions {
  /// The initial Latitude of the Map View
  final double initialLatitude;

  /// The initial Longitude of the Map View
  final double initialLongitude;

  /// 2-letter ISO 639-1 code for language. This property affects the sentence contained within the RouteStep.instructions property, but it does not affect any road names contained in that property or other properties such as RouteStep.name. Defaults to "en" if an unsupported language is specified. The languages in this link are supported: https://docs.mapbox.com/android/navigation/overview/localization/ or https://docs.mapbox.com/ios/api/navigation/0.14.1/localization-and-internationalization.html
  final String language;

  /// Zoom controls the scale of the map and consumes any value between 0 and 22. At zoom level 0, the viewport shows continents and other world features. A middle value of 11 will show city level details, and at a higher zoom level, the map will begin to show buildings and points of interest.
  final double zoom;

  /// Bearing is the direction that the camera is pointing in and measured in degrees clockwise from north.
  ///
  /// The camera's default bearing is 0 degrees (i.e. "true north") causing the map compass to hide until the camera bearing becomes a non-zero value. The mapbox_uiCompass boolean XML attribute allows adjustment of the compass' visibility. Bearing levels use six decimal point precision, which enables you to restrict/set/lock a map's bearing with extreme precision. Besides programmatically adjusting the camera bearing, the user can place two fingertips on the map and rotate their fingers.
  final double bearing;

  /// Tilt is the camera's angle from the nadir (directly facing the Earth) and uses unit degrees. The camera's minimum (default) tilt is 0 degrees, and the maximum tilt is 60. Tilt levels use six decimal point of precision, which enables you to restrict/set/lock a map's bearing with extreme precision.
  ///
  /// The map camera tilt can also adjust by placing two fingertips on the map and moving both fingers up and down in parallel at the same time or
  final double tilt;
  ///
  /// When true, alternate routes will be presented
  final bool alternatives;
  ///
  /// The navigation mode desired. Defaults to drivingWithTraffic
  final MapBoxNavigationMode mode;
  /// The unit of measure said in voice instructions
  final VoiceUnits units;

  /// If the value of this property is true, a returned route may require an immediate U-turn at an intermediate waypoint. At an intermediate waypoint, if the value of this property is false, each returned route may continue straight ahead or turn to either side but may not U-turn. This property has no effect if only two waypoints are specified.
  /// same as 'not continueStraight' on Android
  final bool allowsUTurnAtWayPoints;

  final bool enableRefresh;
  // if true voice instruction is enabled
  final bool voiceInstructionsEnabled;
  //if true, banner instruction is shown and returned
  final bool bannerInstructionsEnabled;

  /// if true will simulate the route as if you were driving. Always true on iOS Simulator
  final bool simulateRoute;

  /// The Url of the style the Navigation MapView should use during the day
  final String mapStyleUrlDay;

  /// The Url of the style the Navigation MapView should use at night
  final String mapStyleUrlNight;

  /// if true, will reorder the routes to optimize navigation for time and shortest distance using the Travelling Salesman Algorithm. Always false for now
  final bool isOptimized;

  /// Padding applied to the MapView when embedded
  final EdgeInsets padding;

  /// Should animate the building of the Route. Default is True
  final bool animateBuildRoute;

  /// When the user long presses on a point on the map, set that as the destination
  final bool longPressDestinationEnabled;

  /// Free-drive mode is a unique Mapbox Navigation SDK feature that allows drivers to navigate without a set destination. This mode is sometimes referred to as passive navigation.
  /// No destination is required when set to true.
  final bool enableFreeDriveMode;

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
      this.longPressDestinationEnabled,
      this.simulateRoute,
      this.isOptimized,
      this.mapStyleUrlDay,
      this.mapStyleUrlNight,
      this.enableFreeDriveMode,
      this.padding,
      this.animateBuildRoute});

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> optionsMap = new Map<String, dynamic>();
    void addIfNonNull(String fieldName, dynamic value) {
      if (value != null) {
        optionsMap[fieldName] = value;
      }
    }

    addIfNonNull("initialLatitude", initialLatitude);
    addIfNonNull("initialLongitude", initialLongitude);
    addIfNonNull("language", language);
    addIfNonNull("animateBuildRoute", animateBuildRoute);
    addIfNonNull("longPressDestinationEnabled", longPressDestinationEnabled);

    if (this.zoom != null) optionsMap['zoom'] = this.zoom;
    if (this.bearing != null) optionsMap['bearing'] = this.bearing;
    if (this.tilt != null) optionsMap['tilt'] = this.tilt;
    if (this.alternatives != null)
      optionsMap['alternatives'] = this.alternatives;
    if (this.mode != null)
      optionsMap['mode'] = this.mode?.toString()?.split('.')?.last;
    if (this.units != null)
      optionsMap['units'] = this.units?.toString()?.split('.')?.last;
    if (this.allowsUTurnAtWayPoints != null)
      optionsMap['allowsUTurnAtWayPoints'] = this.allowsUTurnAtWayPoints;
    if (this.enableRefresh != null)
      optionsMap['enableRefresh'] = this.enableRefresh;

    addIfNonNull("voiceInstructionsEnabled", voiceInstructionsEnabled);
    addIfNonNull("bannerInstructionsEnabled", bannerInstructionsEnabled);

    if (this.mapStyleUrlDay != null)
      optionsMap['mapStyleUrlDay'] = this.mapStyleUrlDay;
    if (this.mapStyleUrlNight != null)
      optionsMap['mapStyleUrlNight'] = this.mapStyleUrlNight;
    if (this.simulateRoute != null)
      optionsMap['simulateRoute'] = this.simulateRoute;
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
