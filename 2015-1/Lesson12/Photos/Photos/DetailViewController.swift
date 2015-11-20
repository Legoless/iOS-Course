//
//  DetailViewController.swift
//  Photos
//
//  Created by Dal Rupnik on 18/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var image : UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = image {
            imageView.image = image
        }
    }
}
