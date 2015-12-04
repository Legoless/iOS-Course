//
//  Game.swift
//  Gamebox
//
//  Created by Dal Rupnik on 21/10/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import Foundation
import UIKit

struct GameConstants {
    static var formatter : NSDateFormatter {
        let format = NSDateFormatter()
        format.dateStyle = .FullStyle
        
        return format
    }
}

class GameLegacy {
    var name : String
    var dateAdded : NSDate = NSDate()
    var dateModified : NSDate = NSDate()
    var priority : UInt
    var status : Status = .Wishlist
    var notes : String?
    
    var imagePath : String?
    
    var image : UIImage?
    
    init (name: String, priority: UInt = 0)
    {
        self.name = name
        self.priority = priority
    }
    
    init (dictionary: [String : AnyObject]) {
        self.name = dictionary["name"] as! String
        self.priority = dictionary["priority"] as! UInt
        self.dateAdded = GameConstants.formatter.dateFromString(dictionary["added"] as! String)!
        self.dateModified = GameConstants.formatter.dateFromString(dictionary["modified"] as! String)!
        self.status = Status(rawValue: (dictionary["status"] as! UInt))!
        
        if let notes = dictionary["notes"] as? String {
            self.notes = notes
        }
        
        if let imagePath = dictionary["imagePath"] as? String {
            self.imagePath = imagePath
            
            self.image = UIImage(contentsOfFile: pathForFileName(imagePath))
        }
    }
    
    func description () -> String {
        return "Game: \(name) status: \(status)"
    }
    
    func toDictionary () -> [String : AnyObject] {
        var data : [String : AnyObject] = ["name" : self.name, "modified" : GameConstants.formatter.stringFromDate(self.dateModified), "added" : GameConstants.formatter.stringFromDate(self.dateAdded), "priority" : self.priority, "status" : self.status.rawValue ]
        
        if self.notes != nil {
            data["notes"] = self.notes!
        }
        
        // If we have an image, but no image path, store image and generate image path
        
        if self.image != nil && self.imagePath == nil {
            
            self.imagePath = self.generateImageName()
            
            print ("SAVING FILE: " + self.imagePath!)
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) {
                let imageData = NSData(data: UIImagePNGRepresentation(self.image!)!)
                
                imageData.writeToFile(self.pathForFileName(self.imagePath!), atomically: true)
            }
        }
        
        if self.imagePath != nil {
            data["imagePath"] = self.imagePath!
        }
        
        return data
    }
    
    func generateImageName () -> String {
        
        let randomImage = String(randomNumber(UINT32_MAX))
        
        return randomImage + ".png"
    }
    
    func randomNumber (max: UInt32) -> Int {
        return Int(arc4random_uniform(max) + 1)
    }
    
    func pathForFileName (name: String) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let docs: String = paths[0]
        
        return NSString(string: docs).stringByAppendingPathComponent(name)
    }
}