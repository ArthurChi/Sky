//
//  WeekWeatherViewController.swift
//  Sky
//
//  Created by Vassily on 2018/7/5.
//  Copyright © 2018年 Mars. All rights reserved.
//

import UIKit

final class WeekWeatherViewController: WeatherViewController {
    
    @IBOutlet weak var weekWeatherTableView: UITableView!
    
    var viewModel: WeekWeatherViewModel? {
        didSet {
            DispatchQueue.main.async { self.updateView() }
        }
    }
    
    func updateView() {
        activityIndicatorView.stopAnimating()
        
        if let _ = viewModel {
            updateWeatherDataContainer()
            
        } else {
            loadingFailedLabel.isHidden = false
            loadingFailedLabel.text = "Load Location/Weather failed!"
        }
    }
    
    func updateWeatherDataContainer() {
        weatherContainerView.isHidden = false
        weekWeatherTableView.reloadData()
    }
}

extension WeekWeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfDays ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeekWeatherTableViewCell.reuseIdentifier, for: indexPath) as? WeekWeatherTableViewCell else {
            fatalError()
        }
        
        if let vm = viewModel {
            cell.date.text = vm.date(for: indexPath.row)
            cell.humid.text = vm.humidity(for: indexPath.row)
            cell.temperature.text = vm.temperature(for: indexPath.row)
            cell.week.text = vm.week(for: indexPath.row)
            cell.weatherIcon.image = vm.weatherIcon(for: indexPath.row)
        }
        
        return cell
    }
}
