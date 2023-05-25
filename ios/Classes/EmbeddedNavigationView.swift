import Flutter
import UIKit
import MapboxMaps
import MapboxDirections
import MapboxCoreNavigation
import MapboxNavigation

public class FlutterMapboxNavigationView : NavigationFactory, FlutterPlatformView
{
    let frame: CGRect
    let viewId: Int64

    let messenger: FlutterBinaryMessenger
    let channel: FlutterMethodChannel
    let eventChannel: FlutterEventChannel

    var navigationMapView: NavigationMapView!
    var arguments: NSDictionary?

    var routeResponse: RouteResponse?
    var selectedRouteIndex = 0
    var routeOptions: NavigationRouteOptions?
    var navigationService: NavigationService!

    var _mapInitialized = false;
    var locationManager = CLLocationManager()

    private let passiveLocationManager = PassiveLocationManager()
    private lazy var passiveLocationProvider = PassiveLocationProvider(locationManager: passiveLocationManager)

    init(messenger: FlutterBinaryMessenger, frame: CGRect, viewId: Int64, args: Any?)
    {
        self.frame = frame
        self.viewId = viewId
        self.arguments = args as! NSDictionary?

        self.messenger = messenger
        self.channel = FlutterMethodChannel(name: "flutter_mapbox_navigation/\(viewId)", binaryMessenger: messenger)
        self.eventChannel = FlutterEventChannel(name: "flutter_mapbox_navigation/\(viewId)/events", binaryMessenger: messenger)

        super.init()

        self.eventChannel.setStreamHandler(self)

        self.channel.setMethodCallHandler { [weak self](call, result) in

            guard let strongSelf = self else { return }

            let arguments = call.arguments as? NSDictionary

            if(call.method == "getPlatformVersion")
            {
                result("iOS " + UIDevice.current.systemVersion)
            }
            else if(call.method == "buildRoute")
            {
                strongSelf.buildRoute(arguments: arguments, flutterResult: result)
            }
            else if(call.method == "clearRoute")
            {
                strongSelf.clearRoute(arguments: arguments, result: result)
            }
            else if(call.method == "getDistanceRemaining")
            {
                result(strongSelf._distanceRemaining)
            }
            else if(call.method == "getDurationRemaining")
            {
                result(strongSelf._durationRemaining)
            }
            else if(call.method == "finishNavigation")
            {
                strongSelf.endNavigation(result: result)
            }
            else if(call.method == "startFreeDrive")
            {
                strongSelf.startEmbeddedFreeDrive(arguments: arguments, result: result)
            }
            else if(call.method == "startNavigation")
            {
                strongSelf.startEmbeddedNavigation(arguments: arguments, result: result)
            }
            else if(call.method == "reCenter"){
                //used to recenter map from user action during navigation
                strongSelf.navigationMapView.navigationCamera.follow()
            }
            else
            {
                result("method is not implemented");
            }

        }
    }

    public func view() -> UIView
    {
        if(_mapInitialized)
        {
            return navigationMapView
        }

        setupMapView()

        return navigationMapView
    }

    private func setupMapView()
    {
        navigationMapView = NavigationMapView(frame: frame)
        navigationMapView.delegate = self

        if(self.arguments != nil)
        {
            _language = arguments?["language"] as? String ?? _language
            _voiceUnits = arguments?["units"] as? String ?? _voiceUnits
            _simulateRoute = arguments?["simulateRoute"] as? Bool ?? _simulateRoute
            _isOptimized = arguments?["isOptimized"] as? Bool ?? _isOptimized
            _allowsUTurnAtWayPoints = arguments?["allowsUTurnAtWayPoints"] as? Bool
            _navigationMode = arguments?["mode"] as? String ?? "drivingWithTraffic"
            _mapStyleUrlDay = arguments?["mapStyleUrlDay"] as? String
            _zoom = arguments?["zoom"] as? Double ?? _zoom
            _bearing = arguments?["bearing"] as? Double ?? _bearing
            _tilt = arguments?["tilt"] as? Double ?? _tilt
            _animateBuildRoute = arguments?["animateBuildRoute"] as? Bool ?? _animateBuildRoute
            _longPressDestinationEnabled = arguments?["longPressDestinationEnabled"] as? Bool ?? _longPressDestinationEnabled

            if(_mapStyleUrlDay != nil)
            {
                navigationMapView.mapView.mapboxMap.style.uri = StyleURI.init(url: URL(string: _mapStyleUrlDay!)!)
            }

            var currentLocation: CLLocation!

            locationManager.requestWhenInUseAuthorization()

            if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
                CLLocationManager.authorizationStatus() == .authorizedAlways) {
                currentLocation = locationManager.location

            }

            let initialLatitude = arguments?["initialLatitude"] as? Double ?? currentLocation?.coordinate.latitude
            let initialLongitude = arguments?["initialLongitude"] as? Double ?? currentLocation?.coordinate.longitude
            if(initialLatitude != nil && initialLongitude != nil)
            {
                moveCameraToCoordinates(latitude: initialLatitude!, longitude: initialLongitude!)
            }

        }

        if _longPressDestinationEnabled
        {
            let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
            gesture.delegate = self
            navigationMapView?.addGestureRecognizer(gesture)
        }

    }

    func clearRoute(arguments: NSDictionary?, result: @escaping FlutterResult)
    {
        if routeResponse == nil
        {
            return
        }

        setupMapView()
        self.view().setNeedsDisplay()

        routeResponse = nil
        sendEvent(eventType: MapBoxEventType.navigation_cancelled)
    }

    func buildRoute(arguments: NSDictionary?, flutterResult: @escaping FlutterResult)
    {
        isEmbeddedNavigation = true
        sendEvent(eventType: MapBoxEventType.route_building)

        guard let oWayPoints = arguments?["wayPoints"] as? NSDictionary else {return}

        var locations = [Location]()

        for item in oWayPoints as NSDictionary
        {
            let point = item.value as! NSDictionary
            guard let oName = point["Name"] as? String else {return}
            guard let oLatitude = point["Latitude"] as? Double else {return}
            guard let oLongitude = point["Longitude"] as? Double else {return}
            let oIsSilent = point["IsSilent"] as? Bool ?? false
            let order = point["Order"] as? Int
            let location = Location(name: oName, latitude: oLatitude, longitude: oLongitude, order: order,isSilent: oIsSilent)
            locations.append(location)
        }

        if(!_isOptimized)
        {
            //waypoints must be in the right order
            locations.sort(by: {$0.order ?? 0 < $1.order ?? 0})
        }


        for loc in locations
        {
            let location = Waypoint(coordinate: CLLocationCoordinate2D(latitude: loc.latitude!, longitude: loc.longitude!),
                                    coordinateAccuracy: -1, name: loc.name)
            location.separatesLegs = !loc.isSilent
            _wayPoints.append(location)
        }

        _language = arguments?["language"] as? String ?? _language
        _voiceUnits = arguments?["units"] as? String ?? _voiceUnits
        _simulateRoute = arguments?["simulateRoute"] as? Bool ?? _simulateRoute
        _isOptimized = arguments?["isOptimized"] as? Bool ?? _isOptimized
        _allowsUTurnAtWayPoints = arguments?["allowsUTurnAtWayPoints"] as? Bool
        _navigationMode = arguments?["mode"] as? String ?? "drivingWithTraffic"
        _showReportFeedbackButton = arguments?["showReportFeedbackButton"] as? Bool ?? _showReportFeedbackButton
        _showEndOfRouteFeedback = arguments?["showEndOfRouteFeedback"] as? Bool ?? _showEndOfRouteFeedback
        if(_wayPoints.count > 3 && arguments?["mode"] == nil)
        {
            _navigationMode = "driving"
        }
        _mapStyleUrlDay = arguments?["mapStyleUrlDay"] as? String
        _mapStyleUrlNight = arguments?["mapStyleUrlNight"] as? String

        var mode: ProfileIdentifier = .automobileAvoidingTraffic

        if (_navigationMode == "cycling")
        {
            mode = .cycling
        }
        else if(_navigationMode == "driving")
        {
            mode = .automobile
        }
        else if(_navigationMode == "walking")
        {
            mode = .walking
        }

        let routeOptions = NavigationRouteOptions(waypoints: _wayPoints, profileIdentifier: mode)

        if (_allowsUTurnAtWayPoints != nil)
        {
            routeOptions.allowsUTurnAtWaypoint = _allowsUTurnAtWayPoints!
        }

        routeOptions.distanceMeasurementSystem = _voiceUnits == "imperial" ? .imperial : .metric
        routeOptions.locale = Locale(identifier: _language)
        self.routeOptions = routeOptions

        // Generate the route object and draw it on the map
        _ = Directions.shared.calculate(routeOptions) { [weak self] (session, result) in

            guard case let .success(response) = result, let strongSelf = self else {
                flutterResult(false)
                self?.sendEvent(eventType: MapBoxEventType.route_build_failed)
                return
            }
            strongSelf.routeResponse = response
            strongSelf.sendEvent(eventType: MapBoxEventType.route_built, data: strongSelf.encodeRouteResponse(response: response))
            strongSelf.navigationMapView?.showcase(response.routes!, routesPresentationStyle: .all(shouldFit: true), animated: true)
            flutterResult(true)
        }
    }

    func startEmbeddedFreeDrive(arguments: NSDictionary?, result: @escaping FlutterResult) {
        
        let locationProvider: LocationProvider = passiveLocationProvider
        navigationMapView.mapView.location.overrideLocationProvider(with: locationProvider)
        passiveLocationProvider.startUpdatingLocation()
        
        navigationMapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        navigationMapView.userLocationStyle = .puck2D()
       
        let navigationViewportDataSource = NavigationViewportDataSource(navigationMapView.mapView)
        navigationViewportDataSource.options.followingCameraOptions.zoomUpdatesAllowed = false
        navigationViewportDataSource.followingMobileCamera.zoom = _zoom
        navigationMapView.navigationCamera.viewportDataSource = navigationViewportDataSource
        result(true)
    }

    func startEmbeddedNavigation(arguments: NSDictionary?, result: @escaping FlutterResult) {
        guard let response = self.routeResponse else { return }
        let navLocationManager = self._simulateRoute ? SimulatedLocationManager(route: response.routes!.first!) : NavigationLocationManager()
        navigationService = MapboxNavigationService(routeResponse: response,
                                                            routeIndex: selectedRouteIndex,
                                                            routeOptions: routeOptions!,
                                                            routingProvider: MapboxRoutingProvider(.hybrid),
                                                            credentials: NavigationSettings.shared.directions.credentials,
                                                            locationSource: navLocationManager,
                                                    simulating: self._simulateRoute ? .always : .onPoorGPS)
        navigationService.delegate = self

        var dayStyle = CustomDayStyle()
        if(_mapStyleUrlDay != nil){
            dayStyle = CustomDayStyle(url: _mapStyleUrlDay)
        }
        let nightStyle = CustomNightStyle()
        if(_mapStyleUrlNight != nil){
            nightStyle.mapStyleURL = URL(string: _mapStyleUrlNight!)!
        }
        let navigationOptions = NavigationOptions(styles: [dayStyle, nightStyle], navigationService: navigationService)

        // Remove previous navigation view and controller if any
        if(_navigationViewController?.view != nil){
            _navigationViewController!.view.removeFromSuperview()
            _navigationViewController?.removeFromParent()
        }

        _navigationViewController = NavigationViewController(for: response, routeIndex: selectedRouteIndex, routeOptions: routeOptions!, navigationOptions: navigationOptions)
        _navigationViewController!.delegate = self
        
        _navigationViewController!.showsReportFeedback = _showReportFeedbackButton
        _navigationViewController!.showsEndOfRouteFeedback = _showEndOfRouteFeedback

        let flutterViewController = UIApplication.shared.delegate?.window?!.rootViewController as! FlutterViewController
        flutterViewController.addChild(_navigationViewController!)

        self.navigationMapView.addSubview(_navigationViewController!.view)
        _navigationViewController!.view.translatesAutoresizingMaskIntoConstraints = false
        constraintsWithPaddingBetween(holderView: self.navigationMapView, topView: _navigationViewController!.view, padding: 0.0)
        flutterViewController.didMove(toParent: flutterViewController)
        result(true)

    }

    func constraintsWithPaddingBetween(holderView: UIView, topView: UIView, padding: CGFloat) {
        guard holderView.subviews.contains(topView) else {
            return
        }
        topView.translatesAutoresizingMaskIntoConstraints = false
        let pinTop = NSLayoutConstraint(item: topView, attribute: .top, relatedBy: .equal,
                                        toItem: holderView, attribute: .top, multiplier: 1.0, constant: padding)
        let pinBottom = NSLayoutConstraint(item: topView, attribute: .bottom, relatedBy: .equal,
                                           toItem: holderView, attribute: .bottom, multiplier: 1.0, constant: padding)
        let pinLeft = NSLayoutConstraint(item: topView, attribute: .left, relatedBy: .equal,
                                         toItem: holderView, attribute: .left, multiplier: 1.0, constant: padding)
        let pinRight = NSLayoutConstraint(item: topView, attribute: .right, relatedBy: .equal,
                                          toItem: holderView, attribute: .right, multiplier: 1.0, constant: padding)
        holderView.addConstraints([pinTop, pinBottom, pinLeft, pinRight])
    }

    func moveCameraToCoordinates(latitude: Double, longitude: Double) {
        let navigationViewportDataSource = NavigationViewportDataSource(navigationMapView.mapView, viewportDataSourceType: .raw)
        navigationViewportDataSource.options.followingCameraOptions.zoomUpdatesAllowed = false
        navigationViewportDataSource.followingMobileCamera.center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        navigationViewportDataSource.followingMobileCamera.zoom = _zoom
        navigationViewportDataSource.followingMobileCamera.bearing = _bearing
        navigationViewportDataSource.followingMobileCamera.pitch = 15
        navigationViewportDataSource.followingMobileCamera.padding = .zero
        navigationMapView.navigationCamera.viewportDataSource = navigationViewportDataSource
    }

    func moveCameraToCenter()
    {
        var duration = 5.0
        if(!_animateBuildRoute)
        {
            duration = 0.0
        }

        let navigationViewportDataSource = NavigationViewportDataSource(navigationMapView.mapView, viewportDataSourceType: .raw)
        navigationViewportDataSource.options.followingCameraOptions.zoomUpdatesAllowed = false
        navigationViewportDataSource.followingMobileCamera.zoom = 13.0
        navigationViewportDataSource.followingMobileCamera.pitch = 15
        navigationViewportDataSource.followingMobileCamera.padding = .zero
        //navigationViewportDataSource.followingMobileCamera.center = mapView?.centerCoordinate
        navigationMapView.navigationCamera.viewportDataSource = navigationViewportDataSource

        // Create a camera that rotates around the same center point, rotating 180°.
        // `fromDistance:` is meters above mean sea level that an eye would have to be in order to see what the map view is showing.
        //let camera = NavigationCamera( Camera(lookingAtCenter: mapView.centerCoordinate, altitude: 2500, pitch: 15, heading: 180)

        // Animate the camera movement over 5 seconds.
        //navigationMapView.mapView.mapboxMap.setCamera(to: CameraOptions(center: navigationMapView.mapView.ma, zoom: 13.0))
                                       //(camera, withDuration: duration, animationTimingFunction: CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut))
    }

}

extension FlutterMapboxNavigationView : NavigationServiceDelegate {

    public func navigationService(_ service: NavigationService, didUpdate progress: RouteProgress, with location: CLLocation, rawLocation: CLLocation) {
        _lastKnownLocation = location
        _distanceRemaining = progress.distanceRemaining
        _durationRemaining = progress.durationRemaining
        sendEvent(eventType: MapBoxEventType.navigation_running)
        //_currentLegDescription =  progress.currentLeg.description
        if(_eventSink != nil)
        {
            let jsonEncoder = JSONEncoder()

            let progressEvent = MapBoxRouteProgressEvent(progress: progress)
            let progressEventJsonData = try! jsonEncoder.encode(progressEvent)
            let progressEventJson = String(data: progressEventJsonData, encoding: String.Encoding.ascii)

            _eventSink!(progressEventJson)

            if(progress.isFinalLeg && progress.currentLegProgress.userHasArrivedAtWaypoint)
            {
                _eventSink = nil
            }
        }
    }
}

extension FlutterMapboxNavigationView : NavigationMapViewDelegate {

//    public func mapView(_ mapView: NavigationMapView, didFinishLoading style: Style) {
//        _mapInitialized = true
//        sendEvent(eventType: MapBoxEventType.map_ready)
//    }

    public func navigationMapView(_ mapView: NavigationMapView, didSelect route: Route) {
        self.selectedRouteIndex = self.routeResponse!.routes?.firstIndex(of: route) ?? 0
    }

    public func mapViewDidFinishLoadingMap(_ mapView: NavigationMapView) {
        // Wait for the map to load before initiating the first camera movement.
        moveCameraToCenter()
    }

}

extension FlutterMapboxNavigationView : UIGestureRecognizerDelegate {

    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

    @objc func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
        guard gesture.state == .ended else { return }
        let location = navigationMapView.mapView.mapboxMap.coordinate(for: gesture.location(in: navigationMapView.mapView))
        requestRoute(destination: location)
    }

    func requestRoute(destination: CLLocationCoordinate2D) {
        sendEvent(eventType: MapBoxEventType.route_building)

        guard let userLocation = navigationMapView.mapView.location.latestLocation else { return }
        let location = CLLocation(latitude: userLocation.coordinate.latitude,
                                  longitude: userLocation.coordinate.longitude)
        let userWaypoint = Waypoint(location: location, heading: userLocation.heading, name: "Current Location")
        let destinationWaypoint = Waypoint(coordinate: destination)

        let routeOptions = NavigationRouteOptions(waypoints: [userWaypoint, destinationWaypoint])
        
        Directions.shared.calculate(routeOptions) { [weak self] (session, result) in

            if let strongSelf = self {

                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                    strongSelf.sendEvent(eventType: MapBoxEventType.route_build_failed)
                case .success(let response):
                    guard let routes = response.routes, let route = response.routes?.first else {
                        strongSelf.sendEvent(eventType: MapBoxEventType.route_build_failed)
                        return
                    }
                    strongSelf.sendEvent(eventType: MapBoxEventType.route_built, data: strongSelf.encodeRouteResponse(response: response))
                    strongSelf.routeOptions = routeOptions
                    strongSelf._routes = routes
                    strongSelf.navigationMapView.show(routes)
                    strongSelf.navigationMapView.showWaypoints(on: route)
                }

            }


        }
    }

}
