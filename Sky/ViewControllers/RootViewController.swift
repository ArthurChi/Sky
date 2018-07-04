//
//  ViewController.swift
//  Sky
//
//  Created by Vassily on 2018/7/3.
//  Copyright © 2018年 Mars. All rights reserved.
//

import UIKit
import CoreLocation

class RootViewController: UIViewController {
    
    private var currentViewController: CurrentWeatherViewController!
    private let segueCurrentWeather = "SegueCurrentWeather"
    
    private lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.distanceFilter = 1000
        manager.desiredAccuracy = 1000
        
        return manager
    }()
    
    private var currentLocation: CLLocation? {
        didSet {
            fetchCity()
            fetchWeather()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case segueCurrentWeather:
            guard let destination = segue.destination as? CurrentWeatherViewController else { fatalError() }
            
            currentViewController = destination
            currentViewController.delegate = self
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupActiveNotification()
    }
    
    private func setupActiveNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(becomeActive(_:)), name: .UIApplicationDidBecomeActive, object: nil)
    }
    
    @objc private func becomeActive(_ notification: Notification) {
        requestLocation()
    }
    
    private func requestLocation() {
        locationManager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            locationManager.requestLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    private func fetchCity() {
        guard let currentLocation = self.currentLocation else { return }
        
        CLGeocoder().reverseGeocodeLocation(currentLocation) { (placeMarks, error) in
            if let error = error {
                dump(error)
            } else if let city = placeMarks?.first?.locality {
                self.currentViewController.location = Location(name: city, latitude: currentLocation.coordinate.latitude, longtitude: currentLocation.coordinate.longitude)
            }
        }
    }
    
    private func fetchWeather() {
        guard let currentLocation = self.currentLocation else { return }
        
        let lat = currentLocation.coordinate.latitude
        let lon = currentLocation.coordinate.longitude
        
        WeatherDataManager.shared.weatherData(at: lat, longitude: lon) { (weatherData, error) in
            if let error = error {
                dump(error)
            } else if let weatherData = weatherData {
                self.currentViewController.weatherData = weatherData
            }
        }
    }
}

extension RootViewController: CurrentWeatherViewControllerDelegate {
    func locationButtonPressed(controller: CurrentWeatherViewController) {
        
    }
    
    func settingsButtonPressed(controller: CurrentWeatherViewController) {
        
    }
}

extension RootViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first {
            currentLocation = location
            
            locationManager.delegate = nil
            locationManager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        dump(error)
    }
}
