//
//  ViewController.swift
//  UIKitPlayground
//
//  Created by Dal Rupnik on 09/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var activityView: UIActivityIndicatorView!

    
    @IBAction func sliderChanged(sender: UISlider) {
        
    }
    
    @IBAction func switchChanged(sender: UISwitch) {
        
        if sender.on {
            UIView.animateWithDuration(2.0, animations: {
                self.activityView.center = CGPointMake(20.0, 20.0)
                //self.activityView.alpha = 0.0
                self.activityView.transform = CGAffineTransformMakeScale(4.0, 4.0)
                self.activityView.transform = CGAffineTransformRotate(self.activityView.transform, CGFloat(M_PI))
                }, completion: { success in
                    UIView.animateWithDuration(1.0, animations: {
                        self.activityView.center = self.view.center
                        self.activityView.transform = CGAffineTransformIdentity
                        //self.activityView.alpha = 1.0
                        }, completion: { success2 in
                            
                    })
            })
        }
    }

    
}

