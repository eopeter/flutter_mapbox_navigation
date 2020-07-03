part of navigation;

class RouteLeg
{
  final String profileIdentifier;
  final String name;
  final double distance;
  final double expectedTravelTime;
  final WayPoint source;
  final WayPoint destination;
  final List<RouteStep> steps;

  RouteLeg(this.profileIdentifier, this.name, this.distance, this.expectedTravelTime, this.source, this.destination, this.steps);

}