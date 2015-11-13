//
//  ViewController.swift
//  MyWeather
//
//  Created by Dal Rupnik on 08/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var weatherIconView: WeatherIconView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityLabelCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var temperatureLabelBottomConstraint: NSLayoutConstraint!
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        cityLabel.backgroundColor = UIColor.redColor()
        //cityLabel.layer.cornerRadius = C40.0
        
        weatherIconView.alpha = 0
        weatherIconView.backgroundColor = UIColor.yellowColor()
        weatherIconView.layer.cornerRadius = 40.0
        weatherIconView.layer.borderWidth = 2.0
        weatherIconView.layer.borderColor = UIColor.blueColor().CGColor
        
        cityLabelCenterConstraint.constant = -300.0
        temperatureLabelBottomConstraint.constant = 600.0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        weatherIconView.iconType = .Sunny
        
        UIView.animateWithDuration(2.0) {
            self.weatherIconView.alpha = 1.0
            self.cityLabelCenterConstraint.constant = 0
            self.temperatureLabelBottomConstraint.constant = 20.0
            self.view.layoutIfNeeded()
        }
    }
}

