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
    var description: [WeatherDescription]?
    var temperature: WeatherTemperature?
    var sunInfo: WeatherSunInfo?
    var cityName: String?

    enum CodingKeys: String, CodingKey {
        case description = "weather"
        case temperature = "main"
        case sunInfo = "sys"
        case cityName = "name"
    }
}

extension Weather {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        description = try values.decode([WeatherDescription].self, forKey: .description)
        temperature = try values.decode(WeatherTemperature.self, forKey: .temperature)
        sunInfo = try values.decode(WeatherSunInfo.self, forKey: .sunInfo)
        cityName = try values.decode(String.self, forKey: .cityName)
    }
}
