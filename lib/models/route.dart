part of navigation;

class Route
{
  final String routeIdentifier;
  final double distance;
  final double expectedTravelTime;
  final List<RouteLeg> legs;

  Route(this.routeIdentifier, this.distance, this.expectedTravelTime, this.legs);

}
