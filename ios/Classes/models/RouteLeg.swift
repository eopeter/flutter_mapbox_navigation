import Foundation
import MapboxDirections

public class MapBoxRouteLeg : Codable
{
    let profileIdentifier: String
    let name: String
    let distance: Double
    let expectedTravelTime: Double
    let source: Location
    let destination: Location
    var steps: [MapBoxRouteStep] = []

    init(leg: RouteLeg) {
        profileIdentifier = leg.profileIdentifier.rawValue
        name = leg.name
        distance = leg.distance
        expectedTravelTime = leg.expectedTravelTime
        source = Location(name: leg.source?.name ?? "source", latitude: leg.source?.coordinate.latitude, longitude: leg.source?.coordinate.longitude)
        destination = Location(name: leg.destination?.name ?? "source", latitude: leg.destination?.coordinate.latitude, longitude: leg.destination?.coordinate.longitude)
        for step in leg.steps {
            steps.append(MapBoxRouteStep(step: step))
        }
    }
}
