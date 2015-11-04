//
//  DoubleConversion.swift
//  Converter
//
//  Created by Dal Rupnik on 26/10/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import Foundation

extension Double {
    
    func convert(from: Currency, to: Currency) -> (Double, Double) {
        return Converter.instance.convert(self, startCurrency: from, targetCurrency: to)
    }
}