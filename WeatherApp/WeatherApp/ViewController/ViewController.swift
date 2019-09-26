//
//  ViewController.swift
//  WeatherApp
//
//  Created by Thomas Feng on 9/24/19.
//  Copyright © 2019 Thomas Feng. All rights reserved.
//

import UIKit
import Log

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWeatherData()
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    let reuseIdentifier = "forecastCell"
    var forecasts = [Forecast]()
    let log = Logger()
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let forecast = forecasts[indexPath.item]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! WeatherCell
        cell.tempLabel.text = String(forecast.temperatureHigh)
        cell.imageView.image = forecast.image
        cell.date.text = forecast.date
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let cellDimension = screenWidth / 2.1
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
    func loadWeatherData() {
        WeatherStore.getForecast { (result) in
            switch result {
            case let .success(data):
//                self.log.trace(data.daily)
                self.forecasts = data.daily.data
                print(self.forecasts)
            case let .failure(error):
                self.log.trace(error)
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let forecastDetailViewController = segue.destination as! ForecastDetailViewController
        let indexPath = collectionView.indexPathsForSelectedItems?.first
        forecastDetailViewController.forecast = forecasts[indexPath!.item]
    }
}

