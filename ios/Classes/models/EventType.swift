import Foundation

enum MapBoxEventType: Int, Codable
{
    case map_ready
    case route_building
    case route_built
    case route_build_failed
    case progress_change
    case user_off_route
    case milestone_event
    case navigation_running
    case navigation_cancelled
    case navigation_finished
    case faster_route_found
    case speech_announcement
    case banner_instruction
    case on_arrival
    case failed_to_reroute
    case reroute_along
}