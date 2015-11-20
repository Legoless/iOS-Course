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
    var notes : String?
    
    init (name: String, priority: UInt = 0)
    {
        self.name = name
        self.priority = priority
    }
    
    init (dictionary: [String : AnyObject]) {
        self.name = dictionary["name"] as! String
        self.priority = dictionary["priority"] as! UInt
        self.dateAdded = dictionary["added"] as! NSDate
        self.dateModified = dictionary["modified"] as! NSDate
        self.status = Status(rawValue: (dictionary["status"] as! UInt))!
        
        if let notes = dictionary["notes"] as? String {
            self.notes = notes
        }
        
    }
    
    func description () -> String {
        return "Game: \(name) status: \(status)"
    }
    
    func toDictionary () -> [String : AnyObject] {
        var data = ["name" : self.name, "modified" : self.dateModified, "added" : self.dateAdded, "priority" : self.priority, "status" : self.status.rawValue ]
        
        if self.notes != nil {
            data["notes"] = self.notes!
        }
        
        return data
    }
}