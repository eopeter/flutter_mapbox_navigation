part of navigation;

/// Represents an event sent by the navigation service
class RouteEvent {
  MapBoxEvent eventType;
  dynamic data;

  RouteEvent({this.eventType, this.data});

  RouteEvent.fromJson(Map<String, dynamic> json) {
    if (json['eventType'] is int)
      eventType = MapBoxEvent.values[json['eventType']];
    else
      eventType = MapBoxEvent.values
          .firstWhere((e) => e.toString().split(".").last == json['eventType']);
    var dataJson = json['data'];
    if (eventType == MapBoxEvent.progress_change) {
      data = RouteProgressEvent.fromJson(dataJson);
    } else {
      data = jsonEncode(json['data']);
    }
  }
}
