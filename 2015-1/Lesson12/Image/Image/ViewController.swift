//
//  ViewController.swift
//  Image
//
//  Created by Dal Rupnik on 19/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    
    var imageView : UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "1")
        
        imageView = UIImageView(image: image)
        
        scrollView.addSubview(imageView!)
    
        scrollView.contentSize = image!.size
        
        scrollView.delegate = self
        
        //scrollView.removeFromSuperview()
        
        let recognizer = UILongPressGestureRecognizer(target: self, action: "rotated:")
        recognizer.minimumPressDuration = 5.0
        
        scrollView!.addGestureRecognizer(recognizer)
    }
    
    func rotated(recognizer: UIRotationGestureRecognizer) {
        
        scrollView?.transform = CGAffineTransformMakeRotation(recognizer.rotation)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print(scrollView.contentOffset)
    }

}

