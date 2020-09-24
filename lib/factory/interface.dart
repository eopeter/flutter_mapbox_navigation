part of navigation;

abstract class IMapBoxNavigation {
  Future startNavigation(
      {WayPoint origin, WayPoint destination, MapBoxOptions options});

  Future startNavigationWithWayPoints(
      {List<WayPoint> wayPoints, MapBoxOptions options});

  Future<bool> finishNavigation();
}
