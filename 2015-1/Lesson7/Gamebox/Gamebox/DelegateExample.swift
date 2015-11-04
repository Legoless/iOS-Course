//
//  DelegateExample.swift
//  Gamebox
//
//  Created by Dal Rupnik on 29/10/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import Foundation


@objc protocol CarDriver : NSObjectProtocol {
    func turnOnEngine ()
    
    func driveCar (loop : Int)
    
    optional func turnOffEngine (engineType : UInt, time : NSDate?)
}

// Managira avto
class CarManager {
    
    var driver : Person = Person()
    lazy var passenger : Person = Person()
    
    var speedM : Double = 10000.0
    
    var speedKm : Double {
        get {
            return speedM / 1000.0
        }
    }
    
    var delegate : CarDriver?

    func runCar () {
        if let driver = delegate {
            driver.turnOnEngine()
            
            
            print("Speed: \(speedKm)")
            
            for var i = 0; i < 10; i++ {
                driver.driveCar(i)
            }
            
            if driver.respondsToSelector("turnOffEngine:time:") {
                driver.performSelector("turnOffEngine:time:", withObject: 0, withObject: NSDate())
            }
        }
    }
}

class Person : NSObject, CarDriver {
    func turnOnEngine() {
        print("TURN ON ENGINE")
    }
    
    func driveCar(loop: Int) {
        print ("DRIVING MY TESLA \(loop)x")
    }
    
}

func driverExample ()
{
    let carManager = CarManager()
    
    let person = Person()
    
    carManager.delegate = person
    
    carManager.runCar()
}
