//
//  ViewController.swift
//  DaresayAssignment
//
//  View controller of the main scene of the application with the weather information
//
//  Created by Esteban Pavez on 2020-02-10.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {

    /// Current location object with the latitude and longitude data
    var currentLocation: CLLocationCoordinate2D!

    override func viewDidLoad() {
        super.viewDidLoad()

        LocationManagerUtil.checkLocationServices(viewController: self)
    }


    /// Call the service to get the info of the weather
    func getCurrentLocation() {
        GetWeather.sharedInstance.getWeather(currentLocation) { weather in
            print(weather)
        }
    }

}

extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        currentLocation = location.coordinate

        /// Sets delegate to nil to only call once this function
        LocationManagerUtil.locationManager.delegate = nil

        /// Once the location is obtained, the service is called with the latitude and longitude
        getCurrentLocation()
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        LocationManagerUtil.checkLocationAuthorization()
    }
}
