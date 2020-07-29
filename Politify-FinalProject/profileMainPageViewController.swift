//
//  profileMainPageViewController.swift
//  Politify-FinalProject
//
//  Created by Apple on 7/29/20.
//  Copyright © 2020 Megan Vishal. All rights reserved.
//

import UIKit
import MapKit

class profileMainPageViewController: UIViewController {

    @IBOutlet weak var mapLocation: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Coordinates are in some park
        var centerLocation = CLLocationCoordinate2DMake(37.258557 , -121.931890)
        var mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        var mapRegion = MKCoordinateRegion(center: centerLocation, span: mapSpan)
        self.mapLocation.setRegion(mapRegion, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
