///A `WayPoint` object indicates a location along a route.
///It may be the route’s origin or destination, or it may be another location
///that the route visits. A waypoint object indicates the location’s geographic
///location along with other optional information, such as a name or
///the user’s direction approaching the waypoint.
class WayPoint {
  String? name;
  double? latitude;
  double? longitude;
  bool isSilent = false;

  WayPoint(
      {required this.name, required this.latitude, required this.longitude});

  @override
  String toString() {
    return 'WayPoint{latitude: $latitude, longitude: $longitude}';
  }

  WayPoint.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    latitude = json["latitude"] as double?;
    longitude = json["longitude"] as double?;
    isSilent = json["isSilent"] as bool;
  }
}
