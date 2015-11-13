//
//  GameManager.swift
//  Gamebox
//
//  Created by Dal Rupnik on 21/10/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import Foundation

class GameManager : NSObject
{
    static let shared = GameManager()
    
    lazy var games : [Game] = self.load()
    
    func addGame (game : Game) {
        games.append(game)
        
        NSNotificationCenter.defaultCenter().postNotificationName("NewGame", object: game)
    }
    
    func save () {
        var serializedGames = [AnyObject]()
        
        for game in games {
            serializedGames.append(game.toDictionary())
        }
        
        NSUserDefaults.standardUserDefaults().setObject(serializedGames, forKey: "AllGames")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func load () -> [Game] {
        let serializedGames = NSUserDefaults.standardUserDefaults().objectForKey("AllGames")
        
        var games = [Game]()
        
        if let serializedGames = serializedGames as? [[String : AnyObject]] {
            for game in serializedGames {
                let newGame = Game(dictionary: game)
                
                games.append(newGame)
            }
        }
        
        return games
    }
}