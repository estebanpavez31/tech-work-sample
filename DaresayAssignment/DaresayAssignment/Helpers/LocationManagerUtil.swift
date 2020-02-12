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
            LocationManagerUtil.checkLocationAuthorization(viewController: viewController)
        }
    }

    /// Makes the general setup for the location manager
    /// - Parameter viewController: View controller where to set the delegate
    static func setupLocationManager(viewController: UIViewController) {
        locationManager.delegate = viewController as? CLLocationManagerDelegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    /// Checks the authorization status for the location service
    static func checkLocationAuthorization(viewController: UIViewController) {
        switch CLLocationManager.authorizationStatus() {
            case .authorizedWhenInUse:
                locationManager.startUpdatingLocation()
                break
            case .denied:
                let alert = UIAlertController(title: NSLocalizedString("location_denied_title", comment: "loc denied title"),
                                              message: NSLocalizedString("location_denied_message", comment: "loc denied mess"),
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("ok_message", comment: "OK"), style: .default, handler: nil))
                viewController.present(alert, animated: true, completion: nil)
                break
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                let alert = UIAlertController(title: NSLocalizedString("location_restricted_title", comment: "loc restricted title"),
                                              message: NSLocalizedString("location_restricted_message", comment: "loc restricted mess"),
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("ok_message", comment: "OK"), style: .default, handler: nil))
                viewController.present(alert, animated: true, completion: nil)
                break
            case .authorizedAlways:
                break
            default:
                break
        }
    }
}
