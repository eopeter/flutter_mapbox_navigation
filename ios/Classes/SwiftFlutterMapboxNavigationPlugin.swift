import Flutter
import UIKit
import MapboxDirections
import MapboxCoreNavigation
import MapboxNavigation

public class SwiftFlutterMapboxNavigationPlugin: NSObject, FlutterPlugin, FlutterStreamHandler, NavigationViewControllerDelegate {
    
    var _navigationViewController: NavigationViewController? = nil
    var _eventSink: FlutterEventSink? = nil
    
    var _distanceRemaining: Double?
    var _durationRemaining: Double?
    var _navigationMode: String?
    
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

        startNavigation(origin: origin, destination: destination, language: language, units: voiceUnits)
    }
    
    result("iOS " + UIDevice.current.systemVersion)
  }

    func startNavigation(origin: Location, destination: Location, language: String?, units: String?, simulationMode: Bool = false)
  {
    var mode: MBDirectionsProfileIdentifier = .automobileAvoidingTraffic

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
    
    Directions.shared.calculate(options) { (waypoints, routes, error) in
        guard let route = routes?.first else { return }
        
        if(self._navigationViewController == nil)
        {
            self._navigationViewController = NavigationViewController(for: route)
            self._navigationViewController!.delegate = self
            self._navigationViewController!.mapView?.localizeLabels()
        }
        
        let flutterViewController = UIApplication.shared.delegate?.window??.rootViewController as! FlutterViewController
        flutterViewController.present(self._navigationViewController!, animated: true, completion: nil)
    }
    
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
        Directions.shared.calculate(options) { (waypoints, routes, error) in
            guard let route = routes?.first else { return }
            
            let nav = NavigationViewController(for: route)
            navView = nav.view
            nav.navigationService.start()
            
        }
        return navView
    }
    
}
