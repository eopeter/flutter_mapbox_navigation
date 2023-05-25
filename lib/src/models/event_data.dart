///Data associated with a Route Event
class MapBoxEventData {
  /// Coonstructior
  MapBoxEventData({this.data});

  /// Create [MapBoxEventData] object from a json
  MapBoxEventData.fromJson(Map<String, dynamic> json) {
    data = json['data'] as String;
  }

  /// Create json from [MapBoxEventData]
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['data'] = this.data;
    return data;
  }

  /// Field containing data about associated RouteEvent
  String? data;
}
