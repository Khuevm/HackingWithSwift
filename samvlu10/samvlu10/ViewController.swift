//
//  ViewController.swift
//  samvlu10
//
//  Created by Khue on 19/07/2023.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    @IBOutlet weak var locationLabel: UILabel!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }

    @IBAction func locationButtonDidTap(_ sender: Any) {
        locationManager.requestLocation()
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        
        //Convert lat lon to get address
        let ceo = CLGeocoder()
        ceo.reverseGeocodeLocation(locations.first!) { placemark, error in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            if let pm = placemark?.first {
                let country = pm.country!
                let locality = pm.locality!
                
                self.locationLabel.text = "\(locality), \(country)"
                self.locationLabel.textColor = .black
            }
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
