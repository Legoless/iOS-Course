//
//  GameManager.swift
//  Gamebox
//
//  Created by Dal Rupnik on 21/10/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import Foundation
import MagicalRecord
import UIKit

class GameManager : NSObject
{
    static let shared = GameManager()
    
    var games : [Game]?
    
    var allGames : [Game] {
        if games == nil {
            loadAllGames()
        }
        
        return games!
    }
    
    func addGame (name: String, dateAdded: NSDate, dateModified: NSDate, priority: UInt, status: Status, notes: String?, images: [UIImage]?) {
        
        if games == nil {
            loadAllGames()
        }
        
        MagicalRecord.saveWithBlock ({ context in
            let game = Game.MR_createEntityInContext(context)
            game.name = name
            game.dateAdded = dateAdded
            game.dateModified = dateModified
            game.priority = priority
            game.status = status
            game.notes = notes
            
            if let images = images {
                for image in images {
                    let imageEntity = Image.MR_createEntityInContext(context)
                    imageEntity.filename = self.storeImage(image)
                    imageEntity.game = game
                }
            }
        }, completion: { success, error in
            NSNotificationCenter.defaultCenter().postNotificationName("NewGame", object: nil)
            
            self.loadAllGames()
        })
    }
    
    func loadAllGames () {
        self.games = loadGames()
    }
    
    private func loadGames () -> [Game] {
        var games = [Game]()
        
        if let allGame = Game.MR_findAll() as? [Game] {
            games = allGame
        }
        
        return games
    }
    
    private func generateImageName () -> String {
        
        let randomImage = String(randomNumber(UINT32_MAX))
        
        return randomImage + ".png"
    }
    
    private func randomNumber (max: UInt32) -> Int {
        return Int(arc4random_uniform(max) + 1)
    }
    
    private func storeImage(image: UIImage) -> String {
        
        let imageName = generateImageName()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) {
            let imageData = NSData(data: UIImagePNGRepresentation(image)!)
            
            imageData.writeToFile(Image.pathForFileName(imageName), atomically: true)
        }
        
        return imageName
    }

}