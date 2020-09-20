part of navigation;

class RouteLeg
{
  String profileIdentifier;
  String name;
  double distance;
  double expectedTravelTime;
  WayPoint source;
  WayPoint destination;
  List<RouteStep> steps;

  RouteLeg(this.profileIdentifier, this.name, this.distance, this.expectedTravelTime, this.source, this.destination, this.steps);

  RouteLeg.fromJson(Map<String, dynamic> json){
    profileIdentifier = json["profileIdentifier"];
    name = json["name"];
    distance =  IsNullOrZero(json["distance"]) ? 0.0 :  json["distance"] + .0;
    expectedTravelTime =  IsNullOrZero(json["expectedTravelTime"]) ? 0.0 :  json["expectedTravelTime"]  + .0;
    source = json['source'] == null
        ? null
        :  WayPoint.fromJson(json['source'] as Map<String, dynamic>);
    destination = json['destination'] == null
        ? null
        :  WayPoint.fromJson(json['destination'] as Map<String, dynamic>);
    steps = (json['steps'] as List)
        ?.map((e) => e == null
        ? null
        : RouteStep.fromJson(e as Map<String, dynamic>))
        ?.toList();
  }
}