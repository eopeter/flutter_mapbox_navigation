// ignore_for_file: public_member_api_docs

import 'package:flutter/widgets.dart';
import 'package:flutter_mapbox_navigation/src/models/navmode.dart';
import 'package:flutter_mapbox_navigation/src/models/voice_units.dart';

/// Configuration options for the MapBoxNavigation.
///
/// When used to change configuration, null values will be interpreted as
/// 'do not change this configuration option'.
///
class MapBoxOptions {

  MapBoxOptions({
    this.initialLatitude,
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
    this.padding,
    this.animateBuildRoute,
    this.showReportFeedbackButton = true,
    this.showEndOfRouteFeedback = true,
    this.enableOnMapTapCallback = false,
  });

  MapBoxOptions.from(MapBoxOptions option) {
    initialLatitude = option.initialLatitude;
    initialLongitude = option.initialLongitude;
    language = option.language;
    zoom = option.zoom;
    bearing = option.bearing;
    tilt = option.tilt;
    alternatives = option.alternatives;
    mode = option.mode;
    units = option.units;
    allowsUTurnAtWayPoints = option.allowsUTurnAtWayPoints;
    enableRefresh = option.enableRefresh;
    voiceInstructionsEnabled = option.voiceInstructionsEnabled;
    bannerInstructionsEnabled = option.bannerInstructionsEnabled;
    longPressDestinationEnabled = option.longPressDestinationEnabled;
    simulateRoute = option.simulateRoute;
    isOptimized = option.isOptimized;
    mapStyleUrlDay = option.mapStyleUrlDay;
    mapStyleUrlNight = option.mapStyleUrlNight;
    padding = option.padding;
    animateBuildRoute = option.animateBuildRoute;
    showReportFeedbackButton = option.showReportFeedbackButton;
    showEndOfRouteFeedback = option.showEndOfRouteFeedback;
  }

  /// The initial Latitude of the Map View
  double? initialLatitude;

  /// The initial Longitude of the Map View
  double? initialLongitude;

  /// 2-letter ISO 639-1 code for language and optionally append the ISO-3166
  /// country code for specific dialect like pt-BR for Brazilian Portuguese
  /// This property affects the sentence
  /// contained within the RouteStep.instructions property, but it does not
  /// affect any road names contained in that property or other properties
  /// such as RouteStep.name. Defaults to 'en' if an unsupported language
  /// is specified. The languages in this link are supported:
  ///  https://docs.mapbox.com/android/navigation/overview/localization/ or
  /// https://docs.mapbox.com/ios/api/navigation/0.14.1/localization-and-internationalization.html
  String? language;

  /// Zoom controls the scale of the map and consumes any value between 0
  /// and 22. At zoom level 0, the viewport shows continents and other world
  /// features. A middle value of 11 will show city level details, and at a
  ///  higher zoom level, the map will begin to show buildings and
  /// points of interest.
  double? zoom;

  /// Bearing is the direction that the camera is pointing in and
  /// measured in degrees clockwise from north.
  ///
  /// The camera's default bearing is 0 degrees (i.e. 'true north') causing the
  /// map compass to hide until the camera bearing becomes a non-zero value.
  /// The mapbox_uiCompass boolean XML attribute allows adjustment of
  /// the compass' visibility. Bearing levels use six decimal point precision,
  /// which enables you to restrict/set/lock a map's bearing with
  /// extreme precision. Besides programmatically adjusting the camera bearing,
  ///  the user can place two fingertips on the map and rotate their fingers.
  double? bearing;

  /// Tilt is the camera's angle from the nadir (directly facing the Earth)
  /// and uses unit degrees. The camera's minimum (default) tilt is 0 degrees,
  /// and the maximum tilt is 60. Tilt levels use six decimal point of
  /// precision, which enables you to restrict/set/lock a map's bearing
  /// with extreme precision.
  ///
  /// The map camera tilt can also adjust by placing two fingertips on the map
  /// and moving both fingers up and down in parallel at the same time or
  double? tilt;

  ///
  /// When true, alternate routes will be presented
  bool? alternatives;

  ///
  /// The navigation mode desired. Defaults to drivingWithTraffic
  MapBoxNavigationMode? mode;

  /// The unit of measure said in voice instructions
  VoiceUnits? units;

  /// If the value of this property is true, a returned route may require an
  /// immediate U-turn at an intermediate waypoint. At an intermediate waypoint,
  ///  if the value of this property is false, each returned route may continue
  /// straight ahead or turn to either side but may not U-turn. This property
  /// has no effect if only two waypoints are specified.
  /// same as 'not continueStraight' on Android
  bool? allowsUTurnAtWayPoints;

  bool? enableRefresh;
  // if true voice instruction is enabled
  bool? voiceInstructionsEnabled;
  //if true, banner instruction is shown and returned
  bool? bannerInstructionsEnabled;

  /// if true will simulate the route as if you were driving.
  /// Always true on iOS Simulator
  bool? simulateRoute;

  /// The Url of the style the Navigation MapView should use during the day
  String? mapStyleUrlDay;

  /// The Url of the style the Navigation MapView should use at night
  String? mapStyleUrlNight;

  /// if true, will reorder the routes to optimize navigation for time and
  /// shortest distance using the Travelling Salesman Algorithm.
  /// Always false for now
  bool? isOptimized;

  /// Padding applied to the MapView when embedded
  EdgeInsets? padding;

  /// Should animate the building of the Route. Default is True
  bool? animateBuildRoute;

  /// When the user long presses on a point on the map, set that
  ///  as the destination
  bool? longPressDestinationEnabled;

  /// In iOS this will show/hide the feedback button. Default to True.
  bool? showReportFeedbackButton;

  /// In iOS this will show/hide the end of route page when navigation is done. Default to True.
  bool? showEndOfRouteFeedback;

  /// Gives you the ability to receive back a waypoint corresponding
  /// to where you tap on the map.
  bool? enableOnMapTapCallback;

  Map<String, dynamic> toMap() {
    final optionsMap = <String, dynamic>{};
    void addIfNonNull(String fieldName, dynamic value) {
      if (value != null) {
        optionsMap[fieldName] = value;
      }
    }

    addIfNonNull('initialLatitude', initialLatitude);
    addIfNonNull('initialLongitude', initialLongitude);
    addIfNonNull('language', language);
    addIfNonNull('animateBuildRoute', animateBuildRoute);
    addIfNonNull('longPressDestinationEnabled', longPressDestinationEnabled);

    if (zoom != null) optionsMap['zoom'] = zoom;
    if (bearing != null) optionsMap['bearing'] = bearing;
    if (tilt != null) optionsMap['tilt'] = tilt;
    if (alternatives != null) {
      optionsMap['alternatives'] = alternatives;
    }
    if (mode != null) {
      optionsMap['mode'] = mode?.toString().split('.').last;
    }
    if (units != null) {
      optionsMap['units'] = units?.toString().split('.').last;
    }
    if (allowsUTurnAtWayPoints != null) {
      optionsMap['allowsUTurnAtWayPoints'] = allowsUTurnAtWayPoints;
    }
    if (enableRefresh != null) {
      optionsMap['enableRefresh'] = enableRefresh;
    }

    addIfNonNull('voiceInstructionsEnabled', voiceInstructionsEnabled);
    addIfNonNull('bannerInstructionsEnabled', bannerInstructionsEnabled);

    if (mapStyleUrlDay != null) {
      optionsMap['mapStyleUrlDay'] = mapStyleUrlDay;
    }
    if (mapStyleUrlNight != null) {
      optionsMap['mapStyleUrlNight'] = mapStyleUrlNight;
    }
    if (simulateRoute != null) {
      optionsMap['simulateRoute'] = simulateRoute;
    }
    if (isOptimized != null) optionsMap['isOptimized'] = isOptimized;

    if (padding != null) {
  optionsMap['padding'] = [
    padding?.top ?? 10.0,    // Default top padding
    padding?.left ?? 20.0,   // Default left padding
    padding?.bottom ?? 10.0, // Default bottom padding
    padding?.right ?? 20.0,  // Default right padding
  ];
}


    addIfNonNull('showReportFeedbackButton', showReportFeedbackButton);
    addIfNonNull('showEndOfRouteFeedback', showEndOfRouteFeedback);
    addIfNonNull('enableOnMapTapCallback', enableOnMapTapCallback);

    return optionsMap;
  }

  Map<String, dynamic> updatesMap(MapBoxOptions newOptions) {
    final prevOptionsMap = toMap();

    return newOptions.toMap()
      ..removeWhere(
        (String key, dynamic value) => prevOptionsMap[key] == value,
      );
  }
}
