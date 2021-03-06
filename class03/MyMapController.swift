//
//  MyMapController.swift
//  class03
//
//  Created by L20102 on 2019/6/3.
//  Copyright © 2019 L20102-02. All rights reserved.
//

import UIKit

import MapKit
import CoreLocation

class MyMapController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var locationManager : CLLocationManager!
    
    let regionRadius : CLLocationDistance = 10000
    
    
    @IBOutlet weak var MyMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()

        if(CLLocationManager.locationServicesEnabled()){
            locationManager.startUpdatingLocation()
        }
        
        
        MyMapView.delegate = self
        MyMapView.showsUserLocation=true
        
        // Do any additional setup after loading the view.
    }
    
    
    func locationmanager(_ manager: CLLocationManager, didupatelocations locations: [CLLocation]) {
        
        let loc : CLLocation = locations[0] as CLLocation
        
        DispatchQueue.main.async {
            self.centerLocation(location: loc)
        }
        
    }

    
    func centerLocation(location : CLLocation){
        
        let region = MKCoordinateRegion(center: location.coordinate,
                                        latitudinalMeters: regionRadius,
                                        longitudinalMeters: regionRadius)
        
        DispatchQueue.main.async {
         self.MyMapView.setRegion(region, animated: true)
        }
        
        
    }
    

}
