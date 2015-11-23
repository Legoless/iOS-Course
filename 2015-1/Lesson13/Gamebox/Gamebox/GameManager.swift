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
    
    var games : [Game]?
    
    var allGames : [Game] {
        if games == nil {
            loadAllGames()
        }
        
        return games!
    }
    
    func addGame (game : Game) {
        
        if games == nil {
            loadAllGames()
        }
        
        games!.append(game)
        
        NSNotificationCenter.defaultCenter().postNotificationName("NewGame", object: game)
    }
    
    func save () {
        guard let games = games else {
            return
        }
        
        var serializedGames = [AnyObject]()
        
        for game in games {
            serializedGames.append(game.toDictionary())
        }
        
        NSUserDefaults.standardUserDefaults().setObject(serializedGames, forKey: "AllGames")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func loadAllGames () {
        self.games = loadGames()
    }
    
    private func loadGames () -> [Game] {
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