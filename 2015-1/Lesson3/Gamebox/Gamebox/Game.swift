//
//  Game.swift
//  Gamebox
//
//  Created by Dal Rupnik on 21/10/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import Foundation

class Game {
    var name : String
    var dateAdded : NSDate = NSDate()
    var dateModified : NSDate = NSDate()
    var priority : UInt
    var status : Status = .Wishlist
    
    init (name: String, priority: UInt = 0)
    {
        self.name = name
        self.priority = priority
    }
    
    func description () -> String {
        return "Game: \(name) status: \(status)"
    }
}