//
//  WeatherDataViewController.swift
//  MyWeather
//
//  Created by Dal Rupnik on 25/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

protocol WeatherDataDelegate : NSObjectProtocol {
    func weatherDataDidFinish (weatherDataViewController : WeatherDataViewController)
}

class WeatherDataViewController : UIViewController {
    
    var location : String?
    
    weak var delegate : WeatherDataDelegate?
    
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBAction func cancelButtonTap(sender: AnyObject) {
        location = nil
        
        delegate?.weatherDataDidFinish(self)
    }
    
    @IBAction func confirmButtonTap(sender: AnyObject) {
        location = locationTextField.text
        
        delegate?.weatherDataDidFinish(self)
    }
}