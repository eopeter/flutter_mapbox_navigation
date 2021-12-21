import Flutter
import UIKit
import MapboxMaps
import MapboxDirections
import MapboxCoreNavigation
import MapboxNavigation

public class RouteOptionsViewController : UIViewController, NavigationMapViewDelegate
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
        ///mapView.showsUserLocation = true
        ///mapView.setUserTrackingMode(.follow, animated: true, completionHandler: nil)

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

//        let point = sender.location(in: mapView)
//        let coordinate = mapView.convert(point, toCoordinateFrom: mapView)
//
//        //create a basic point annotation and add it to the map
//        let annotation = MGLPointAnnotation()
//        annotation.coordinate = coordinate
//        annotation.title = "Start Navigation"
//
//        if let annotations = mapView.annotations
//        {
//            mapView.removeAnnotations(annotations)
//        }
//
//        mapView.addAnnotation(annotation)
//
//        // Calculate the route from the user's location to the set destination
//        calculateRoute(from: (mapView.userLocation!.coordinate), to: annotation.coordinate) { (route, error) in
//            if error != nil {
//                print("Error calculating route")
//            }
//        }
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
//        guard  let routeShape = route.shape, routeShape.coordinates.count > 0 else {
//            return
//        }
//
//        //convert the coordinates into a polyline
//        var routeCoordinates = routeShape.coordinates
//        let polyline = MGLPolylineFeature(coordinates: &routeCoordinates, count: UInt(routeCoordinates.count))
//
//        //if there is already a route line on the map, reset its shape to the new route
//        if let source = mapView.style?.source(withIdentifier: "route-source") as? MGLShapeSource
//        {
//            source.shape = polyline
//        }
//        else
//        {
//            let source = MGLShapeSource(identifier: "route-source", features: [polyline], options: nil)
//
//            // customize the route line color and width
//            let lineStyle = MGLLineStyleLayer(identifier: "route-style", source: source)
//            lineStyle.lineColor = NSExpression(forConstantValue: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
//            lineStyle.lineWidth = NSExpression(forConstantValue: 3)
//            mapView.style?.addSource(source)
//            mapView.style?.addLayer(lineStyle)
//        }
    }


//    public func mapView(_ mapView: NavigationMapView, tapOnCalloutFor annotation: MGLAnnotation) {
//        guard let route = route, let routeOptions = routeOptions else{
//            return
//        }
//        let navigationViewController = NavigationViewController(for: route, routeIndex: 0, routeOptions: routeOptions)
//        navigationViewController.modalPresentationStyle = .fullScreen
//        self.present(navigationViewController, animated: true, completion: nil)
//    }
}