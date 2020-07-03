part of navigation;

class RouteStep
{
  final String name;
  final String instructions;
  final double distance;
  final double expectedTravelTime;

  RouteStep(this.name, this.instructions, this.distance, this.expectedTravelTime);
}