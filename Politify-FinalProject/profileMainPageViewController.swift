//
//  profileMainPageViewController.swift
//  Politify-FinalProject
//
//  Created by Apple on 7/29/20.
//  Copyright © 2020 Megan Vishal. All rights reserved.
//

import UIKit
import MapKit

//Keep the blue tab DESELECTED
class profileMainPageViewController: UIViewController {

    @IBOutlet weak var mapLocation: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Coordinates are in some park
        let centerLocation = CLLocationCoordinate2DMake(37.258557 , -121.931890)
        let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let mapRegion = MKCoordinateRegion(center: centerLocation, span: mapSpan)
        self.mapLocation.setRegion(mapRegion, animated: true)
        
        createAnnotations(locations: annotationLocations)
        
    }
    
    //Drop Pin Info
    let annotationLocations = [
        //Coordinates are in some park
        ["title" : "Home", "subtitle" : "San Jose, CA", "latitude" : 37.258557, "longitude" : -121.931890],
        //Coordinates are the Campbell City Hall
        ["title" : "Nearest Voting Center: Campbell City Hall", "subtitle" : "70 North First Street, Campbell, CA", "latitude" : 37.288643, "longitude" : -121.944167]
    ]
    
    func createAnnotations(locations: [[String : Any]]) {
        for location in locations {
            let annotations = MKPointAnnotation()
            annotations.title = location["title"] as? String
            annotations.subtitle = location["subtitle"] as? String
            annotations.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)
            mapLocation.addAnnotation(annotations)
        }
    }
    

}

/*
 Old Code:
 
 //Created droppin for supposed home in San Jose
 class customPin: NSObject, MKAnnotation {
     
     var coordinate: CLLocationCoordinate2D
     var title: String?
     var subtitle: String?
     
     init(pinTitle: String, pinSubtitle: String, homeLocation: CLLocationCoordinate2D) {
         self.title = pinTitle
         self.subtitle = pinSubtitle
         self.coordinate = homeLocation
     }
 }

 //Created droppin for nearest voting center
 class customPinTwo: NSObject, MKAnnotation {

     var coordinate: CLLocationCoordinate2D
     var titleTwo: String?
     var subtitleTwo: String?

     init(pinTitleTwo: String, pinSubtitleTwo: String, votingLocation: CLLocationCoordinate2D) {
         self.titleTwo = pinTitleTwo
         self.subtitleTwo = pinSubtitleTwo
         self.coordinate = votingLocation
     }
 }
 
 
 //Coordinates are in some park
 let homeLocation = CLLocationCoordinate2D(latitude: 37.258557 , longitude: -121.931890)
 //Coordinates are the Campbell City Hall
 let votingLocation = CLLocationCoordinate2D(latitude: 37.288643, longitude: -121.944167)
 
 
 let pin = customPin(pinTitle: "Home", pinSubtitle: "San Jose, CA", homeLocation: homeLocation)
 self.mapLocation.addAnnotation(pin)
 
 let pinTwo = customPinTwo(pinTitleTwo: "Nearest Voting Center: Campbell City Hall", pinSubtitleTwo: "70 North First Street, Campbell, CA", votingLocation: votingLocation)
 self.mapLocation.addAnnotation(pinTwo)
 */
