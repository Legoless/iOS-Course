//
//  ViewController.swift
//  Converter
//
//  Created by Dal Rupnik on 21/10/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    let usdRate = 1.14
    let jpyRate = 136.12
    let gbpRate = 0.71
    let rubRate = 70.51
    
    var currentCurrency = Currency(type: "USD", rate: 1.14)
    var converter = Converter.instance
    
    lazy var locationManager : CLLocationManager = {
        let manager = CLLocationManager()
        
        manager.delegate = self
        
        return manager
    }()
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var usdButton: UIButton!
    @IBOutlet weak var jpyButton: UIButton!
    
    @IBOutlet weak var autoButton: UIButton!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        autoButton.selected = true
    }
    
    @IBAction func usdButtonTap(sender: UIButton) {
        currentCurrency = Currency(type: "USD", rate: usdRate)
        
        usdButton.selected = true
        jpyButton.selected = false
        autoButton.selected = false;
    }
    
    @IBAction func jpyButtonTap(sender: UIButton) {
        currentCurrency = Currency(type: "JPY", rate: jpyRate)
        
        usdButton.selected = false
        jpyButton.selected = true
        autoButton.selected = false;
    }

    @IBAction func autoButtonTap(sender: UIButton) {
        usdButton.selected = false
        jpyButton.selected = false
        autoButton.selected = true;
    }
    
    @IBAction func convertButtonTap(sender: UIButton) {
        
        if autoButton.selected {
            valueFromLocation()
        }
        else {
            convertValue()
        }
    }

    func convertValue () {
        if let value = Double(textField.text!) {
            let (converted, _) = value.convert(Currency(), to: currentCurrency)
            
            resultLabel.text = "In \(currentCurrency.type): \(converted)"
            resultLabel.textColor = UIColor.blackColor()
        }
        else {
            resultLabel.text = "Error: Enter valid value!"
            resultLabel.textColor = UIColor.redColor()
        }
    }
    
    func valueFromLocation () {
        if CLLocationManager.authorizationStatus() == .NotDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        else if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        if status == .AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            resultLabel.text = ""
            resultLabel.textColor = UIColor.blackColor()
            
            locationLabel.text = "Lat: \(location.coordinate.latitude) Long: \(location.coordinate.longitude)"
            manager.stopUpdatingLocation()
            
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemark, error) -> Void in
                
                print ("\(placemark?.first?.ISOcountryCode)")
                
                if placemark?.first?.ISOcountryCode == "GB" {
                    self.currentCurrency = Currency(type: "GBP", rate: self.gbpRate)
                }
                else if placemark?.first?.ISOcountryCode == "JP" {
                    self.currentCurrency = Currency(type: "JPY", rate: self.jpyRate)
                }
                else if placemark?.first?.ISOcountryCode == "RU" {
                    self.currentCurrency = Currency(type: "RUB", rate: self.rubRate)
                }
                else {
                    self.currentCurrency = Currency(type: "USD", rate: self.usdRate)
                }
                
                self.convertValue()
            })
        }
    }

    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        //resultLabel.text = error.description
        //resultLabel.textColor = UIColor.redColor()
    }
    
}

