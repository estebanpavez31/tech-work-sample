//
//  WeatherTemperature.swift
//  DaresayAssignment
//
//  Weather temperature model with the different temperature info
//
//  Created by Esteban Pavez on 2020-02-11.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import Foundation

struct WeatherTemperature: Decodable {
    var temp: Double?
    var tempMin: Double?
    var tempMax: Double?
}
