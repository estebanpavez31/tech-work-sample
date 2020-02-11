//
//  LocationManagerUtil.swift
//  DaresayAssignment
//
//  Functions related with the current location of the user
//
//  Created by Esteban Pavez on 2020-02-10.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import UIKit
import CoreLocation

struct LocationManagerUtil {

    /// location manager where to obtain current location
    static let locationManager = CLLocationManager()

    /// Check the services related with the Location of the user
    /// - Parameter viewController: View controller where is required the checking
    static func checkLocationServices(viewController: UIViewController) {
        if CLLocationManager.locationServicesEnabled() {
            LocationManagerUtil.setupLocationManager(viewController: viewController)
            LocationManagerUtil.checkLocationAuthorization()
        } else {
            // show alert with problem of location
        }
    }

    /// Makes the general setup for the location manager
    /// - Parameter viewController: View controller where to set the delegate
    static func setupLocationManager(viewController: UIViewController) {
        locationManager.delegate = viewController as? CLLocationManagerDelegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }


    /// Checks the authorization status for the location service
    static func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
            case .authorizedWhenInUse:
                locationManager.startUpdatingLocation()
                break
            case .denied:
                // show alert to send it to preferences
                break
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                // show alert to say that location es restricted
                break
            case .authorizedAlways:
                break
            default:
                break
        }
    }

}
