//
//  WeatherData.swift
//  Sky
//
//  Created by Vassily on 2018/7/1.
//  Copyright © 2018年 Mars. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    
    let latitude: Double
    let longitude: Double
    let currently: CurrentWeatherData
    
    struct CurrentWeatherData: Codable {
        let time: Date
        let summary: String
        let icon: String
        let temperature: Double
        let humidity: Double
    }
}

extension WeatherData.CurrentWeatherData: Equatable {
    
    public static func == (lhs: WeatherData.CurrentWeatherData, rhs: WeatherData.CurrentWeatherData) -> Bool {
        return lhs.time == rhs.time && lhs.summary == rhs.summary && lhs.icon == rhs.icon && lhs.temperature == rhs.temperature && lhs.humidity == rhs.humidity
    }
}

extension WeatherData: Equatable {
    
    public static func == (lhs: WeatherData, rhs: WeatherData) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude && lhs.currently == rhs.currently
    }
}
