//
//  CurrentWeatherViewController.swift
//  Sky
//
//  Created by Vassily on 2018/7/3.
//  Copyright © 2018年 Mars. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: WeatherViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    weak var delegate: CurrentWeatherViewControllerDelegate?
    
    var viewModel: CurrentWeatherViewModel? {
        didSet {
            DispatchQueue.main.async { self.updateView() }
        }
    }
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        delegate?.locationButtonPressed(controller: self)
    }
    
    @IBAction func settingsButtonPressed(_ sender: UIButton) {
        delegate?.settingsButtonPressed(controller: self)
    }
    
    private func updateView() {
        activityIndicatorView.stopAnimating()
        
        if let viewModel = self.viewModel, viewModel.updateIsReady {
            updateWeatherContainer(with: viewModel)
        } else {
            loadingFailedLabel.text = "Cannot load fetch weather/location data from the network."
            loadingFailedLabel.isHidden = false
        }
    }
    
    private func updateWeatherContainer(with vm: CurrentWeatherViewModel) {
        weatherContainerView.isHidden = false
        
        // 1. Set location
        locationLabel.text = vm.location.name
        
        // 2. Format and set temperature
        temperatureLabel.text = vm.temperature
        
        // 3. Set weather icon
        weatherIcon.image = vm.weahterIcon
        
        // 4. Format and set humidity
        humidityLabel.text = vm.humidity
        
        // 5. Set weather summary
        summaryLabel.text = vm.summary
        
        // 6. Format and set datetime
        dateLabel.text = vm.date
    }
}
