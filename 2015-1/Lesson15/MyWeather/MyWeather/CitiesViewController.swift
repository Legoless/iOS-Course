//
//  CitiesViewController.swift
//  MyWeather
//
//  Created by Dal Rupnik on 29/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

class CitiesViewController : UITableViewController, WeatherDataDelegate {
    
    var cities : [String] = [String]()
    var temperatures : [Double] = [Double]()
    var loading : [Bool] = [Bool]()
    
    
    let queue : NSOperationQueue = {
        let queue = NSOperationQueue()
        queue.qualityOfService = .Background
        queue.maxConcurrentOperationCount = 4
        
        return queue
    }()
    
    
    var timer : NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addCity("Ljubljana")
        self.addCity("Tokio")
        self.addCity("New York")
        self.addCity("Mexico City")
        
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "refresh", userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        refresh()
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("WeatherCell", forIndexPath: indexPath)
        
        let city = cities[indexPath.row]
        
        cell.textLabel?.text = city
        
        if loading[indexPath.row] == true {
            cell.detailTextLabel?.text = "Loading"
        }
        else {
            cell.detailTextLabel?.text = String(format:"%d°", Int(temperatures[indexPath.row]))
        }
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let viewController = segue.destinationViewController as? ViewController, cell = sender as? UITableViewCell {
            let indexPath = self.tableView.indexPathForCell(cell)
            
            viewController.location = cities[(indexPath?.row)!]
        }
        else if let viewController = segue.destinationViewController as? WeatherDataViewController {
            viewController.delegate = self
        }
    }
    
    
    func weatherDataDidFinish(weatherDataViewController: WeatherDataViewController) {
        if let location = weatherDataViewController.location {
            self.addCity(location)
            
            self.tableView.insertRowsAtIndexPaths([ NSIndexPath(forRow: cities.count - 1, inSection: 0) ], withRowAnimation:.Automatic)
        }
        
        weatherDataViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func refresh () {
        for city in cities {
            self.addOperationForCity(city)
        }
    }
    
    func addCity (city: String) {
        cities.append(city)
        temperatures.append(0.0)
        loading.append(true)
    }
    
    func addOperationForCity (city: String) {
        let index = cities.indexOf(city)!
        loading[index] = true
        
        // Refresh cell to show loading
        let indexPath = NSIndexPath(forRow: index, inSection: 0)
        self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
        let operation = WeatherLoadOperation()
        operation.location = city
        operation.completionHandler = { temp, icon, weather in
            dispatch_async(dispatch_get_main_queue()) {
                self.refreshCellForCity(city, temp: temp)
            }
        }
        
        queue.addOperation(operation)
    }
    
    func refreshCellForCity (city: String, temp: Double) {
        // Get index of cell
        
        let index = cities.indexOf(city)!
        
        loading[index] = false
        
        temperatures[index] = temp
        
        let indexPath = NSIndexPath(forRow: index, inSection: 0)
        
        self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
}