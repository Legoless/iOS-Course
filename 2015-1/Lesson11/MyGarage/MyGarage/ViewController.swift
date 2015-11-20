//
//  ViewController.swift
//  MyGarage
//
//  Created by Dal Rupnik on 16/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var cars : [Car]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 200.0
        
        cars = [ Car(brand: "Fiat", model: "Punto asdsads adas d asd as das d asd as das d asd as dsa d as das das d as das d asd as da ", topSpeed: 50.0), Car(brand: "Tesla", model: "P85D", topSpeed: 500.0), Car(brand: "Honda", model: "Civic 1.4i", topSpeed: 700.0), Car(brand: "Hyundai", model: "i30", topSpeed: 5.0), Car(brand: "Škoda", model: "Octavia", topSpeed: 0.1) ]
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "refresh", forControlEvents: .ValueChanged)
        
        self.refreshControl = refreshControl
    }
    
    func refresh () {
        self.refreshControl?.endRefreshing()
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let cars = cars {
            return cars.count
        }
        
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier2", forIndexPath: indexPath) as! CarCell
        
        let car = cars![indexPath.row]
        
        cell.mainLabel.text = "\(car.brand) \(car.model)"
        cell.mainSwitch.on = false
        //cell.textLabel?.text = car.brand
        //cell.detailTextLabel?.text = car.model
        
        return cell
    }
    
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let cell = sender as? UITableViewCell {
            let indexPath = tableView.indexPathForCell(cell)
            
            let car = cars![indexPath!.row]
        }
    }*/
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

