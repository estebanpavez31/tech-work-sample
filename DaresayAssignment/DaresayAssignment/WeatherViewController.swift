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

    /// Top view with weather information
    @IBOutlet weak var viewTopWeather: UIView!
    /// Downer view with weather information
    @IBOutlet weak var viewDownWeather: UIView!
    /// Label with the name of the city of the current location
    @IBOutlet weak var lblCityName: UILabel!
    /// Image View with the current weather obtained from an external url
    @IBOutlet weak var imgWeather: UIImageView!
    /// Label with the current temperature in Celcius degrees
    @IBOutlet weak var lblCurrentTemperature: UILabel!
    /// Label with a description string of the current weather
    @IBOutlet weak var lblWeatherDescription: UILabel!
    /// Label with the minimum temperature of the current day
    @IBOutlet weak var lblMinTemp: UILabel!
    /// Label with the maximum temperature of the current day
    @IBOutlet weak var lblMaxTemp: UILabel!
    /// Label with the hour of the sunrise time of the current day
    @IBOutlet weak var lblSunriseTime: UILabel!
    /// Label with the hour of the sunset time of the current day
    @IBOutlet weak var lblSunsetTime: UILabel!
    /// Label with the current date formatted
    @IBOutlet weak var lblCurrentDate: UILabel!
    /// Activity indicator that it shows when the service is called
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    /// Current location object with the latitude and longitude data
    var currentLocation: CLLocationCoordinate2D!
    /// Weather view model to fill the UI of the controller
    var weatherViewModel: WeatherViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        LocationManagerUtil.checkLocationServices(viewController: self)
    }

    /// Call the service to get the info of the weather
    func getCurrentLocation() {

        if currentLocation != nil {

            activityIndicator.startAnimating()
            GetWeather.sharedInstance.getWeather(currentLocation) { weatherResponse in
                DispatchQueue.main.async {
                    guard let weather = weatherResponse else {
                        self.showAlertProblem()
                        return
                    }

                    self.weatherViewModel = WeatherViewModel(weather: weather)
                    self.fillUI()
                    self.showViews()
                }
            }
        } else {
            LocationManagerUtil.checkLocationServices(viewController: self)
        }
    }

    /// Function that assign every UI field in the scene
    func fillUI() {
        lblCityName.text = weatherViewModel.cityName
        imgWeather.image = weatherViewModel.imageWeather
        lblCurrentTemperature.text = weatherViewModel.currentTemperature
        lblWeatherDescription.text = weatherViewModel.weatherDescription
        lblMinTemp.text = weatherViewModel.minimumTemp
        lblMaxTemp.text = weatherViewModel.maximumTemp
        lblSunriseTime.text = weatherViewModel.sunriseTime
        lblSunsetTime.text = weatherViewModel.sunsetTime
        lblCurrentDate.text = weatherViewModel.currentDate
    }

    /// Show hidden views at the moment that the localization works and the service was called
    func showViews() {
        viewTopWeather.isHidden = false
        viewDownWeather.isHidden = false
        activityIndicator.stopAnimating()
    }

    /// Shows an alert indicating a problem with the weather service response
    func showAlertProblem() {
        activityIndicator.stopAnimating()
        let alert = UIAlertController(title: NSLocalizedString("location_error_title", comment: "loc error title"),
                                      message: NSLocalizedString("location_error_message", comment: "loc error mess"),
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("ok_message", comment: "OK"), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    /// Recall the services to get the weather information
    /// - Parameter sender: Button that makes the action
    @IBAction func refreshScreen(_ sender: Any) {
        getCurrentLocation()
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
        LocationManagerUtil.checkLocationAuthorization(viewController: self)
    }
}
