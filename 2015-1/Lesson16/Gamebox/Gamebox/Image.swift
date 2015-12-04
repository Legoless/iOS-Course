//
//  Image.swift
//  Gamebox
//
//  Created by Dal Rupnik on 02/12/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Image: NSManagedObject {
    
    var imageRef : UIImage? {
        get {
            return UIImage(contentsOfFile: Image.pathForFileName(filename!))
        }
    }
    
    class func pathForFileName (name: String) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let docs: String = paths[0]
        
        return NSString(string: docs).stringByAppendingPathComponent(name)
    }
}
