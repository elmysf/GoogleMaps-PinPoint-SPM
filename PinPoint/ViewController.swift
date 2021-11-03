//
//  ViewController.swift
//  PinPoint
//
//  Created by Sufiandy Elmy on 15/10/21.
//

import UIKit
import Firebase
import FirebaseRemoteConfig
import GooglePlaces
import GoogleMaps


class ViewController: UIViewController,CLLocationManagerDelegate,GMSMapViewDelegate{
    
//    @IBOutlet weak var searchBar: UISearchBar!
//    @IBOutlet weak var centerImageIcon: UIImageView!
//    @IBOutlet weak var googleMap: GMSMapView!
    @IBOutlet weak var rcLabel: UILabel!
//    var currentLocation:CLLocationCoordinate2D!
//    var finalPositionAfterDragging:CLLocationCoordinate2D?
//    var locationMarker:GMSMarker!
//
//    lazy var locationManager: CLLocationManager = {
//        var _locationManager = CLLocationManager()
//        _locationManager.delegate = self
//        _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//        _locationManager.activityType = .automotiveNavigation
//        _locationManager.distanceFilter = 10.0
//        return _locationManager
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRemoteConfigDefaults()
        displayNewValues()
        fetchRemoteConfig()
//        googleMap.delegate = self
//        centerImageIcon.layer.zPosition = 1
//        searchBar.layer.zPosition  = 1
//        isAuthorizedtoGetUserLocation()
        
    }
    
    func setupRemoteConfigDefaults() {
        let defaultValue = ["label_text":"Hello world!" as NSObject]
        remoteConfig.setDefaults(defaultValue)
    }
    func fetchRemoteConfig(){
        remoteConfig.fetch(withExpirationDuration: 0) { [unowned self] (status, error) in
            guard error == nil else { return }
            //            print(“Got the value from Remote Config!”)
            remoteConfig.activate()
            self.displayNewValues()
        }}
    
    func displayNewValues(){
        let newLabelText = remoteConfig.configValue(forKey:"label_text").stringValue ?? ""
        rcLabel.text = newLabelText
    }
    
//    func isAuthorizedtoGetUserLocation() {
//        locationManager.requestAlwaysAuthorization()
//        locationManager.startUpdatingLocation()
//        if (CLLocationManager.locationServicesEnabled()) {
//            locationManager.requestWhenInUseAuthorization()
//        }
//    }
//
//    /**
//     * Called repeatedly during any animations or gestures on the map (or once, if the camera is
//     * explicitly set). This may not be called for all intermediate camera positions. It is always
//     * called for the final position of an animation or gesture.
//     */
//    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
//        print("didchange")
//
//        //called everytime
//        wrapperFunctionToShowPosition(mapView: mapView)
//    }
//
//    /**
//     * Called when the map becomes idle, after any outstanding gestures or animations have completed (or
//     * after the camera has been explicitly set).
//     */
//    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
//        print("idleAt")
//
//        //called when the map is idle
//        wrapperFunctionToShowPosition(mapView: mapView)
//
//    }
//
//
//    func wrapperFunctionToShowPosition(mapView:GMSMapView){
//        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        mapView.setMinZoom(14, maxZoom: 20)
//        mapView.setNeedsDisplay()
//        mapView.settings.compassButton = true
//        mapView.settings.scrollGestures = true
//        mapView.settings.zoomGestures = true
//        mapView.settings.rotateGestures = true
//        mapView.settings.tiltGestures = true
//        mapView.isIndoorEnabled = false
//        mapView.isMyLocationEnabled = true
//        mapView.settings.myLocationButton = true
//        mapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 20)
//
//        let geocoder = GMSGeocoder()
//        let latitute = mapView.camera.target.latitude
//        let longitude = mapView.camera.target.longitude
//        let position = CLLocationCoordinate2DMake(latitute, longitude)
//        geocoder.reverseGeocodeCoordinate(position) { response , error in
//            if error != nil {
//                print("GMSReverseGeocode Error: \(String(describing: error?.localizedDescription))")
//            }else {
//                let result = response?.results()?.first
//                let address = result?.lines?.reduce("") { $0 == "" ? $1 : $0 + ", " + $1 }
//                                self.searchBar.text = address
//            }
//        }
//    }
//
//
//    //this method is called by the framework on  locationManager.requestLocation();
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print("didupdate location")
//        let userLocation:CLLocation = locations[0] as CLLocation
//        self.currentLocation = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude,longitude: userLocation.coordinate.longitude)
//        let camera = GMSCameraPosition.camera(withLatitude: self.currentLocation.latitude, longitude:currentLocation.longitude, zoom: 20)
//        let position = CLLocationCoordinate2D(latitude:  currentLocation.latitude, longitude: currentLocation.longitude)
//        self.setupLocationMarker(coordinate: position)
//        self.googleMap.camera = camera
//        self.googleMap?.animate(to: camera)
//        manager.stopUpdatingLocation()
//    }
//
//
//    func setupLocationMarker(coordinate: CLLocationCoordinate2D) {
//        print("setup location")
//        if locationMarker != nil {
//            locationMarker.map = nil
//        }
//        locationMarker = GMSMarker(position: coordinate)
//        locationMarker.map = googleMap
//        locationMarker.appearAnimation =  .pop
//        locationMarker.icon = GMSMarker.markerImage(with: UIColor.blue)
//        locationMarker.opacity = 0.75
//        locationMarker.isFlat = true
//    }
    
}



