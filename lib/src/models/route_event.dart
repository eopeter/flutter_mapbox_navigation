import 'dart:convert';

import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';

/// Represents an event sent by the navigation service
class RouteEvent {
  MapBoxEvent? eventType;
  dynamic data;

  RouteEvent({this.eventType, this.data});

  RouteEvent.fromJson(Map<String, dynamic> json) {
    try {
      eventType = MapBoxEvent.values
          .firstWhere((e) => e.toString().split(".").last == json['eventType']);
    } on StateError {
      //When the list is empty or eventType not found (Bad State: No Element)
    } catch (e) {
      // TODO handle the error
    }

    final dataJson = json['data'];
    if (eventType == MapBoxEvent.progress_change) {
      data = RouteProgressEvent.fromJson(dataJson);
    } else if (eventType == MapBoxEvent.navigation_finished &&
        (dataJson as String).isNotEmpty) {
      data = MapBoxFeedback.fromJson(jsonDecode(dataJson));
    } else {
      data = jsonEncode(dataJson);
    }
  }
}
