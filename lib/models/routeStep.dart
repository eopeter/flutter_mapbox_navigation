part of navigation;

class RouteStep
{
  String name;
  String instructions;
  double distance;
  double expectedTravelTime;

  RouteStep(this.name, this.instructions, this.distance, this.expectedTravelTime);

  RouteStep.fromJson(Map<String, dynamic> json)
  {
    name = json["name"];
    instructions = json["instructions"];
    distance =  IsNullOrZero(json["distance"]) ? 0.0 :  json["distance"]  + .0;
    expectedTravelTime =  IsNullOrZero(json["expectedTravelTime"]) ? 0.0 :  json["expectedTravelTime"]  + .0;
  }
}