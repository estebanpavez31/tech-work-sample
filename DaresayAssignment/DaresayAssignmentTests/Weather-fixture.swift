//
//  Weather-fixture.swift
//  DaresayAssignmentTests
//
//  Fixture for unit testing weather model view
//
//  Created by Esteban Pavez on 2020-02-11.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import Foundation
import XCTest

@testable import DaresayAssignment

extension Weather {

    static func fixture(description: [WeatherDescription] = FixtureConstants.Weather.description,
                        temperature: WeatherTemperature = FixtureConstants.Weather.temperature,
                        sunInfo: WeatherSunInfo = FixtureConstants.Weather.sunInfo,
                        cityName: String = FixtureConstants.Weather.cityName) -> Weather {

        return Weather(description: description,
                       temperature: temperature,
                       sunInfo: sunInfo,
                       cityName: cityName)
    }
}
