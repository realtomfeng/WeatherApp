//
//  Extensions.swift
//  WeatherApp
//
//  Created by Thomas Feng on 9/26/19.
//  Copyright © 2019 Thomas Feng. All rights reserved.
//

import Foundation

extension Int {
    static func getDateText(_ date: Int) -> String {
        let date = NSDate(timeIntervalSince1970: TimeInterval(date))
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MM dd"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")

        let currentDateString: String = dateFormatter.string(from: date as Date)
        return currentDateString
    }
}
