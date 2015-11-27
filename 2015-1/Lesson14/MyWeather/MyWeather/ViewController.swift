//
//  ViewController.swift
//  MyWeather
//
//  Created by Dal Rupnik on 08/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

let APIKey = ""

class ViewController: UIViewController, WeatherDataDelegate {
    @IBOutlet weak var weatherIconView: WeatherIconView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityLabelCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var temperatureLabelBottomConstraint: NSLayoutConstraint!
    
    var timer : NSTimer?
    
    var location = "Ljubljana" {
        didSet {
            self.cityLabel.text = location.capitalizedString
        }
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: "refresh", userInfo: nil, repeats: true)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //cityLabel.backgroundColor = UIColor.redColor()
        //cityLabel.layer.cornerRadius = C40.0
        
        /*
        weatherIconView.alpha = 0
        weatherIconView.backgroundColor = UIColor.yellowColor()
        weatherIconView.layer.cornerRadius = 40.0
        weatherIconView.layer.borderWidth = 2.0
        weatherIconView.layer.borderColor = UIColor.blueColor().CGColor*/
        
        //cityLabelCenterConstraint.constant = -300.0
        //temperatureLabelBottomConstraint.constant = 600.0
        
        refresh()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //weatherIconView.iconType = .Sunny
        
        /*UIView.animateWithDuration(2.0) {
            self.weatherIconView.alpha = 1.0
            self.cityLabelCenterConstraint.constant = 0
            self.temperatureLabelBottomConstraint.constant = 20.0
            self.view.layoutIfNeeded()
        }*/
    }
    
    func weatherDataDidFinish(weatherDataViewController: WeatherDataViewController) {
        if let location = weatherDataViewController.location {
            self.location = location
        }
        
        refresh()
        
        weatherDataViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationVC = segue.destinationViewController as? WeatherDataViewController {
            destinationVC.delegate = self
        }
    }

    func refresh () {
        
        let request = NSMutableURLRequest()
        request.URL = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?units=metric&appid=" + APIKey + "&q=" + location.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.alphanumericCharacterSet())!)!
        request.HTTPMethod = "GET"
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            if error != nil || data == nil {
                return
            }
            
            do {
                let JSON = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(rawValue: 0)) as! [String : AnyObject]
                
                let weather = JSON["main"]!
                
                let description = JSON["weather"]![0]["description"] as! String
                
                var icon : WeatherIcon = .Sunny
                
                if description.containsString("cloud") {
                    icon = .Cloudy
                }
                else if description.containsString("fog") {
                    icon = .Fog
                }
                else if description.containsString("drizzle") {
                    icon = .Showers
                }
                else if description.containsString("rain") {
                    icon = .Rain
                }
                else if description.containsString("snow") {
                    icon = .Sunny
                }
                else if description.containsString("thunder") {
                    icon = .Thunder
                }
                
                let temperature = weather as! [String : AnyObject]
                
                if let temp = temperature["temp"] as? NSNumber {
                    dispatch_async(dispatch_get_main_queue(), {
                        self.weatherIconView.iconType = icon
                        self.temperatureLabel.text = NSString.localizedStringWithFormat("%.2f°", temp.floatValue) as String
                    })

                }
                
            }
            catch {
                
            }
        }
        
        task.resume()
    }
}

