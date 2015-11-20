//
//  Car.swift
//  MyGarage
//
//  Created by Dal Rupnik on 16/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

class Car: NSObject {
    var brand : String
    var model : String
    
    var topSpeed = 130.0
    
    init(brand: String, model: String, topSpeed: Double) {
        self.brand = brand
        self.model = model
        self.topSpeed = topSpeed
    }
}
