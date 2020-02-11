//
//  GetWeather.swift
//  DaresayAssignment
//
//  Services class to obtain the data of the weather from OpenWeather
//
//  Created by Esteban Pavez on 2020-02-11.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import UIKit
import CoreLocation

typealias ServiceResponse = (Data?, NSError?) -> Void

class GetWeather: NSObject, URLSessionDelegate {
    static let sharedInstance = GetWeather()

    /// Call the service via a HTTP GET request and get the json with the data of the weather
    /// - Parameter onCompletion: Weather object with its data
    func getWeather(_ currentLocation: CLLocationCoordinate2D, onCompletion: @escaping (Weather?) -> Void) {
        let baseURL = URLServices.urlOpenWeather

        var urlComponents = URLComponents(string: baseURL)!

        // Mapping request
        urlComponents.queryItems = [
            URLQueryItem(name: "lat", value: String(currentLocation.latitude)),
            URLQueryItem(name: "lon", value: String(currentLocation.longitude)),
            URLQueryItem(name: "key", value: Constants.openWeatherAPIKey)
        ]

        // Do service call via HTTP Get request
        UtilServices.makeHTTPGetRequest(self, urlComponents: urlComponents,
                                        onCompletion: { data, _ in
                                            onCompletion(self.parsingJSON(data: data))
        })
    }

    /// Parse JSON obtained from service call to transform it to a Weather Object
    /// - Parameter data: Data with json response
    func parsingJSON(data: Data?) -> Weather? {
        guard data != nil else {
            return nil
        }

        let decoder = JSONDecoder()

        do {
            let weather = try decoder.decode(Weather.self, from: data ?? Data())

            Logger.log("Parsing Weather Succeded")

            return weather
        } catch {
            Logger.log("Parsing Weather Failed")
            Logger.log(error.localizedDescription)

            return nil
        }
    }
}
