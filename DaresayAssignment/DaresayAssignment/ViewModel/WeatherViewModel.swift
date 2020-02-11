//
//  WeatherViewModel.swift
//  DaresayAssignment
//
//  View Model to fill the UI of the Weather View Controller
//
//  Created by Esteban Pavez on 2020-02-11.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import UIKit

struct WeatherViewModel {
    var cityName: String!
    var imageWeather: UIImage!
    var currentTemperature: String!
    var weatherDescription: String!
    var minimumTemp: String!
    var maximumTemp: String!
    var sunriseTime: String!
    var sunsetTime: String!

    init(weather: Weather) {
        cityName = weather.cityName ?? ""
        setGeneralData(weather: weather)
        setTemperatureData(weather: weather)
        setSunData(weather: weather)
    }

    /// Sets the data related to the image and the description of the weather
    /// - Parameter weather: Weather object with the info obtained of the service
    mutating func setGeneralData(weather: Weather) {
        if weather.description != nil && !weather.description!.isEmpty {
            let weatherDescriptionData = weather.description![0]

            weatherDescription = weatherDescriptionData.description

            if let icon = weatherDescriptionData.icon {
                let urlImageDefault = Constants.URL.imageWeather.replacingOccurrences(of: "{imageId}", with: icon)
                let imageURL = URL(string: urlImageDefault) ?? URL(fileURLWithPath: "")

                // Set image from URL
                let imageData = try? Data(contentsOf: imageURL)
                if let imageData = imageData {
                    imageWeather = UIImage(data: imageData) ?? UIImage()
                } else {
                    imageWeather = UIImage()
                }
            }
        }
    }

    /// Set the temperature data of the weather in the current location
    /// - Parameter weather: Weather object with the info obtained of the service
    mutating func setTemperatureData(weather: Weather) {
        if let temperature = weather.temperature {
            if let currentTemp = temperature.currentTemperature,
                let minTemp = temperature.minTemperature,
                let maxTemp = temperature.maxTemperature {

                currentTemperature = String(Int(currentTemp)) + NSLocalizedString("celcius_temp", comment: "celcius degrees")
                minimumTemp = NSLocalizedString("min_temp", comment: "minimum temp") +
                    String(Int(minTemp)) + NSLocalizedString("celcius_temp", comment: "celcius degrees")
                maximumTemp = NSLocalizedString("max_temp", comment: "maximum temp") +
                    String(Int(maxTemp)) + NSLocalizedString("celcius_temp", comment: "celcius degrees")
            }
        }
    }


    /// Set the data related with the sun in the current location
    /// - Parameter weather: Weather object with the info obtained of the service
    mutating func setSunData(weather: Weather) {
        if let sunInfo = weather.sunInfo {
            if let sunrise = sunInfo.sunrise, let sunset = sunInfo.sunset {
                let dateSunrise = Date(timeIntervalSince1970: TimeInterval(sunrise))
                let dateSunset = Date(timeIntervalSince1970: TimeInterval(sunset))

                let formatter = DateFormatter()
                formatter.dateFormat = "HH:mm"

                let sunriseFormatted = formatter.string(from: dateSunrise)
                let sunsetFormatted = formatter.string(from: dateSunset)

                sunriseTime = sunriseFormatted
                sunsetTime = sunsetFormatted
            }
        }
    }

}
