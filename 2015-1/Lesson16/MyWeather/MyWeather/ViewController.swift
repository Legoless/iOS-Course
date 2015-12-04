//
//  ViewController.swift
//  MyWeather
//
//  Created by Dal Rupnik on 08/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var weatherIconView: WeatherIconView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityLabelCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var temperatureLabelBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var timer : NSTimer?
    
    let queue : NSOperationQueue = {
        let queue = NSOperationQueue()
        queue.qualityOfService = .Background
        queue.maxConcurrentOperationCount = 2
        
        return queue
    }()
    
    var location = "Ljubljana"
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: "refresh", userInfo: nil, repeats: true)
        
        self.cityLabel.text = location.capitalizedString
        
        self.view.clipsToBounds = true
    }
    
    @IBAction func backButtonTap(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        refresh()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    func refresh () {
        let operation = WeatherLoadOperation()
        operation.location = location
        operation.completionHandler = { temp, icon, weather in
            dispatch_async(dispatch_get_main_queue()) {
                self.temperatureLabel.text = String(format: "%.2f°", temp)
                self.weatherIconView.iconType = icon
            }
        }
        
        queue.addOperation(operation)
        
        let flickrOperation = FlickrImageOperation()
        flickrOperation.location = location
        flickrOperation.completionHandler = { image in
            if let image = image {
                dispatch_async(dispatch_get_main_queue()) {
                    self.backgroundImageView.image = image
                }
            }
        }
        
        queue.addOperation(flickrOperation)
    }
}

