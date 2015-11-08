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
}