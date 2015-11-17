//
//  ViewController.swift
//  Stopwatch
//
//  Created by Dal Rupnik on 15/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    var currentTime = 0.0
    
    var timer : NSTimer?
    
    var appeared = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didDeactivate", name: UIApplicationWillResignActiveNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didActivate", name: UIApplicationDidBecomeActiveNotification, object: nil)
    }
    
    func didDeactivate () {
        appeared = false
    }
    
    func didActivate () {
        appeared = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        appeared = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        appeared = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    deinit {
        // Clean-up
        cleanUpTimer()
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    @IBAction func startButtonTap(sender: UIButton) {
        
        if timer != nil {
            // Stop the timer
            
            cleanUpTimer()
            
            sender.setTitle("Start", forState: .Normal)
        }
        else {
            // Start the timer
            
            sender.setTitle("Stop", forState: .Normal)
            
            currentTime = 30.0
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTimer", userInfo: nil, repeats: true)
            
            updateTimer()
        }
    }
    
    @IBAction func addButtonTap(sender: UIButton) {
        currentTime += 10.0
        
        updateTimer()
    }

    func updateTimer () {
        if !appeared {
            return
        }

        currentTime = currentTime - 1.0
        
        // Counting down
        if currentTime < 0 {
            currentTime = 0
        }
        
        print (currentTime)
        
        // Calculate minutes and seconds
        
        let minutes = UInt(floor(currentTime / 60.0))
        let seconds = UInt(currentTime - (Double(minutes) * 60.0))
        
        timerLabel.text = NSString(format: "%02d:%02d", minutes, seconds) as String
        
        if currentTime < 10.0 {
            timerLabel.textColor = UIColor.orangeColor()
        }
        else {
            timerLabel.textColor = UIColor.blackColor()
        }
        
        // Check timer stop
        
        if currentTime == 0.0 {
            startButton.setTitle("Start", forState: .Normal)
            
            timerLabel.textColor = UIColor.redColor()
            
            cleanUpTimer()
            
            UIView.animateWithDuration(0.33, animations: {
                self.timerLabel.transform = CGAffineTransformMakeScale(1.2, 1.2)
                }, completion: { success in
                    UIView.animateWithDuration(0.33, animations: {
                        self.timerLabel.transform = CGAffineTransformIdentity
                    }, completion: nil)
            })
        }
    }
    
    func cleanUpTimer () {
        if let timer = timer {
            timer.invalidate()
            self.timer = nil
        }
    }
}

