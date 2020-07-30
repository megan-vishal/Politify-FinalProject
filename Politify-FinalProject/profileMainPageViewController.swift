//
//  profileMainPageViewController.swift
//  Politify-FinalProject
//
//  Created by Apple on 7/29/20.
//  Copyright © 2020 Megan Vishal. All rights reserved.
//

import UIKit
import MapKit

//Created droppin for supposed home in San Jose
class housePin: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var homeTitle: String?
    var homeSubtitle: String?
    
    init(pinHomeTitle: String, pinHomeSubtitle: String, homeLocation: CLLocationCoordinate2D) {
        self.homeTitle = pinHomeTitle
        self.homeSubtitle = pinHomeSubtitle
        self.coordinate = homeLocation
    }
}

//Created droppin for nearest voting center
class votePin: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var votingTitle: String?
    var votingSubtitle: String?
    
    init(pinVotingTitle: String, pinVotingSubtitle: String, votingLocation: CLLocationCoordinate2D) {
        self.votingTitle = pinVotingTitle
        self.votingSubtitle = pinVotingSubtitle
        self.coordinate = votingLocation
    }
}

//Keep the blue tab DESELECTED
class profileMainPageViewController: UIViewController {

    @IBOutlet weak var mapLocation: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Coordinates are in some park
        let homeLocation = CLLocationCoordinate2D(latitude: 37.258557 , longitude: -121.931890)
        let votingLocation = CLLocationCoordinate2D(latitude: 37.288643, longitude: -121.944167)
        let centerLocation = CLLocationCoordinate2DMake(37.258557 , -121.931890)
        let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let mapRegion = MKCoordinateRegion(center: centerLocation, span: mapSpan)
        self.mapLocation.setRegion(mapRegion, animated: true)
        
        let homePin = housePin(pinHomeTitle: "Home", pinHomeSubtitle: "San Jose, California", homeLocation: homeLocation)
        self.mapLocation.addAnnotation(homePin)
        
        let votingPin = votePin(pinVotingTitle: "Campbell City Hall", pinVotingSubtitle: "70 North First Street, Campbell, CA", votingLocation: votingLocation)
        self.mapLocation.addAnnotation(votingPin)
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
