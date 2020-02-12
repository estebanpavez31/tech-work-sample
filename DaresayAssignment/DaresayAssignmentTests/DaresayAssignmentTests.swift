//
//  DaresayAssignmentTests.swift
//  DaresayAssignmentTests
//
//  Created by Esteban Pavez on 2020-02-10.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import XCTest
@testable import DaresayAssignment

class DaresayAssignmentTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDescriptionWeatherViewModel() {
        let weather = Weather.fixture()
        let weatherViewModel = WeatherViewModel(weather: weather)

        // what is it that we want to test?
        XCTAssertEqual(weather.cityName, weatherViewModel.cityName)
        XCTAssertEqual(weather.description![0].description, weatherViewModel.weatherDescription)
    }

    func testSunInfoWeatherViewModel() {
        let weather = Weather.fixture()
        let weatherViewModel = WeatherViewModel(weather: weather)

        XCTAssertEqual(weatherViewModel.sunriseTime, "07:54")
        XCTAssertEqual(weatherViewModel.sunsetTime, "16:59")
    }

    func testTemperatureWeatherViewModel() {
        let weather = Weather.fixture()
        let weatherViewModel = WeatherViewModel(weather: weather)

        XCTAssertEqual(weatherViewModel.currentTemperature, "4 ºC")
        XCTAssertEqual(weatherViewModel.minimumTemp, "Min: 3 ºC")
        XCTAssertEqual(weatherViewModel.maximumTemp, "Max: 6 ºC")
    }

}
