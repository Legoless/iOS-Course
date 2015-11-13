//
//  WeatherIconView.swift
//  MyWeather
//
//  Created by Dal Rupnik on 11/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

enum WeatherIcon : String
{
    case Cloudy         = "cloudy"
    case Fog            = "fog"
    case Frost          = "frost"
    case Rain           = "rain"
    case Showers        = "showers"
    case Snowy          = "snowy"
    case SunRain        = "sun-rain"
    case PartlyCloudy   = "sunny-cloudy"
    case Sunny          = "sunny"
    case Thunder        = "thunder"
}

class WeatherIconView: UIView {
    
    var iconType : WeatherIcon = .Sunny {
        didSet {
            imageView.image = UIImage(named: iconType.rawValue)
        }
    }
    
    private var imageView : UIImageView

    override init(frame: CGRect) {
        imageView = UIImageView(frame: frame)
        imageView.image = UIImage(named: WeatherIcon.Sunny.rawValue)
        
        super.init(frame: frame)
        
        addSubview(imageView)
        //insertSubview(imageView, atIndex: 0)
        
        //bringSubviewToFront(imageView)
    }

    required init?(coder aDecoder: NSCoder) {
        imageView = UIImageView(coder: aDecoder)!
        imageView.image = UIImage(named: WeatherIcon.Sunny.rawValue)
        
        super.init(coder: aDecoder)
        
        addSubview(imageView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = self.bounds
    }
}
