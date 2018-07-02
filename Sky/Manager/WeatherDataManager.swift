//
//  WeatherDataManager.swift
//  Sky
//
//  Created by Vassily on 2018/7/1.
//  Copyright © 2018年 Mars. All rights reserved.
//

import Foundation

final class WeatherDataManager {
    
    typealias CompletionHandler = (WeatherData?, DataManagerError?) -> Void
    
    private var urlSession: URLSessionProtocol
    private let baseURL: URL
    
    internal init(baseURL: URL, urlSession: URLSessionProtocol) {
        self.baseURL = baseURL
        self.urlSession = urlSession
    }
    
    static let shared = WeatherDataManager(baseURL: API.authenticatedUrl, urlSession: URLSession.shared)
    
    func weatherData(at: Location, complete: @escaping CompletionHandler) {
        let url = baseURL.appendingPathComponent("\(at.latitude), \(at.longtitude)")
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        self.urlSession.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                self.finshRequest(data: data, response: response, error: error, complete: complete)
            }
        }.resume()
    }
    
    private func finshRequest(data: Data?, response: URLResponse?, error: Error?, complete: CompletionHandler) {
        if error != nil {
            complete(nil, .failedRequest)
        } else if let data = data, let response = response as? HTTPURLResponse {
            if response.statusCode == 200 {
                do {
                    let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                    complete(weatherData, nil)
                } catch {
                    complete(nil, .invalidResponse)
                }
            } else {
                complete(nil, .invalidResponse)
            }
        } else {
            complete(nil, .unknow)
        }
    }
}

enum DataManagerError: Error {
    case failedRequest
    case invalidResponse
    case unknow
}
