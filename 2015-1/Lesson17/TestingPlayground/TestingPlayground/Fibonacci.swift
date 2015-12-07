//
//  Fibonacci.swift
//  TestingPlayground
//
//  Created by Dal Rupnik on 07/12/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import Foundation

class Mathematic : NSObject {
    class func fibonacci(number: UInt) -> UInt {
        var f1 : UInt = 0
        var f2 : UInt = 1
        var num : UInt = 0
        
        for var i : UInt = 1; i <= number; i++ {
            num = f1 + f2
            f2 = f1
            f1 = num
        }
        
        sleep (1)
        
        return num
    }
    
    class func fibonacciRecursive(number: UInt) -> UInt {
        if number == 1 || number == 2 {
            return 1
        }
        
        return fibonacciRecursive(number - 2) + fibonacciRecursive(number - 1)
    }
}
