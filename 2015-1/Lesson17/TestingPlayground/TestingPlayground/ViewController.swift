//
//  ViewController.swift
//  TestingPlayground
//
//  Created by Dal Rupnik on 07/12/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func buttonTap(sender: AnyObject) {
        
        var fibonnaci1 = Mathematic.fibonacci(93)
        
        var fibonacci2 = Mathematic.fibonacciRecursive(35)
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

