//
//  ViewController.swift
//  Sky
//
//  Created by Mars on 28/09/2017.
//  Copyright © 2017 Mars. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var weatherContainerView: UIView!
    @IBOutlet weak var loadingFailedLabel: UILabel!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        
        activityIndicatorView.startAnimating()
        activityIndicatorView.hidesWhenStopped = true
        
        weatherContainerView.isHidden = true
        loadingFailedLabel.isHidden = true
    }
    
    func weatherIcon(of name: String) -> UIImage? {
        switch name {
        case "clear-day":
            return UIImage(named: "clear-day")
        case "clear-night":
            return UIImage(named: "clear-night")
        case "rain":
            return UIImage(named: "rain")
        case "snow":
            return UIImage(named: "snow")
        case "sleet":
            return UIImage(named: "sleet")
        case "wind":
            return UIImage(named: "wind")
        case "cloudy":
            return UIImage(named: "cloudy")
        case "partly-cloudy-day":
            return UIImage(named: "partly-cloudy-day")
        case "partly-cloudy-night":
            return UIImage(named: "partly-cloudy-night")
        default:
            return UIImage(named: "clear-day")
        }
    }
}

