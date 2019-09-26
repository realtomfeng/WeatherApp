//
//  Forecast.swift
//  WeatherApp
//
//  Created by Thomas Feng on 9/24/19.
//  Copyright © 2019 Thomas Feng. All rights reserved.
//

import Foundation
import UIKit

struct DarkSkyData: Codable {
    var currently: currentForecast
    var daily: DailyForecasts
}

struct DailyForecasts: Codable {
    var summary: String
    var data: [Forecast]
}

struct currentForecast: Codable {
    var time: Int
    var summary: String
    var temperature: Double
}

struct Forecast: Codable {
    var time: Int
    var date: String {
        return Int.getDateText(time)
    }
    var summary: String
    var temperatureHigh: Double
    var temperatureLow: Double
    var icon: String
    var image: UIImage {
        switch icon {
        case "cloudy-day":
            return UIImage(named: "clouds")!
        case "partly-cloudy-day":
            return UIImage(named: "cloudy")!
        case "rain":
            return UIImage(named: "rain")!
        case "snow":
            return UIImage(named: "snow")!
        case "clear-day":
            return UIImage(named: "sun")!
        default:
            return UIImage(named: "sun")!
        }
    }
}
