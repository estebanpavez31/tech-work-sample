//
//  Constants.swift
//  DaresayAssignment
//
//  Created by Esteban Pavez on 2020-02-11.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import Foundation

struct Constants {

    /// API Key to call the OpenWeather service
    static let openWeatherAPIKey = "62fc4256-8f8c-11e5-8994-feff819cdc9f"

    struct Services {
        // Max time out that will take to call the services in seconds
        static var timeOut = Double(15)
        // HTTP status code of a successful call
        static var statusCodeSuccess = 200
    }
}
