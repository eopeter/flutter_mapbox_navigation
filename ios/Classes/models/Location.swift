import Foundation

public class Location : Codable
{
    let name: String
    let latitude: Double?
    let longitude: Double?
    let order: Int?

    init(name: String, latitude: Double?, longitude: Double?, order: Int? = nil) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.order = order
    }
}