//
//  Currency.swift
//  Converter
//
//  Created by Dal Rupnik on 21/10/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import Foundation

func ==(lhs: Currency, rhs: Currency) -> Bool {
    return lhs.rate == rhs.rate && lhs.type == rhs.type
}

class Currency : Equatable {
    var type: String
    var rate: Double
    
    init ()
    {
        type = "EUR"
        rate = 1.0
    }
    
    init (type: String, rate: Double)
    {
        self.type = type
        self.rate = rate
    }
}