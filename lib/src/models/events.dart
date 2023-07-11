// ignore_for_file: constant_identifier_names, public_member_api_docs

/// All possible events that could occur in the course of navigation
enum MapBoxEvent {
  map_ready,
  route_building,
  route_built,
  route_build_failed,
  route_build_cancelled,
  route_build_no_routes_found,
  progress_change,
  user_off_route,
  milestone_event,
  navigation_running,
  navigation_cancelled,
  navigation_finished,
  faster_route_found,
  speech_announcement,
  banner_instruction,
  on_arrival,
  failed_to_reroute,
  reroute_along
}
