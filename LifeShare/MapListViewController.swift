//
//  MapListViewController.swift
//  Buzzed
//
//  Created by Jack Carlson on 11/10/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import MapKit
import UIKit

class MapListViewController : UIViewController {

    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let theSpan:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let location = CLLocationCoordinate2DMake(30.267, -97.7375)
        let startRegian:MKCoordinateRegion = MKCoordinateRegionMake(location, theSpan)
        
        mapView.setRegion(startRegian, animated: true)
        
        let numBars = data.getCount()
        
        var i = 0
        while i < numBars {
            /*
            
            //Shakespeares
            let l1 = CLLocationCoordinate2DMake(30.267388, -97.739778)
            let a1 = MKPointAnnotation()
            a1.coordinate = l1
            a1.title = "Shakespeare's"
            a1.subtitle = "2$ Margs"
            mainMap.addAnnotation(a1)
            
            */
            var thisBar = data.getBar(i)
            var loc = CLLocationCoordinate2DMake(thisBar.lat, thisBar.long)
            let ann = MKPointAnnotation()
            ann.coordinate = loc
            ann.title = thisBar.name
            let numDeals = data.deals.count
            ann.subtitle = "\(numDeals) deals"
            mapView.addAnnotation(ann)
            i++
        }
        
        
    }
    
}