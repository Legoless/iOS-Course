//
//  ImageViewController.swift
//  Gamebox
//
//  Created by Dal Rupnik on 01/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

@objc protocol ImageViewControllerDelegate {
    func imageViewControllerDidFinish(imageViewController: ImageViewController)
}

class ImageViewController : UIViewController {
    
    weak var delegate : ImageViewControllerDelegate?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var sizeLabel: UILabel!
    
    @IBAction func doneButtonTap(sender: UIButton) {
        delegate?.imageViewControllerDidFinish(self)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(1.0, animations: {
            self.imageView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
        }, completion: { success in
            UIView.animateWithDuration(0.5) {
                self.imageView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI * 2))
            }
        })
    }
}