//
//  GameListTableViewController.swift
//  Gamebox
//
//  Created by Dal Rupnik on 18/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

class GameListTableViewController: UITableViewController {
    
    lazy var dateFormatter : NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        
        return formatter
    }()
    
    var dates : [String] = [String]()
    var games : [String : [Game]] = [String : [Game]]()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        loadGames()
        
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let todayDate = dateFormatter.stringFromDate(NSDate())
        
        let calendar = NSCalendar.currentCalendar()
        let yesterdayDate = dateFormatter.stringFromDate(calendar.dateByAddingUnit(.Day, value: -1, toDate: NSDate(), options: [])!)
        
        if dates[section] == todayDate {
            return "Today"
        }
        else if dates[section] == yesterdayDate {
            return "Yesterday"
        }
        
        return dates[section]
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dates.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games[dates[section]]!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GameCell", forIndexPath: indexPath)
        
        let game = games[dates[indexPath.section]]![indexPath.row]
        
        cell.textLabel?.text = game.name
        cell.detailTextLabel?.text = "Priority: \(game.priority)"
        
        if game.status == .Finished {
            cell.textLabel?.alpha = 0.2
            cell.detailTextLabel?.alpha = 0.2
            cell.accessoryType = .Checkmark
        }
        else {
            cell.textLabel?.alpha = 1.0
            cell.detailTextLabel?.alpha = 1.0
            cell.accessoryType = .DisclosureIndicator
        }
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationVC = segue.destinationViewController as? GameViewController {
            let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
            
            destinationVC.currentGame = games[dates[indexPath.section]]![indexPath.row]
        }
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        let game = games[dates[indexPath.section]]![indexPath.row]
        
        if game.status == .Finished {
            return false
        }
        
        return true
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let game = games[dates[indexPath.section]]![indexPath.row]
        
        let action = UITableViewRowAction(style: .Normal, title: "Finish", handler: { action, indexPath in
            game.status = .Finished
            
            GameManager.shared.save()
            
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        })
        action.backgroundColor = UIColor.blueColor()
        
        return [action];
    }
    
    private func loadGames () {
        //
        // This method loads all games from GameManager and puts them into their regarding dates
        //
        
        dates.removeAll()
        games.removeAll()
        
        /*
        GameManager.shared.allGames.sort ({ (game1, game2) -> Bool in
            return game1.dateAdded.compare(game2.dateAdded) == .OrderedDescending
        })*/
        
        let allGames = GameManager.shared.allGames.sort { $0.dateAdded.compare($1.dateAdded) == .OrderedDescending }
        
        for game in allGames {
            let gameDate = dateFormatter.stringFromDate(game.dateAdded)
            
            if !dates.contains(gameDate) {
                dates.append(gameDate)
                
                games[gameDate] = [Game]()
            }
            
            games[gameDate]?.append(game)
        }
        
        
    }
}
