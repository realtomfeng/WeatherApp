//
//  DarkSkyAPI.swift
//  WeatherApp
//
//  Created by Thomas Feng on 9/24/19.
//  Copyright © 2019 Thomas Feng. All rights reserved.
//

import Foundation

struct DarkSkyAPI {
    private static let forecastURLString = "https://api.darksky.net/forecast/"
    private static let apiKey = "920f43e9cc1fdaacaa8d30ac3cf42204"
    private static let coordinates = "42.3601,-71.0589"
    
    static func forecastURL() -> String {
        var url = forecastURLString
        url = url + apiKey + "/" + coordinates
        return url
    }
}

