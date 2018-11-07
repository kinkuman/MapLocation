//
//  ViewController.swift
//  MapLocation
//
//  Created by user on 2018/11/07.
//  Copyright © 2018年 user. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    
    
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 権限確認
        locationManager.requestWhenInUseAuthorization()
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        locationManager.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 位置変わった
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let lat = mapView.region.center.latitude
        let lon = mapView.region.center.longitude
        
        latitudeLabel.text = "緯度:\(lat)"
        longitudeLabel.text = "経度:\(lon)"
    }
    
    // 権限変わった
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways,.authorizedWhenInUse:
//            locationManager.startUpdatingLocation()
            mapView.setUserTrackingMode(.follow, animated: true)
        default:
//            locationManager.stopUpdatingLocation()
            mapView.setUserTrackingMode(.none, animated: true)
        }
    }
}

