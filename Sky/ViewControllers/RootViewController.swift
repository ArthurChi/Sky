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
    
    private lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.distanceFilter = 1000
        manager.desiredAccuracy = 1000
        
        return manager
    }()
    
    private var currentLocation: CLLocation?
    
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
