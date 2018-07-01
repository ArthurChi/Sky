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
    let longtitude: Double
    let currently: CurrentWeatherData
    
    struct CurrentWeatherData: Codable {
        let time: Date
        let summary: String
        let icon: String
        let temperature: Double
        let humidity: Double
    }
}
