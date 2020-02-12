//
//  WeatherSunInfo.swift
//  DaresayAssignment
//
//  Weather model with the information related to the sun
//
//  Created by Esteban Pavez on 2020-02-11.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import Foundation

struct WeatherSunInfo: Decodable {
    var sunrise: Int?
    var sunset: Int?
}
