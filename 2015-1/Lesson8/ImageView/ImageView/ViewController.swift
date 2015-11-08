//
//  ViewController.swift
//  ImageView
//
//  Created by Dal Rupnik on 02/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
            let vc = segue.destinationViewController as! DetailViewController
            
            let button = sender as! UIButton
            
            vc.slika = button.imageForState(.Normal)!
        
    }
}

