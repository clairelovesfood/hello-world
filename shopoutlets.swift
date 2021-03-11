//
//  shopoutlets.swift
//  yasmine_claire
//
//  Created by Rasiya on 2/3/21.
//  Copyright © 2021 ite. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class shopoutlets: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate  {
    
    
    @IBAction func back(_ sender: UIButton) {
    }
    
    
    @IBOutlet var mapView: MKMapView!
    
    
    var shopID: Int?
    var latitude : Double = 0.0
    var longitude : Double = 0.0
    
    let lm = CLLocationManager()
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
        switch shopID {
        case 0:
            latitude =  1.3500
            longitude = 103.9500
        case 1:
            latitude = 1.3924
            longitude = 103.8954
        case 2:
            latitude = 1.4280
            longitude = 103.8364
        case 3:
            latitude = 1.3173
            longitude = 103.8437
            
        default:
            break
        }
        
        let anns = [MKPointAnnotation(), MKPointAnnotation()]
         anns[0].coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
         anns[0].title = listOfShops[shopID!]
         anns[0].subtitle = listOfArea[shopID!] // listOfArea[shopID]



         mapView.addAnnotations(anns)

         mapView.setCenter(anns[0].coordinate, animated: false)

        lm.requestWhenInUseAuthorization()
        lm.delegate = self
        lm.startUpdatingLocation()
    }
}
