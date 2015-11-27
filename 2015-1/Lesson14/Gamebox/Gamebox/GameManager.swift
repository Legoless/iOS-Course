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
        
        let JSON = ["games" : serializedGames]
        
        do {
            let JSONString = try NSString(data: NSJSONSerialization.dataWithJSONObject(JSON, options: NSJSONWritingOptions(rawValue: 0)), encoding: NSUTF8StringEncoding)

            NSUserDefaults.standardUserDefaults().setObject(JSONString, forKey: "AllGames")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        catch {
            
        }
    }
    
    func loadAllGames () {
        self.games = loadGames()
    }
    
    private func loadGames () -> [Game] {
        let serializedGames = NSUserDefaults.standardUserDefaults().objectForKey("AllGames")
        
        var games = [Game]()
        
        if let serializedGames = serializedGames as? String {
            do {
                let JSON = try NSJSONSerialization.JSONObjectWithData(serializedGames.dataUsingEncoding(NSUTF8StringEncoding)!, options: NSJSONReadingOptions(rawValue: 0))
                
                if let JSON = JSON as? [String : [[String : AnyObject]]] {
                    for game in JSON["games"]! {
                        let newGame = Game(dictionary: game)
                        
                        games.append(newGame)
                    }
                }
            }
            catch {
                
            }
        }
        
        return games
    }
}