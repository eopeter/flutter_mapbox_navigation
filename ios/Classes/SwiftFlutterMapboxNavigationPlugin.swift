import Flutter
import UIKit
import MapboxDirections
import MapboxCoreNavigation
import MapboxNavigation

public class SwiftFlutterMapboxNavigationPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_mapbox_navigation", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterMapboxNavigationPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    
    let viewFactory = FlutterMapboxNavigationViewFactory()
    registrar.register(viewFactory, withId: "FlutterMapboxNavigationView")
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    
    let arguments = call.arguments as? NSDictionary
    
    if(call.method == "getDirections")
    {
        guard let oName = arguments?["originName"] as? String else {return}
        guard let oLatitude = arguments?["originLatitude"] as? Double else {return}
        guard let oLongitude = arguments?["originLongitude"] as? Double else {return}
        
        guard let dName = arguments?["destinationName"] as? String else {return}
        guard let dLatitude = arguments?["destinationLatitude"] as? Double else {return}
        guard let dLongitude = arguments?["destinationLongitude"] as? Double else {return}
        
        let origin = Location(name: oName, latitude: oLatitude, longitude: oLongitude)
        let destination = Location(name: dName, latitude: dLatitude, longitude: dLongitude)

        Navigate(origin: origin, destination: destination)
    }
    
    result("iOS " + UIDevice.current.systemVersion)
  }

  func Navigate(origin: Location, destination: Location)
  {
    let o = Waypoint(coordinate: CLLocationCoordinate2D(latitude: origin.latitude, longitude: origin.longitude), name: origin.name)
    let d = Waypoint(coordinate: CLLocationCoordinate2D(latitude: destination.latitude, longitude: destination.longitude), name: destination.name)

    let options = NavigationRouteOptions(waypoints: [o, d])

    Directions.shared.calculate(options) { (waypoints, routes, error) in
        guard let route = routes?.first else { return }

        let viewController = NavigationViewController(for: route)
        
        let flutterViewController = UIApplication.shared.delegate?.window??.rootViewController as! FlutterViewController
        flutterViewController.present(viewController, animated: true, completion: nil)
    }
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
        
        let origin = Location(name: oName, latitude: oLatitude, longitude: oLongitude)
        let destination = Location(name: dName, latitude: dLatitude, longitude: dLongitude)
        let o = Waypoint(coordinate: CLLocationCoordinate2D(latitude: origin.latitude, longitude: origin.longitude), name: origin.name)
        let d = Waypoint(coordinate: CLLocationCoordinate2D(latitude: destination.latitude, longitude: destination.longitude), name: destination.name)
        
        let options = NavigationRouteOptions(waypoints: [o, d])
        var navView = UIView(frame: frame)
        Directions.shared.calculate(options) { (waypoints, routes, error) in
            guard let route = routes?.first else { return }
            
            let nav = NavigationViewController(for: route)
            navView = nav.view!
            
        }
        return navView
    }
    
}
