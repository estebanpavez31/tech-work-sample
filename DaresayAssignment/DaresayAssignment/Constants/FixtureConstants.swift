//
//  FixtureConstants.swift
//  DaresayAssignment
//
//  Created by Esteban Pavez on 2020-02-11.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import Foundation

struct FixtureConstants {

    struct Weather {
        static let description = [WeatherDescription(description: "broken clouds", icon: "04n")]
        static let temperature = WeatherTemperature(currentTemperature: 4.46, minTemperature: 3, maxTemperature: 6.1100000000000003)
        static let sunInfo = WeatherSunInfo(sunrise: 1581404040, sunset: 1581436750)
        static var cityName = "Majorna"
    }
}
