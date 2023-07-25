import Flutter
import UIKit
import MapboxMaps
import MapboxDirections
import MapboxCoreNavigation
import MapboxNavigation

public class NavigationFactory : NSObject, FlutterStreamHandler
{
    var _navigationViewController: NavigationViewController? = nil
    var _eventSink: FlutterEventSink? = nil
    
    let ALLOW_ROUTE_SELECTION = false
    let IsMultipleUniqueRoutes = false
    var isEmbeddedNavigation = false
    
    var _distanceRemaining: Double?
    var _durationRemaining: Double?
    var _navigationMode: String?
    var _routes: [Route]?
    var _wayPointOrder = [Int:Waypoint]()
    var _wayPoints = [Waypoint]()
    var _lastKnownLocation: CLLocation?
    
    var _options: NavigationRouteOptions?
    var _simulateRoute = false
    var _allowsUTurnAtWayPoints: Bool?
    var _isOptimized = false
    var _language = "en"
    var _voiceUnits = "imperial"
    var _mapStyleUrlDay: String?
    var _mapStyleUrlNight: String?
    var _zoom: Double = 13.0
    var _tilt: Double = 0.0
    var _bearing: Double = 0.0
    var _animateBuildRoute = true
    var _longPressDestinationEnabled = true
    var _alternatives = true
    var _shouldReRoute = true
    var _showReportFeedbackButton = true
    var _showEndOfRouteFeedback = true
    var _enableOnMapTapCallback = false
    var _customPinPath: String?
    var navigationDirections: Directions?
    
    func addWayPoints(arguments: NSDictionary?, result: @escaping FlutterResult)
    {

        guard var locations = getLocationsFromFlutterArgument(arguments: arguments) else { return }

        var nextIndex = 1
        for loc in locations
        {
            let wayPoint = Waypoint(coordinate: CLLocationCoordinate2D(latitude: loc.latitude!, longitude: loc.longitude!), name: loc.name)
            wayPoint.separatesLegs = !loc.isSilent
            if (_wayPoints.count >= nextIndex) {
                _wayPoints.insert(wayPoint, at: nextIndex)
            }
            else {
                _wayPoints.append(wayPoint)
            }
            nextIndex += 1
        }
        
        startNavigationWithWayPoints(wayPoints: _wayPoints, flutterResult: result, isUpdatingWaypoints: true)
    }
    
    func startFreeDrive(arguments: NSDictionary?, result: @escaping FlutterResult)
    {
        let freeDriveViewController = FreeDriveViewController()
        let flutterViewController = UIApplication.shared.delegate?.window??.rootViewController as! FlutterViewController
        flutterViewController.present(freeDriveViewController, animated: true, completion: nil)
    }
    
    func startNavigation(arguments: NSDictionary?, result: @escaping FlutterResult)
    {
        _wayPoints.removeAll()
        _wayPointOrder.removeAll()
        
        guard var locations = getLocationsFromFlutterArgument(arguments: arguments) else { return }
        
        for loc in locations
        {
            let location = Waypoint(coordinate: CLLocationCoordinate2D(latitude: loc.latitude!, longitude: loc.longitude!), name: loc.name)
            
            location.separatesLegs = !loc.isSilent
            
            _wayPoints.append(location)
            _wayPointOrder[loc.order!] = location
        }
        
        parseFlutterArguments(arguments: arguments)
        
        _options?.includesAlternativeRoutes = _alternatives
        
        if(_wayPoints.count > 3 && arguments?["mode"] == nil)
        {
            _navigationMode = "driving"
        }
        
        if(_wayPoints.count > 0)
        {
            if(IsMultipleUniqueRoutes)
            {
                startNavigationWithWayPoints(wayPoints: [_wayPoints.remove(at: 0), _wayPoints.remove(at: 0)], flutterResult: result, isUpdatingWaypoints: false)
            }
            else
            {
                startNavigationWithWayPoints(wayPoints: _wayPoints, flutterResult: result, isUpdatingWaypoints: false)
            }
            
        }
    }
    
    
    func startNavigationWithWayPoints(wayPoints: [Waypoint], flutterResult: @escaping FlutterResult, isUpdatingWaypoints: Bool)
    {
        let simulationMode: SimulationMode = _simulateRoute ? .always : .never
        setNavigationOptions(wayPoints: wayPoints)
        
        Directions.shared.calculate(_options!) { [weak self](session, result) in
            guard let strongSelf = self else { return }
            switch result {
            case .failure(let error):
                strongSelf.sendEvent(eventType: MapBoxEventType.route_build_failed)
                flutterResult("An error occured while calculating the route \(error.localizedDescription)")
            case .success(let response):
                guard let routes = response.routes else { return }
                //TODO: if more than one route found, give user option to select one: DOES NOT WORK
                if(routes.count > 1 && strongSelf.ALLOW_ROUTE_SELECTION)
                {
                    //show map to select a specific route
                    strongSelf._routes = routes
                    let routeOptionsView = RouteOptionsViewController(routes: routes, options: strongSelf._options!)
                    
                    let flutterViewController = UIApplication.shared.delegate?.window??.rootViewController as! FlutterViewController
                    flutterViewController.present(routeOptionsView, animated: true, completion: nil)
                }
                else
                {
                    let navigationService = MapboxNavigationService(routeResponse: response, routeIndex: 0, routeOptions: strongSelf._options!, simulating: simulationMode)
                    var dayStyle = CustomDayStyle()
                    if(strongSelf._mapStyleUrlDay != nil){
                        dayStyle = CustomDayStyle(url: strongSelf._mapStyleUrlDay)
                    }
                    let nightStyle = CustomNightStyle()
                    if(strongSelf._mapStyleUrlNight != nil){
                        nightStyle.mapStyleURL = URL(string: strongSelf._mapStyleUrlNight!)!
                    }
                    let navigationOptions = NavigationOptions(styles: [dayStyle, nightStyle], navigationService: navigationService)
                    if (isUpdatingWaypoints) {
                        strongSelf._navigationViewController?.navigationService.router.updateRoute(with: IndexedRouteResponse(routeResponse: response, routeIndex: 0), routeOptions: strongSelf._options) { success in
                            if (success) {
                                flutterResult("true")
                            } else {
                                flutterResult("failed to add stop")
                            }
                        }
                    }
                    else {
                        strongSelf.startNavigation(routeResponse: response, options: strongSelf._options!, navOptions: navigationOptions)
                    }
                }
            }
        }
        
    }
    
    func startNavigation(routeResponse: RouteResponse, options: NavigationRouteOptions, navOptions: NavigationOptions)
    {
        isEmbeddedNavigation = false
        if(self._navigationViewController == nil)
        {
            self._navigationViewController = NavigationViewController(for: routeResponse, routeIndex: 0, routeOptions: options, navigationOptions: navOptions)
            self._navigationViewController!.modalPresentationStyle = .fullScreen
            self._navigationViewController!.delegate = self
            self._navigationViewController!.navigationMapView!.localizeLabels()
            self._navigationViewController!.showsReportFeedback = _showReportFeedbackButton
            self._navigationViewController!.showsEndOfRouteFeedback = _showEndOfRouteFeedback
            
            
            if (_customPinPath != nil) {
                for wp in _wayPoints.dropFirst().dropLast() {
                    let options = ViewAnnotationOptions(geometry: Point(wp.coordinate), allowOverlap: true, anchor: .bottom)
                    let annotationView = createCustomPinView()
                    
                    if (annotationView != nil) {
                        try? self._navigationViewController!.navigationMapView!.mapView.viewAnnotations.add(annotationView!, options: options)
                    }
                }
            }
        }
        let flutterViewController = UIApplication.shared.delegate?.window??.rootViewController as! FlutterViewController
        flutterViewController.present(self._navigationViewController!, animated: true, completion: nil)
    }
    
    func createCustomPinView() -> UIView? {
        let flutterViewController = UIApplication.shared.delegate?.window??.rootViewController as! FlutterViewController
        
        let key = flutterViewController.lookupKey(forAsset: _customPinPath!)
        let mainBundle = Bundle.main
        let path = mainBundle.path(forResource: key, ofType: nil)
        
        if (path == nil) {
            return nil
        }
        let image = UIImageView(image:  UIImage.init(contentsOfFile: path!))
        image.frame.size = CGSize(width: 25, height: 30)
        return image
    }
    
    func setNavigationOptions(wayPoints: [Waypoint]) {
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
        let options = NavigationRouteOptions(waypoints: wayPoints, profileIdentifier: mode)
        
        if (_allowsUTurnAtWayPoints != nil)
        {
            options.allowsUTurnAtWaypoint = _allowsUTurnAtWayPoints!
        }
        
        options.distanceMeasurementSystem = _voiceUnits == "imperial" ? .imperial : .metric
        options.locale = Locale(identifier: _language)
        _options = options
    }
    
    func parseFlutterArguments(arguments: NSDictionary?) {
        _language = arguments?["language"] as? String ?? _language
        _voiceUnits = arguments?["units"] as? String ?? _voiceUnits
        _simulateRoute = arguments?["simulateRoute"] as? Bool ?? _simulateRoute
        _isOptimized = arguments?["isOptimized"] as? Bool ?? _isOptimized
        _allowsUTurnAtWayPoints = arguments?["allowsUTurnAtWayPoints"] as? Bool
        _navigationMode = arguments?["mode"] as? String ?? "drivingWithTraffic"
        _showReportFeedbackButton = arguments?["showReportFeedbackButton"] as? Bool ?? _showReportFeedbackButton
        _showEndOfRouteFeedback = arguments?["showEndOfRouteFeedback"] as? Bool ?? _showEndOfRouteFeedback
        _enableOnMapTapCallback = arguments?["enableOnMapTapCallback"] as? Bool ?? _enableOnMapTapCallback
        _mapStyleUrlDay = arguments?["mapStyleUrlDay"] as? String
        _mapStyleUrlNight = arguments?["mapStyleUrlNight"] as? String
        _zoom = arguments?["zoom"] as? Double ?? _zoom
        _bearing = arguments?["bearing"] as? Double ?? _bearing
        _tilt = arguments?["tilt"] as? Double ?? _tilt
        _animateBuildRoute = arguments?["animateBuildRoute"] as? Bool ?? _animateBuildRoute
        _longPressDestinationEnabled = arguments?["longPressDestinationEnabled"] as? Bool ?? _longPressDestinationEnabled
        _alternatives = arguments?["alternatives"] as? Bool ?? _alternatives
        _customPinPath = arguments?["customPinPath"] as? String ?? _customPinPath
    }
    
    
    func continueNavigationWithWayPoints(wayPoints: [Waypoint])
    {
        _options?.waypoints = wayPoints
        Directions.shared.calculate(_options!) { [weak self](session, result) in
            guard let strongSelf = self else { return }
            switch result {
            case .failure(let error):
                strongSelf.sendEvent(eventType: MapBoxEventType.route_build_failed, data: error.localizedDescription)
            case .success(let response):
                strongSelf.sendEvent(eventType: MapBoxEventType.route_built, data: strongSelf.encodeRouteResponse(response: response))
                guard let routes = response.routes else { return }
                //TODO: if more than one route found, give user option to select one: DOES NOT WORK
                if(routes.count > 1 && strongSelf.ALLOW_ROUTE_SELECTION)
                {
                    //TODO: show map to select a specific route
                    
                }
                else
                {
                    strongSelf._navigationViewController?.navigationService.start()
                }
            }
        }
        
    }
    
    func endNavigation(result: FlutterResult?)
    {
        sendEvent(eventType: MapBoxEventType.navigation_finished)
        if(self._navigationViewController != nil)
        {
            self._navigationViewController?.navigationService.endNavigation(feedback: nil)
            if(isEmbeddedNavigation)
            {
                self._navigationViewController?.view.removeFromSuperview()
                self._navigationViewController?.removeFromParent()
                self._navigationViewController = nil
            }
            else
            {
                self._navigationViewController?.dismiss(animated: true, completion: {
                    self._navigationViewController = nil
                    if(result != nil)
                    {
                        result!(true)
                    }
                })
            }
        }
        
    }
    
    func getLocationsFromFlutterArgument(arguments: NSDictionary?) -> [Location]? {
        
        var locations = [Location]()
        guard let oWayPoints = arguments?["wayPoints"] as? NSDictionary else {return nil}
        for item in oWayPoints as NSDictionary
        {
            let point = item.value as! NSDictionary
            guard let oName = point["Name"] as? String else {return nil }
            guard let oLatitude = point["Latitude"] as? Double else {return nil}
            guard let oLongitude = point["Longitude"] as? Double else {return nil}
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
        return locations
    }
    
    func getLastKnownLocation() -> Waypoint
    {
        return Waypoint(coordinate: CLLocationCoordinate2D(latitude: _lastKnownLocation!.coordinate.latitude, longitude: _lastKnownLocation!.coordinate.longitude))
    }
    
    
    
    func sendEvent(eventType: MapBoxEventType, data: String = "")
    {
        let routeEvent = MapBoxRouteEvent(eventType: eventType, data: data)
        
        let jsonEncoder = JSONEncoder()
        let jsonData = try! jsonEncoder.encode(routeEvent)
        let eventJson = String(data: jsonData, encoding: String.Encoding.utf8)
        if(_eventSink != nil){
            _eventSink!(eventJson)
        }
        
    }
    
    func downloadOfflineRoute(arguments: NSDictionary?, flutterResult: @escaping FlutterResult)
    {
        /*
         // Create a directions client and store it as a property on the view controller.
         self.navigationDirections = NavigationDirections(credentials: Directions.shared.credentials)
         
         // Fetch available routing tile versions.
         _ = self.navigationDirections!.fetchAvailableOfflineVersions { (versions, error) in
         guard let version = versions?.first else { return }
         
         let coordinateBounds = CoordinateBounds(southWest: CLLocationCoordinate2DMake(0, 0), northEast: CLLocationCoordinate2DMake(1, 1))
         
         // Download tiles using the most recent version.
         _ = self.navigationDirections!.downloadTiles(in: coordinateBounds, version: version) { (url, response, error) in
         guard let url = url else {
         flutterResult(false)
         preconditionFailure("Unable to locate temporary file.")
         }
         
         guard let outputDirectoryURL = Bundle.mapboxCoreNavigation.suggestedTileURL(version: version) else {
         flutterResult(false)
         preconditionFailure("No suggested tile URL.")
         }
         try? FileManager.default.createDirectory(at: outputDirectoryURL, withIntermediateDirectories: true, attributes: nil)
         
         // Unpack downloaded routing tiles.
         NavigationDirections.unpackTilePack(at: url, outputDirectoryURL: outputDirectoryURL, progressHandler: { (totalBytes, bytesRemaining) in
         // Show unpacking progress.
         }, completionHandler: { (result, error) in
         // Configure the offline router with the output directory where the tiles have been unpacked.
         self.navigationDirections!.configureRouter(tilesURL: outputDirectoryURL) { (numberOfTiles) in
         // Completed, dismiss UI
         flutterResult(true)
         }
         })
         }
         }
         */
    }
    
    func encodeRouteResponse(response: RouteResponse) -> String {
        let routes = response.routes
        
        if routes != nil && !routes!.isEmpty {
            let jsonEncoder = JSONEncoder()
            let jsonData = try! jsonEncoder.encode(response.routes!)
            return String(data: jsonData, encoding: String.Encoding.utf8) ?? "{}"
        }
        
        return "{}"
    }
    
    //MARK: EventListener Delegates
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        _eventSink = events
        return nil
    }
    
    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        _eventSink = nil
        return nil
    }
    
    // MARK: - Styling methods
    func customCircleLayer(with identifier: String, sourceIdentifier: String) -> CircleLayer {
        return CircleLayer(id: identifier)
    }
    
    func customSymbolLayer(with identifier: String, sourceIdentifier: String) -> SymbolLayer {
        return SymbolLayer(id: identifier)
    }
    
    func customWaypointShape(shapeFor waypoints: [Waypoint], legIndex: Int) -> FeatureCollection {
        let features = [Turf.Feature]()
        return FeatureCollection(features: features)
    }
}


extension NavigationFactory : NavigationViewControllerDelegate {
    //MARK: NavigationViewController Delegates
    public func navigationViewController(_ navigationViewController: NavigationViewController, didUpdate progress: RouteProgress, with location: CLLocation, rawLocation: CLLocation) {
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
            
            if(progress.isFinalLeg && progress.currentLegProgress.userHasArrivedAtWaypoint && !_showEndOfRouteFeedback)
            {
                _eventSink = nil
            }
        }
    }
    
    public func navigationViewController(_ navigationViewController: NavigationViewController, didArriveAt waypoint: Waypoint) -> Bool {
        sendEvent(eventType: MapBoxEventType.on_arrival, data: "true")
        if(!_wayPoints.isEmpty && IsMultipleUniqueRoutes)
        {
            continueNavigationWithWayPoints(wayPoints: [getLastKnownLocation(), _wayPoints.remove(at: 0)])
            return false
        }
        
        return true
    }
    
    
    
    public func navigationViewControllerDidDismiss(_ navigationViewController: NavigationViewController, byCanceling canceled: Bool) {
        if(canceled)
        {
            sendEvent(eventType: MapBoxEventType.navigation_cancelled)
        }
        endNavigation(result: nil)
    }
    
    public func navigationViewController(_ navigationViewController: NavigationViewController, shouldRerouteFrom location: CLLocation) -> Bool {
        return _shouldReRoute
    }
    
    public func navigationViewController(_ navigationViewController: NavigationViewController, didSubmitArrivalFeedback feedback: EndOfRouteFeedback) {
        
        if(_eventSink != nil)
        {
            let jsonEncoder = JSONEncoder()
            
            let localFeedback = Feedback(rating: feedback.rating, comment: feedback.comment)
            let feedbackJsonData = try! jsonEncoder.encode(localFeedback)
            let feedbackJson = String(data: feedbackJsonData, encoding: String.Encoding.ascii)
            
            sendEvent(eventType: MapBoxEventType.navigation_finished, data: feedbackJson ?? "")
            
            _eventSink = nil
            
        }
    }
    
    public func navigationViewController(_ navigationViewController: NavigationViewController, waypointCircleLayerWithIdentifier identifier: String, sourceIdentifier: String) -> CircleLayer? {
        if (_customPinPath == nil) {
            return nil
        }
        return customCircleLayer(with: identifier, sourceIdentifier: sourceIdentifier)
    }
    
    public func navigationViewController(_ navigationViewController: NavigationViewController, waypointSymbolLayerWithIdentifier identifier: String, sourceIdentifier: String) -> SymbolLayer? {
        if (_customPinPath == nil) {
            return nil
        }
        return customSymbolLayer(with: identifier, sourceIdentifier: sourceIdentifier)
    }
    
    public func navigationViewController(_ navigationViewController: NavigationViewController, shapeFor waypoints: [Waypoint], legIndex: Int) -> FeatureCollection? {
        if (_customPinPath == nil) {
            return nil
        }
        return customWaypointShape(shapeFor: waypoints, legIndex: legIndex)
    }
    
}
