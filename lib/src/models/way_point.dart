///A `WayPoint` object indicates a location along a route.
///It may be the route’s origin or destination, or it may be another location
///that the route visits. A waypoint object indicates the location’s geographic
///location along with other optional information, such as a name or
///the user’s direction approaching the waypoint.
class WayPoint {
  ///Constructor
  WayPoint({
    required this.name,
    required this.latitude,
    required this.longitude,
    this.isSilent = false,
  });

  /// create [WayPoint] from a json
  WayPoint.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    latitude = json['latitude'] as double?;
    longitude = json['longitude'] as double?;

    if (json['isSilent'] == null) {
      isSilent = false;
    } else {
      isSilent = json['isSilent'] as bool;
    }
  }

  /// Waypoint [name]
  String? name;

  /// Waypoint latitude
  double? latitude;

  /// Waypoint longitude
  double? longitude;

  /// Waypoint property isSilent
  bool? isSilent;

  @override
  String toString() {
    return 'WayPoint{latitude: $latitude, longitude: $longitude}';
  }
}
