//
//  DictionaryExample.swift
//  Gamebox
//
//  Created by Dal Rupnik on 29/10/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import Foundation


func lesson5 () {
    var dictionary : [String : AnyObject] = [String : AnyObject]()
    
    dictionary["A"] = nil
    
    print ("First: \(dictionary.count)")
    
    dictionary["A"] = NSNull()
    
    if dictionary["A"] is NSNull {
        print ("IS NSNULL")
    }
    
    if dictionary["A"] != nil {
        print ("IS NIL")
    }
    
    if let object = dictionary["A"] as? NSNull {
        print("NULL")
    }
    
    print ("Second: \(dictionary.count)")
    
    dictionary["A"] = nil
    
    
    if dictionary["A"] != nil {
        print ("IS SECOND NIL")
    }
    
    print ("Third: \(dictionary.count)")
    
}