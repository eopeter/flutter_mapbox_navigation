import 'dart:convert';
import 'events.dart';
import 'routeProgressEvent.dart';

/// Represents an event sent by the navigation service
class RouteEvent {
  MapBoxEvent? eventType;
  dynamic data;

  RouteEvent({this.eventType, this.data});

  RouteEvent.fromJson(Map<String, dynamic> json) {
    if (json['eventType'] is int)
      eventType = MapBoxEvent.values[json['eventType']];
    else {
      try {
        eventType = MapBoxEvent.values.firstWhere(
            (e) => e.toString().split(".").last == json['eventType']);
      } on StateError {
        //When the list is empty or eventType not found (Bad State: No Element)
      } catch (e) {}
    }
    var dataJson = json['data'];
    if (eventType == MapBoxEvent.progress_change) {
      data = RouteProgressEvent.fromJson(dataJson);
    } else {
      data = jsonEncode(json['data']);
    }
  }
}
