import Foundation
import MapboxDirections

public class MapBoxRouteStep : Codable
{
    let name: String?
    let instructions: String
    let distance: Double
    let expectedTravelTime: Double

    init(step: RouteStep){
        name = step.names?.first
        instructions = step.instructions
        distance = step.distance
        expectedTravelTime = step.expectedTravelTime
    }
}
