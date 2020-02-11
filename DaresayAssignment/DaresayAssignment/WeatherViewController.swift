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

    @IBOutlet weak var lblCityName: UILabel!
    @IBOutlet weak var imgWeather: UIImageView!
    @IBOutlet weak var lblCurrentTemperature: UILabel!
    @IBOutlet weak var lblWeatherDescription: UILabel!
    @IBOutlet weak var lblMinTemp: UILabel!
    @IBOutlet weak var lblMaxTemp: UILabel!
    @IBOutlet weak var lblSunriseTime: UILabel!
    @IBOutlet weak var lblSunsetTime: UILabel!

    /// Current location object with the latitude and longitude data
    var currentLocation: CLLocationCoordinate2D!
    var weatherViewModel: WeatherViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        LocationManagerUtil.checkLocationServices(viewController: self)
    }

    /// Call the service to get the info of the weather
    func getCurrentLocation() {
        GetWeather.sharedInstance.getWeather(currentLocation) { weatherObj in
            guard let weather = weatherObj else { return }
            self.weatherViewModel = WeatherViewModel(weather: weather)
            self.fillUI()
        }
    }

    func fillUI() {
        lblCityName.text = weatherViewModel.cityName
        imgWeather.image = weatherViewModel.imageWeather
        lblCurrentTemperature.text = weatherViewModel.currentTemperature
        lblWeatherDescription.text = weatherViewModel.weatherDescription
        lblMinTemp.text = weatherViewModel.minimumTemp
        lblMaxTemp.text = weatherViewModel.maximumTemp
        lblSunriseTime.text = weatherViewModel.sunriseTime
        lblSunsetTime.text = weatherViewModel.sunsetTime
    }

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
        LocationManagerUtil.checkLocationAuthorization()
    }
}
