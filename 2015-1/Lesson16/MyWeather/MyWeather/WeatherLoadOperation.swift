//
//  WeatherLoadOperation.swift
//  MyWeather
//
//  Created by Dal Rupnik on 29/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import Foundation
import Alamofire

let APIKey = ""

class WeatherLoadOperation: NSOperation {
    
    var location = ""
    
    // Called when completed with parsed temperature as double, parsed weather icon and any object JSON
    var completionHandler : ((Double, WeatherIcon, AnyObject) -> Void)?
    
    override func main () -> Void {
        
        Alamofire.request(.GET, "http://api.openweathermap.org/data/2.5/weather", parameters: ["units": "metric", "appid" : APIKey, "q" : location.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.alphanumericCharacterSet())! ])
            .responseJSON { response in
                
                let JSON = response.result.value as! [String : AnyObject]
                
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
                    
                    if let completionHandler = self.completionHandler {
                        completionHandler(temp.doubleValue, icon, weather)
                    }
                }
                
        }

    }
}
