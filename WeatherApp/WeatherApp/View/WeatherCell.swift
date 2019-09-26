//
//  collectionViewCell.swift
//  WeatherApp
//
//  Created by Thomas Feng on 9/25/19.
//  Copyright © 2019 Thomas Feng. All rights reserved.
//

import Foundation
import UIKit

class WeatherCell: UICollectionViewCell {
    
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    var forecast: Forecast!
    
//    func viewDidLoad() {
//        tempLabel.text = String(forecast.temperatureHigh)
//        imageView.image = forecast.image
//    }
}
