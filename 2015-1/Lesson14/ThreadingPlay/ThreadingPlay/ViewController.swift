//
//  ViewController.swift
//  ThreadingPlay
//
//  Created by Dal Rupnik on 26/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressView: UIProgressView!
    
    var queue = NSOperationQueue()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView.progress = 0.5
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
        
        queue.maxConcurrentOperationCount = 1
        
        var myOperation1 = MyOperation()
        myOperation1.progressView = progressView
        myOperation1.factor = 5
        
        var myOperation2 = MyOperation()
        
        myOperation2.progressView = progressView
        myOperation2.factor = 7
        var myOperation3 = MyOperation()
        myOperation3.addDependency(myOperation1)
        
        myOperation3.progressView = progressView
        myOperation3.factor = 10
        
        queue.addOperations([myOperation3, myOperation2, myOperation1], waitUntilFinished: false)
        
        /*
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)
        
        dispatch_async(queue, {
            self.animateProgress()
        })
        
        
        dispatch_async(queue, {
            self.animateProgress2()
        })*/
    }
    /*
    func animateProgress () {
        for var i = 0; i <= 10; i++ {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.progressView.progress += (Float(i) / 10.0)
            })
            sleep(1)
        }
    }
    
    
    func animateProgress2 () {
        for var i = 0; i <= 8; i++ {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.progressView.progress -= (Float(i) / 8.0)
            })
            sleep(2)
        }
    }*/
}

