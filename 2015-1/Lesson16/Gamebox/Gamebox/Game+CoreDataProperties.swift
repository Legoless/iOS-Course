//
//  Game+CoreDataProperties.swift
//  Gamebox
//
//  Created by Dal Rupnik on 02/12/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Game {

    @NSManaged var name: String?
    @NSManaged var dateAdded: NSDate?
    @NSManaged var dateModified: NSDate?
    @NSManaged var priority: NSNumber?
    @NSManaged var statusValue: NSNumber?
    @NSManaged var notes: String?
    @NSManaged var images: NSSet?

}
