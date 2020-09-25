part of navigation;

///A Geo-coordinate Point used for navigation.
class WayPoint {
  String name;
  double latitude;
  double longitude;
  WayPoint(
      {@required this.name, @required this.latitude, @required this.longitude});

  @override
  String toString() {
    return 'WayPoint{latitude: $latitude, longitude: $longitude}';
  }

  WayPoint.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    latitude = json["latitude"] as double;
    longitude = json["longitude"] as double;
  }
}
