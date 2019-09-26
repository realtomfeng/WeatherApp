//
//  WeatherStore.swift
//  WeatherApp
//
//  Created by Thomas Feng on 9/24/19.
//  Copyright © 2019 Thomas Feng. All rights reserved.
//

import Foundation
import Alamofire
import Log

enum DarkSkyResult {
    case success(DarkSkyData)
    case failure(Error)
}
class WeatherStore {
    static let log = Logger()
    
    static func getForecast(completion: @escaping (DarkSkyResult) -> Void) {
        let url = DarkSkyAPI.forecastURL()
        log.trace(url)
        Alamofire.request(url).response { response in
            let result = self.processRequest(response: response)
            
            completion(result)
        }
    }
    
    static func processRequest(response: DefaultDataResponse) -> DarkSkyResult {
        guard let jsonData = response.data else {
            return .failure(response.error!)
        }
        return processData(fromJSON: jsonData)
    }
    
    static func processData(fromJSON data: Data) -> DarkSkyResult {
        let decoder = JSONDecoder()
        do {
            let darkSkyData = try decoder.decode(DarkSkyData.self, from: data)
            return .success(darkSkyData)
        } catch {
            return .failure(error)
        }
    }
}
