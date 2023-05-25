//
//  FreeDriveViewController.swift
//  flutter_mapbox_navigation
//
//  Created by Emmanuel Oche on 5/25/23.
//

import UIKit
import MapboxNavigation
import MapboxCoreNavigation
import MapboxMaps

public class FreeDriveViewController : UIViewController {
    
    private lazy var navigationMapView = NavigationMapView(frame: view.bounds)
    private let passiveLocationManager = PassiveLocationManager()
    private lazy var passiveLocationProvider = PassiveLocationProvider(locationManager: passiveLocationManager)
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationMapView()
        let locationProvider: LocationProvider = passiveLocationProvider
        navigationMapView.mapView.location.overrideLocationProvider(with: locationProvider)
        passiveLocationProvider.startUpdatingLocation()
    }
    
    private func setupNavigationMapView() {
        navigationMapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        navigationMapView.userLocationStyle = .puck2D()
        
        let navigationViewportDataSource = NavigationViewportDataSource(navigationMapView.mapView)
        navigationViewportDataSource.options.followingCameraOptions.zoomUpdatesAllowed = false
        navigationViewportDataSource.followingMobileCamera.zoom = 17.0
        navigationMapView.navigationCamera.viewportDataSource = navigationViewportDataSource
        
        view.addSubview(navigationMapView)
    }
    
}
