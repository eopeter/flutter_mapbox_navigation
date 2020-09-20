part of navigation;

///Data associated with a Route Event
class MapBoxEventData {
  String data;

  MapBoxEventData({this.data});

  MapBoxEventData.fromJson(Map<String, dynamic> json) {
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    return data;
  }
}
