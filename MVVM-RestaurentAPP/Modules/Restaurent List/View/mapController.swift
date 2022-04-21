//
//  mapController.swift
//  MVVM-RestaurentAPP
//
//  Created by arshad on 4/21/22.
//

import UIKit
import CoreLocation
import MapKit

class mapController: UIViewController {
    @IBOutlet weak var map: MKMapView!
    
    var logitute:String = ""
    var latitde:String = ""
    var locationManager = CLLocationManager()
    
    var geocoding = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.setupManager()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        geoCoding()
    }
}


extension mapController:CLLocationManagerDelegate{
    
    
    func setupManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location  = locations.first{
            locationManager.stopUpdatingLocation()
            render(location)
        }
    }
    
    func render(_ location:CLLocation){
        
        let coordinate = CLLocationCoordinate2D(latitude: Double(latitde) ?? 0 , longitude:Double(logitute) ?? 0)
        let span = MKCoordinateSpan(latitudeDelta:0.01, longitudeDelta:0.01)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        map.setRegion(region, animated: true)
        let pin = MKPointAnnotation()
        //let view = MKAnnotationView()
        pin.coordinate = coordinate
        map.addAnnotation(pin)
    }
}


extension mapController{
    
    func geoCoding(){
        let coordinate = CLLocation(latitude: Double(latitde) ?? 0 , longitude:Double(logitute) ?? 0)
        geocoding.reverseGeocodeLocation(coordinate) { place, err in
            self.getdetails(place,err)
        }
    }
    func getdetails( _ placemark:[CLPlacemark]?, _ error: Error?){
        
        if error != nil{
            print("unknow Error")
        }
        if let placemark = placemark ,let placemark = placemark.first {
            print(placemark.country!)
        }
    }
}
