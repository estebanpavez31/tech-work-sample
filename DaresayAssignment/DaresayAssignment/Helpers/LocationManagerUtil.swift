//
//  LocationManagerUtil.swift
//  DaresayAssignment
//
//  Created by Esteban Pavez on 2020-02-10.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import UIKit
import CoreLocation

class LocationManagerUtil {
    static let locationManager = CLLocationManager()

    static func checkLocationServices(viewController: UIViewController) -> Bool {
        if CLLocationManager.locationServicesEnabled() {
            LocationManagerUtil.setupLocationManager(viewController: viewController)
            LocationManagerUtil.checkLocationAuthorization()
            return true
        } else {
            return false
        }
    }

    static func setupLocationManager(viewController: UIViewController) {
        locationManager.delegate = viewController as? CLLocationManagerDelegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

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
