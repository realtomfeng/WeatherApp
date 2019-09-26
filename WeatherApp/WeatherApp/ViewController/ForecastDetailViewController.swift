//
//  ForecastDetailViewController.swift
//  WeatherApp
//
//  Created by Thomas Feng on 9/25/19.
//  Copyright © 2019 Thomas Feng. All rights reserved.
//

import Foundation
import UIKit

class ForecastDetailViewController: UIViewController {
    
    
    @IBOutlet var temp: UILabel!
    @IBOutlet var summary: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var date: UILabel!
    
    var forecast: Forecast!
    
    override func viewDidLoad() {
        temp.text = String(forecast.temperatureHigh)
        summary.text = forecast.summary
        image.image = forecast.image
        date.text = forecast.date
    }
    
    
}
