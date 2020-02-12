//
//  WeatherDescription.swift
//  DaresayAssignment
//
//  Weather model with some general data of the weather
//
//  Created by Esteban Pavez on 2020-02-11.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import Foundation

struct WeatherDescription: Decodable {
    var description: String?
    var icon: String?
}
