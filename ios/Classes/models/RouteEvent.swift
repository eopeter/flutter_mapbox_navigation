import Foundation

public class MapBoxRouteEvent : Codable
{
    let eventType: MapBoxEventType
    let data: String

    init(eventType: MapBoxEventType, data: String) {
        self.eventType = eventType
        self.data = data
    }
}