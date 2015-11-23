//
//  DoubleExtension.swift
//  Photos
//
//  Created by Dal Rupnik on 22/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import Foundation
import UIKit

extension Double {
    
    var radians : Double {
        get {
            return self * M_PI / 180.0
        }
    }
    
    var degrees : Double {
        get {
            return self * 180.0 / M_PI
        }
    }
}