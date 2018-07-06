//
//  CurrentWeatherViewModel.swift
//  Sky
//
//  Created by Vassily on 2018/7/4.
//  Copyright © 2018年 Mars. All rights reserved.
//

import UIKit

struct CurrentWeatherViewModel {
    
    private var loactionIsReady = false
    private var weatherIsReady = false
    
    var location: Location! {
        didSet {
            self.loactionIsReady = location != nil
        }
    }
    
    
    var weather: WeatherData! {
        didSet {
            self.weatherIsReady = weather != nil
        }
    }
    
    var updateIsReady: Bool { return loactionIsReady && weatherIsReady }
    
    var city: String {
        return location.name
    }
    
    var temperature: String {
        return String(
            format: "%.1f °C",
            weather.currently.temperature.toCelsius())
    }
    
    var humidity: String {
        return String(
            format: "%.1f %%",
            weather.currently.humidity * 100)
    }
    
    var summary: String {
        return weather.currently.summary
    }
    
    var date: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, dd MMMM"
        
        return formatter.string(from: weather.currently.time)
    }
    
    var weahterIcon: UIImage? {
        return UIImage.weatherIcon(of: weather.currently.icon)
    }
}
