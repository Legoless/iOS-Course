//
//  DetailViewController.swift
//  Photos
//
//  Created by Dal Rupnik on 18/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {

    var image : UIImage?
    
    private var imageView : UIImageView?
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        if let image = image {
            imageView = UIImageView(image: image)
            imageView?.userInteractionEnabled = true
            
            scrollView.addSubview(imageView!)
            
            scrollView.contentSize = image.size
            
            scrollView.delegate = self
            
            let recognizer = UIRotationGestureRecognizer(target: self, action: "rotated:")
        imageView!.addGestureRecognizer(recognizer)
            
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        updateScrollViewScale()
    }
    
    func rotated(recognizer: UIRotationGestureRecognizer) {
        if recognizer.state == .Changed {
            
            // If we are changing the rotation
            
            imageView?.transform = CGAffineTransformMakeRotation(recognizer.rotation)
            
            //imageView?.transform = CGAffineTransformRotate(imageView!.transform, recognizer.rotation)
        }
        else if recognizer.state == .Ended {
            
            // Rotation has ended
            
            UIView.animateWithDuration(0.25) {
                let rotation = Double(recognizer.rotation).degrees
                let remainder = rotation % 90
                
                var finalRotation : Double
                
                if remainder > 45 {
                    finalRotation = rotation + (90.0 - remainder)
                }
                else {
                    finalRotation = rotation - remainder
                }
                
                print (finalRotation)
                
                self.imageView?.transform = CGAffineTransformMakeRotation(CGFloat(finalRotation.radians))
            }
        }
    }
    
    // MARK: UIScrollViewDelegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print(scrollView.contentOffset)
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    private func updateScrollViewScale () {
        if let image = image {
            let scrollViewFrame = scrollView.bounds
            let scaleWidth = scrollViewFrame.size.width / image.size.width
            let scaleHeight = scrollViewFrame.size.height / image.size.height
            let minScale = min(scaleWidth, scaleHeight)
            
            scrollView.minimumZoomScale = minScale
            scrollView.maximumZoomScale = 3.0
            
            scrollView.zoomScale = minScale
        }
    }
}
