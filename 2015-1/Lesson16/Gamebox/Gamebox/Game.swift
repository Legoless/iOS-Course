//
//  Game.swift
//  Gamebox
//
//  Created by Dal Rupnik on 02/12/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import Foundation
import CoreData


class Game: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    var status : Status {
        get {
            if let statusValue = statusValue {
                return Status(rawValue: UInt(statusValue.intValue))!
            } else {
                return Status.Wishlist
            }
        }
        set(newValue) {
            self.statusValue = NSNumber(unsignedLong: newValue.rawValue)
        }
    }
}
