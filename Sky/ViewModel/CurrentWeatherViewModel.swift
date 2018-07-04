//
//  CurrentWeatherViewModel.swift
//  Sky
//
//  Created by Vassily on 2018/7/4.
//  Copyright © 2018年 Mars. All rights reserved.
//

import Foundation

struct CurrentWeatherViewModel {
    let location: Location
    let weather: WeatherData
    
    var city: String {
        return location.name
    }
    
    var temperature: String {
        return String(
            format: "%.1f °C",
            weather.currently.temperature.toCelcius())
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
}
