// ignore_for_file: public_member_api_docs

class LocationModel {
  const LocationModel(
    this.lat,
    this.lon,
    this.accuracy, {
    required this.timestamp,
  });

  final double lat, lon;

  /// estimated horizontal accuracy of this location, radial, in meters
  final int accuracy;
  final DateTime timestamp;

  @override
  List<Object?> get props => [lat, lon, accuracy, timestamp];
}
