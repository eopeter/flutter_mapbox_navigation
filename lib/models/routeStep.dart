part of navigation;

///A RouteStep object represents a single distinct maneuver along a route and the approach to the next maneuver.
///The route step object corresponds to a single instruction the user must follow to complete a portion of the route.
///For example, a step might require the user to turn then follow a road.
class RouteStep {
  String name;
  String instructions;
  double distance;
  double expectedTravelTime;

  RouteStep(
      this.name, this.instructions, this.distance, this.expectedTravelTime);

  RouteStep.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    instructions = json["instructions"];
    distance = _isNullOrZero(json["distance"]) ? 0.0 : json["distance"] + .0;
    expectedTravelTime = _isNullOrZero(json["expectedTravelTime"])
        ? 0.0
        : json["expectedTravelTime"] + .0;
  }
}
