//
//  ViewController.swift
//  DaresayAssignment
//
//  Created by Esteban Pavez on 2020-02-10.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if LocationManagerUtil.checkLocationServices(viewController: self) {
            // esta bien
            print("esta bien")
        } else {
            // esta mal
        }
    }

}

extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        let locValue: CLLocationCoordinate2D = location.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        LocationManagerUtil.locationManager.delegate = nil

        
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        LocationManagerUtil.checkLocationAuthorization()
    }
}
