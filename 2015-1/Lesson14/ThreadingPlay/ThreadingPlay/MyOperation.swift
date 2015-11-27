//
//  MyOperation.swift
//  ThreadingPlay
//
//  Created by Dal Rupnik on 26/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

class MyOperation: NSOperation {
    var progressView : UIProgressView?
    
    var factor : Int = 5
    
    override func main() {
        for var i = 0; i <= factor; i++ {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.progressView!.progress = (Float(i) / Float(self.factor))
            })
            sleep(1)
        }
    }
}
