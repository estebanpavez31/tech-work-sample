//
//  Weather.swift
//  DaresayAssignment
//
//  Weather model with all the data required to set it in the screen
//
//  Created by Esteban Pavez on 2020-02-11.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    var weather: [WeatherDescription]?
    var main: WeatherTemperature?
    var sys: WeatherSunInfo?
}
