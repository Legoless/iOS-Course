//
//  ViewController.swift
//  Messages
//
//  Created by Dal Rupnik on 04/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

class SenderViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for viewController in (self.tabBarController?.viewControllers)! {
            viewController.loadViewIfNeeded()
        }
    }
    
    @IBAction func sendButtonTap(sender: UIButton) {
        NSNotificationCenter.defaultCenter().postNotificationName("TextMessage", object: textView.text!)
    }
}

