import Flutter
import UIKit
import Mapbox
import MapboxDirections
import MapboxCoreNavigation
import MapboxNavigation

public class SwiftFlutterMapboxNavigationPlugin: NSObject, FlutterPlugin, FlutterStreamHandler, NavigationViewControllerDelegate {
    
    var _navigationViewController: NavigationViewController? = nil
    var _eventSink: FlutterEventSink? = nil
    
    let ALLOW_ROUTE_SELECTION = false
    var _distanceRemaining: Double?
    var _durationRemaining: Double?
    var _navigationMode: String?
    var _routes: [Route]?

    var _options: NavigationRouteOptions?
    var _simulateRoute = false
    var _allowsUTurnAtWayPoints: Bool?
    var _isOptimized = false
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_mapbox_navigation", binaryMessenger: registrar.messenger())
        let eventChannel = FlutterEventChannel(name: "flutter_mapbox_navigation/events", binaryMessenger: registrar.messenger())
        let instance = SwiftFlutterMapboxNavigationPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
       
        eventChannel.setStreamHandler(instance)
        
        let viewFactory = FlutterMapboxNavigationViewFactory()
        registrar.register(viewFactory, withId: "FlutterMapboxNavigationView")
        
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        
        let arguments = call.arguments as? NSDictionary
        
        if(call.method == "getDistanceRemaining")
        {
            result(_distanceRemaining)
        }
        else if(call.method == "getDurationRemaining")
        {
            result(_durationRemaining)
        }
        else if(call.method == "finishNavigation")
        {
            endNavigation(result: result)
        }
        else if(call.method == "startRoute")
        {
            guard let routeIdentifier = arguments?["routeIdentifier"] as? String else {return}
            startNavigation(routeIdentifier: routeIdentifier, flutterResult: result)
        }
        else if(call.method == "startNavigation")
        {
            guard let oName = arguments?["originName"] as? String else {return}
            guard let oLatitude = arguments?["originLatitude"] as? Double else {return}
            guard let oLongitude = arguments?["originLongitude"] as? Double else {return}
            
            guard let dName = arguments?["destinationName"] as? String else {return}
            guard let dLatitude = arguments?["destinationLatitude"] as? Double else {return}
            guard let dLongitude = arguments?["destinationLongitude"] as? Double else {return}
            
            let language = arguments?["language"] as? String
            let voiceUnits = arguments?["units"] as? String
            _simulateRoute = arguments?["simulateRoute"] as? Bool ?? false
            let oMode = arguments?["mode"] as? String ?? "drivingWithTraffic"
            _navigationMode = oMode
            
            let origin = Location(name: oName, latitude: oLatitude, longitude: oLongitude)
            let destination = Location(name: dName, latitude: dLatitude, longitude: dLongitude)
            
            startNavigation(origin: origin, destination: destination, language: language, units: voiceUnits, simulateRoute: _simulateRoute, flutterResult: result)
        }
        else if(call.method == "startNavigationWithWayPoints")
        {
            guard let oWayPoints = arguments?["wayPoints"] as? NSDictionary else {return}
            
            var locations = [Location]()
            
            for item in oWayPoints as NSDictionary
            {
                let point = item.value as! NSDictionary
                guard let oName = point["Name"] as? String else {return}
                guard let oLatitude = point["Latitude"] as? Double else {return}
                guard let oLongitude = point["Longitude"] as? Double else {return}
                let order = point["Order"] as? Int
                let location = Location(name: oName, latitude: oLatitude, longitude: oLongitude, order: order)
                locations.append(location)
            }
            
            if(!_isOptimized)
            {
                //waypoints must be in the right order
                locations.sort(by: {$0.order ?? 0 < $1.order ?? 0})
            }
            
            var wayPoints = [Waypoint]()
            for loc in locations
            {
                let location = Waypoint(coordinate: CLLocationCoordinate2D(latitude: loc.latitude!, longitude: loc.longitude!), name: loc.name)
                wayPoints.append(location)
            }
            
            let language = arguments?["language"] as? String
            let voiceUnits = arguments?["units"] as? String
            _simulateRoute = arguments?["simulateRoute"] as? Bool ?? false
            _isOptimized = arguments?["isOptimized"] as? Bool ?? false
            _allowsUTurnAtWayPoints = arguments?["allowsUTurnAtWayPoints"] as? Bool
            let oMode = arguments?["mode"] as? String ?? "drivingWithTraffic"
            _navigationMode = oMode
            
            
            startNavigationWithWayPoints(wayPoints: wayPoints, language: language, units: voiceUnits, simulateRoute:  _simulateRoute, flutterResult: result)
        }
      
        result("iOS " + UIDevice.current.systemVersion)
    }
    
    func startNavigation(routeIdentifier: String, flutterResult: @escaping FlutterResult)
    {
        guard let route = self._routes?.first(where: { $0.routeIdentifier == routeIdentifier}) else {return}
        let simulationMode: SimulationMode = _simulateRoute ? .always : .never
        let options = self._options!
        let navigationService = MapboxNavigationService(route: route, routeOptions: options, simulating: simulationMode)
        let navigationOptions = NavigationOptions(navigationService: navigationService)
        startNavigation(route: route, options: options, navOptions: navigationOptions)
    }
    
 
    func startNavigation(origin: Location, destination: Location, language: String?, units: String?, simulateRoute: Bool = false, flutterResult: @escaping FlutterResult){
        
        let o = Waypoint(coordinate: CLLocationCoordinate2D(latitude: origin.latitude!, longitude: origin.longitude!), name: origin.name)
        let d = Waypoint(coordinate: CLLocationCoordinate2D(latitude: destination.latitude!, longitude: destination.longitude!), name: destination.name)
        startNavigationWithWayPoints(wayPoints: [o, d], language: language, units: units, simulateRoute: simulateRoute, flutterResult: flutterResult)
    }
    
    func startNavigationWithWayPoints(wayPoints: [Waypoint], language: String?, units: String?, simulateRoute: Bool = false, flutterResult: @escaping FlutterResult)
    {
        let simulationMode: SimulationMode = simulateRoute ? .always : .never
        
        var mode: DirectionsProfileIdentifier = .automobileAvoidingTraffic
        
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
        
        if(units != nil)
        {
            options.distanceMeasurementSystem = units == "imperial" ? .imperial : .metric
        }
        
        if(language != nil)
        {
            options.locale = Locale(identifier: language!)
        }
        
        Directions.shared.calculate(options) { [weak self](session, result) in
            guard let strongSelf = self else { return }
            switch result {
                case .failure(let error):
                    strongSelf.sendEvent(eventType: MapBoxEventType.route_build_failed, data: nil)
                    flutterResult("An error occured while calculating the route \(error.localizedDescription)")
                case .success(let response):
                    guard let routes = response.routes else { return }
                    //TODO: if more than one route found, give user option to select one: DOES NOT WORK
                    if(routes.count > 1 && strongSelf.ALLOW_ROUTE_SELECTION)
                    {
                       //show map to select a specific route
                        strongSelf._routes = routes
                        strongSelf._options = options
                        let routeOptionsView = RouteOptionsViewController(routes: routes, options: options)
                        
                        let flutterViewController = UIApplication.shared.delegate?.window??.rootViewController as! FlutterViewController
                        flutterViewController.present(routeOptionsView, animated: true, completion: nil)
                    }
                    else
                    {
                        let route = routes.first!
                        let navigationService = MapboxNavigationService(route: route, routeOptions: options, simulating: simulationMode)
                        let navigationOptions = NavigationOptions(navigationService: navigationService)
                        strongSelf.startNavigation(route: route, options: options, navOptions: navigationOptions)
                    }
                    //strongSelf.startNavigation(route: routes.first!, options: options)
            }
        }
        
    }
    
    func startNavigation(route: Route, options: NavigationRouteOptions, navOptions: NavigationOptions)
    {
        if(self._navigationViewController == nil)
        {
            self._navigationViewController = NavigationViewController(for: route, routeOptions: options, navigationOptions: navOptions)
            self._navigationViewController!.modalPresentationStyle = .fullScreen
            self._navigationViewController!.delegate = self
            self._navigationViewController!.mapView?.localizeLabels()
        }
        let flutterViewController = UIApplication.shared.delegate?.window??.rootViewController as! FlutterViewController
        flutterViewController.present(self._navigationViewController!, animated: true, completion: nil)
    }
    
    func endNavigation(result: FlutterResult?)
    {
        if(self._navigationViewController != nil)
        {
            self._navigationViewController?.navigationService.endNavigation(feedback: nil)
            self._navigationViewController?.dismiss(animated: true, completion: {
                self._navigationViewController = nil
                if(result != nil)
                {
                    result!(true)
                }
            })
        }
        
    }
    
    public func navigationViewController(_ navigationViewController: NavigationViewController, didUpdate progress: RouteProgress, with location: CLLocation, rawLocation: CLLocation) {
        _distanceRemaining = progress.distanceRemaining
        _durationRemaining = progress.durationRemaining
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
    
    public func navigationViewController(_ navigationViewController: NavigationViewController, didArriveAt waypoint: Waypoint) -> Bool {
            
        sendEvent(eventType: MapBoxEventType.on_arrival, data: nil)
        return true
    }
    
    func sendEvent(eventType: MapBoxEventType, data: String?)
    {
        let routeEvent = MapBoxRouteEvent(eventType: eventType, data: data)
        
        let jsonEncoder = JSONEncoder()
        let jsonData = try! jsonEncoder.encode(routeEvent)
        let eventJson = String(data: jsonData, encoding: String.Encoding.utf8)
        _eventSink!(eventJson)
    }
    
    public func navigationViewControllerDidDismiss(_ navigationViewController: NavigationViewController, byCanceling canceled: Bool) {
        endNavigation(result: nil)
    }
    
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        _eventSink = events
        return nil
    }
    
    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        _eventSink = nil
        return nil
    }
}

public class MapBoxRouteEvent : Codable
{
    let eventType: MapBoxEventType
    let data: String?
    
    init(eventType: MapBoxEventType, data: String?  = "{}") {
        self.eventType = eventType
        self.data = data
    }
}

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
/*
extension MapBoxEventType: Codable {
    
    enum Key: CodingKey {
        case rawValue
        case associatedValue
    }
    
    enum CodingError: Error {
        case unknownValue
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        let rawValue = try container.decode(Int.self, forKey: .rawValue)
        switch rawValue {
        case 0:
            let map_ready = try container.decode(String.self, forKey: .associatedValue)
            self = .map_ready(map_ready)
        case 1:
            let route_building = try container.decode(String.self, forKey: .associatedValue)
            self = .route_building(route_building)
        case 2:
            let progress_change = try container.decode(String.self, forKey: .associatedValue)
            self = .progress_change(progress_change)
        default:
            throw CodingError.unknownValue
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)
        switch self {
        case .map_ready(let map_ready):
            try container.encode(0, forKey: .rawValue)
            try container.encode(map_ready, forKey: .associatedValue)
        case .route_building(let route_building):
            try container.encode(1, forKey: .rawValue)
            try container.encode(route_building, forKey: .associatedValue)
        case .progress_change(let progress_change):
            try container.encode(1, forKey: .rawValue)
            try container.encode(progress_change, forKey: .associatedValue)
        default:
            throw CodingError.unknownValue
        }
    }
    
}
*/

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


public class MapBoxRouteProgressEvent : Codable
{
    let arrived: Bool
    let distance: Double
    let duration: Double
    let distanceTraveled: Double
    let currentLegDistanceTraveled: Double
    let currentLegDistanceRemaining: Double
    let currentStepInstruction: String
    let legIndex: Int
    let stepIndex: Int
    let currentLeg: MapBoxRouteLeg
    var priorLeg: MapBoxRouteLeg? = nil
    var remainingLegs: [MapBoxRouteLeg] = []

    init(progress: RouteProgress) {
       
        arrived = progress.isFinalLeg && progress.currentLegProgress.userHasArrivedAtWaypoint
        distance = progress.distanceRemaining
        distanceTraveled = progress.distanceTraveled
        duration = progress.durationRemaining
        legIndex = progress.legIndex
        stepIndex = progress.currentLegProgress.stepIndex

        currentLeg = MapBoxRouteLeg(leg: progress.currentLeg)
        
        if(progress.priorLeg != nil)
        {
            priorLeg = MapBoxRouteLeg(leg: progress.priorLeg!)
        }

        for leg in progress.remainingLegs
        {
            remainingLegs.append(MapBoxRouteLeg(leg: leg))
        }
        
        currentLegDistanceTraveled = progress.currentLegProgress.distanceTraveled
        currentLegDistanceRemaining = progress.currentLegProgress.distanceRemaining
        currentStepInstruction = progress.currentLegProgress.currentStep.description
    }
    

}

public class FlutterMapboxNavigationViewFactory : NSObject, FlutterPlatformViewFactory
{
    public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return FlutterMapboxNavigationView(frame, viewId: viewId, args: args)
    }
    
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}

public class FlutterMapboxNavigationView : NSObject, FlutterPlatformView
{
    let frame: CGRect
    let viewId: Int64
    let arguments: NSDictionary?
    
    init(_ frame: CGRect, viewId: Int64, args: Any?)
    {
        self.frame = frame
        self.viewId = viewId
        self.arguments = args as? NSDictionary
    }
    
    public func view() -> UIView
    {
        let zero = UIView(frame: CGRect.zero)
        
        guard let oName = self.arguments?["originName"] as? String else {return zero}
        guard let oLatitude = self.arguments?["originLatitude"] as? Double else {return zero}
        guard let oLongitude = self.arguments?["originLongitude"] as? Double else {return zero}
        
        guard let dName = self.arguments?["destinationName"] as? String else {return zero}
        guard let dLatitude = self.arguments?["destinationLatitude"] as? Double else {return zero}
        guard let dLongitude = self.arguments?["destinationLongitude"] as? Double else {return zero}
        
        let language = arguments?["language"] as? String
        let units = arguments?["units"] as? String
        
        let origin = Location(name: oName, latitude: oLatitude, longitude: oLongitude)
        let destination = Location(name: dName, latitude: dLatitude, longitude: dLongitude)
        let o = Waypoint(coordinate: CLLocationCoordinate2D(latitude: origin.latitude!, longitude: origin.longitude!), name: origin.name)
        let d = Waypoint(coordinate: CLLocationCoordinate2D(latitude: destination.latitude!, longitude: destination.longitude!), name: destination.name)
        
        let options = NavigationRouteOptions(waypoints: [o, d])
        if(units != nil)
        {
            options.distanceMeasurementSystem = units == "imperial" ? .imperial : .metric
        }
        
        if(language != nil)
        {
            options.locale = Locale(identifier: language!)
        }
        var navView = UIView(frame: frame)
        Directions.shared.calculate(options) { (sessions, result) in
            
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let response):
                guard let route = response.routes?.first else { return }
                let viewController = NavigationViewController(for: route, routeOptions: options)
                navView = viewController.view
                viewController.navigationService.start()

            }
            
        }
        return navView
    }
    
}

public class RouteOptionsViewController : UIViewController, MGLMapViewDelegate
{
    var mapView: NavigationMapView!
    var routeOptions: NavigationRouteOptions?
    var route: Route?
    var routes: [Route]!
    
    init(routes: [Route], options: NavigationRouteOptions)
    {
        self.routes = routes
        self.routeOptions = options
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.routes = nil
        self.routeOptions = nil
    }
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView = NavigationMapView(frame: view.bounds)
        view.addSubview(mapView)
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(.follow, animated: true, completionHandler: nil)
        
        // Add a gesture recognizer to the map view
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(didLongPress(_:)))
        mapView.addGestureRecognizer(longPress)
        
        /*
        drawRoute(route: routes.first!)
        mapView.showWaypoints(on: routes.first!)
        if let annotation = mapView.annotations?.first as? MGLPointAnnotation
        {
            annotation.title = "Start Navigation"
            mapView.selectAnnotation(annotation, animated: true, completionHandler: nil)
        }
         */
    }
    
    // long press to select a destination
    @objc func didLongPress(_ sender: UILongPressGestureRecognizer){
        guard sender.state == .began else {
            return
        }
        
        let point = sender.location(in: mapView)
        let coordinate = mapView.convert(point, toCoordinateFrom: mapView)
        
        //create a basic point annotation and add it to the map
        let annotation = MGLPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Start Navigation"
        
        if let annotations = mapView.annotations
        {
            mapView.removeAnnotations(annotations)
        }

        mapView.addAnnotation(annotation)
        
        // Calculate the route from the user's location to the set destination
        calculateRoute(from: (mapView.userLocation!.coordinate), to: annotation.coordinate) { (route, error) in
            if error != nil {
                print("Error calculating route")
            }
        }
    }
    
    // Calculate route to be used for navigation
    func calculateRoute(from origin: CLLocationCoordinate2D,
                        to destination: CLLocationCoordinate2D,
                        completion: @escaping (Route?, Error?) -> ()) {

        // Coordinate accuracy is how close the route must come to the waypoint in order to be considered viable. It is measured in meters. A negative value indicates that the route is viable regardless of how far the route is from the waypoint.
        let origin = Waypoint(coordinate: origin, coordinateAccuracy: -1, name: "Start")
        let destination = Waypoint(coordinate: destination, coordinateAccuracy: -1, name: "Finish")

        // Specify that the route is intended for automobiles avoiding traffic
        let routeOptions = NavigationRouteOptions(waypoints: [origin, destination], profileIdentifier: .automobileAvoidingTraffic)

        // Generate the route object and draw it on the map
        _ = Directions.shared.calculate(routeOptions) { [weak self] (session, result) in
            guard case let .success(response) = result, let route = response.routes?.first, let strongSelf = self else {
                return
            }
            strongSelf.route = route
            strongSelf.routeOptions = routeOptions
            // Draw the route on the map after creating it
            strongSelf.drawRoute(route: route)
        }
    }
    
    func drawRoute(route: Route)
    {
        guard  let routeShape = route.shape, routeShape.coordinates.count > 0 else {
            return
        }
        
        //convert the coordinates into a polyline
        var routeCoordinates = routeShape.coordinates
        let polyline = MGLPolylineFeature(coordinates: &routeCoordinates, count: UInt(routeCoordinates.count))
        
        //if there is already a route line on the map, reset its shape to the new route
        if let source = mapView.style?.source(withIdentifier: "route-source") as? MGLShapeSource
        {
            source.shape = polyline
        }
        else
        {
            let source = MGLShapeSource(identifier: "route-source", features: [polyline], options: nil)
            
            // customize the route line color and width
            let lineStyle = MGLLineStyleLayer(identifier: "route-style", source: source)
            lineStyle.lineColor = NSExpression(forConstantValue: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
            lineStyle.lineWidth = NSExpression(forConstantValue: 3)
            mapView.style?.addSource(source)
            mapView.style?.addLayer(lineStyle)
        }
    }
    
    public func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }
    
    public func mapView(_ mapView: MGLMapView, tapOnCalloutFor annotation: MGLAnnotation) {
        guard let route = route, let routeOptions = routeOptions else{
            return
        }
        let navigationViewController = NavigationViewController(for: route, routeOptions: routeOptions)
        navigationViewController.modalPresentationStyle = .fullScreen
        self.present(navigationViewController, animated: true, completion: nil)
    }
}
