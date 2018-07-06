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
    
}

extension WeekWeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
}
