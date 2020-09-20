part of navigation;

class RouteProgressEvent
{
   bool arrived;
   double distance;
   double duration;
   double distanceTraveled;
   double currentLegDistanceTraveled;
   double currentLegDistanceRemaining;
   String currentStepInstruction;
   RouteLeg currentLeg;
   RouteLeg priorLeg;
   List<RouteLeg> remainingLegs;
   int legIndex;
   int stepIndex;


   RouteProgressEvent(
       {
         this.arrived,
         this.distance,
         this.duration,
         this.distanceTraveled,
         this.currentLegDistanceTraveled,
         this.currentLegDistanceRemaining,
         this.currentStepInstruction,
         this.currentLeg,
         this.priorLeg,
         this.remainingLegs,
         this.legIndex,
         this.stepIndex});

   RouteProgressEvent.fromJson(Map<String, dynamic> json) {
     arrived = json['arrived'] as bool;
     distance = IsNullOrZero(json['distance']) ? 0.0 :  json["distance"]  + .0;
     duration = IsNullOrZero(json['duration']) ? 0.0 :  json["duration"]  + .0;
     distanceTraveled =  IsNullOrZero(json['distanceTraveled']) ? 0.0 :  json["distanceTraveled"]  + .0;
     currentLegDistanceTraveled =  IsNullOrZero(json['currentLegDistanceTraveled']) ? 0.0 :  json["currentLegDistanceTraveled"]  + .0;
     currentLegDistanceRemaining =  IsNullOrZero(json['currentLegDistanceRemaining']) ? 0.0 :  json["currentLegDistanceRemaining"]  + .0;
     currentStepInstruction = json['currentStepInstruction'];
     currentLeg = json['currentLeg'] == null
         ? null
         : RouteLeg.fromJson(json['currentLeg'] as Map<String, dynamic>);
     priorLeg = json['priorLeg'] == null
         ? null
         : RouteLeg.fromJson(json['priorLeg'] as Map<String, dynamic>);
     remainingLegs = (json['remainingLegs'] as List)
         ?.map((e) => e == null
         ? null
         : RouteLeg.fromJson(e as Map<String, dynamic>))
         ?.toList();
     legIndex = json['legIndex'];
     stepIndex = json['stepIndex'];

   }
   
}