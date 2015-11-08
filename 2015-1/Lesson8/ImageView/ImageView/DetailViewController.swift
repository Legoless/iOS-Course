//
//  DetailViewController.swift
//  ImageView
//
//  Created by Dal Rupnik on 02/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

class DetailViewController : UIViewController {
    
    var slika : UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = slika
    }
    
}