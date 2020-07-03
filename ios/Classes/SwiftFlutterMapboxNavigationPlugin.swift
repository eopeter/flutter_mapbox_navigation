import Flutter
import UIKit
import Mapbox
import MapboxDirections
import MapboxCoreNavigation
import MapboxNavigation

public class SwiftFlutterMapboxNavigationPlugin: NSObject, FlutterPlugin, FlutterStreamHandler, NavigationViewControllerDelegate {
    
    var _navigationViewController: NavigationViewController? = nil
    var _eventSink: FlutterEventSink? = nil
    
    var _distanceRemaining: Double?
    var _durationRemaining: Double?
    var _navigationMode: String?
    var _routes: [Route]?
    var _waypoints: [Waypoint]?
    var _options: NavigationRouteOptions?
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_mapbox_navigation", binaryMessenger: registrar.messenger())
        let eventChannel = FlutterEventChannel(name: "flutter_mapbox_navigation/arrival", binaryMessenger: registrar.messenger())
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
            
            let oMode = arguments?["mode"] as? String ?? "drivingWithTraffic"
            _navigationMode = oMode
            
            let origin = Location(name: oName, latitude: oLatitude, longitude: oLongitude)
            let destination = Location(name: dName, latitude: dLatitude, longitude: dLongitude)
            
            startNavigation(origin: origin, destination: destination, language: language, units: voiceUnits, flutterResult: result)
        }
        
        result("iOS " + UIDevice.current.systemVersion)
    }
    
    func startNavigation(routeIdentifier: String, flutterResult: @escaping FlutterResult)
    {
        guard let route = self._routes?.first(where: { $0.routeIdentifier == routeIdentifier}) else {return}
        startNavigation(route: route, options: self._options!)
    }
    
    func startNavigation(origin: Location, destination: Location, language: String?, units: String?, simulationMode: Bool = false, flutterResult: @escaping FlutterResult)
    {
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
        
        let o = Waypoint(coordinate: CLLocationCoordinate2D(latitude: origin.latitude, longitude: origin.longitude), name: origin.name)
        let d = Waypoint(coordinate: CLLocationCoordinate2D(latitude: destination.latitude, longitude: destination.longitude), name: destination.name)
        
        let options = NavigationRouteOptions(waypoints: [o, d], profileIdentifier: mode)
        
        if(units != nil)
        {
            options.distanceMeasurementSystem = units == "imperial" ? .imperial : .metric
        }
        
        if(language != nil)
        {
            options.locale = Locale(identifier: language!)
        }
        
        Directions.shared.calculate(options) { [weak self](session, result) in
            switch result {
            case .failure(let error):
                flutterResult(error.localizedDescription)
            case .success(let response):
                guard let routes = response.routes, let strongSelf = self else { return }
                //if more than one route found, give user option to select one
                /*if(routes.count > 1)
                {
                   //show map to select a specific route
                    strongSelf._routes = routes
                    strongSelf._options = options
                    let routeOptionsView = RouteOptionsViewController(routes: routes, options: options);
                    
                    let flutterViewController = UIApplication.shared.delegate?.window??.rootViewController as! FlutterViewController
                    flutterViewController.present(routeOptionsView, animated: true, completion: nil)
                }
                else
                {
                    strongSelf.startNavigation(route: routes.first!, options: options)
                }*/
                strongSelf.startNavigation(route: routes.first!, options: options)
            }
        }
        
    }
    
    func startNavigation(route: Route, options: NavigationRouteOptions)
    {
        if(self._navigationViewController == nil)
        {
            self._navigationViewController = NavigationViewController(for: route, routeOptions: options)
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
            let arrived = progress.isFinalLeg && progress.currentLegProgress.userHasArrivedAtWaypoint
            _eventSink!(arrived)
            
        }
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

public class Location
{
    let name: String
    let latitude: Double
    let longitude: Double
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
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
        self.arguments = args as? NSDictionary;
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
        let o = Waypoint(coordinate: CLLocationCoordinate2D(latitude: origin.latitude, longitude: origin.longitude), name: origin.name)
        let d = Waypoint(coordinate: CLLocationCoordinate2D(latitude: destination.latitude, longitude: destination.longitude), name: destination.name)
        
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
                let nav = NavigationViewController(for: route, routeOptions: options)
                navView = nav.view
                nav.navigationService.start()
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
        self.routes = routes;
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
