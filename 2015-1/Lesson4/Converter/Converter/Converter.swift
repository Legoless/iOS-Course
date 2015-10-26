//
//  Converter.swift
//  Converter
//
//  Created by Dal Rupnik on 21/10/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import Foundation

class Converter {
    
    static let instance = Converter()
    
    private init() {
        
    }
    
    func convert (value: Double, startCurrency: Currency, targetCurrency: Currency) -> (Double, Double)
    {
        return (value * startCurrency.rate * targetCurrency.rate, startCurrency.rate * targetCurrency.rate)
    }
}