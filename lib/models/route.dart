part of navigation;

///A Route object defines a single route that the user can follow to visit a series of waypoints in order.
///The route object includes information about the route, such as its distance and expected travel time.
///Depending on the criteria used to calculate the route, the route object may also include detailed turn-by-turn instructions.
class Route {
  final String routeIdentifier;
  final double distance;
  final double expectedTravelTime;
  final List<RouteLeg> legs;

  Route(
      this.routeIdentifier, this.distance, this.expectedTravelTime, this.legs);
}
