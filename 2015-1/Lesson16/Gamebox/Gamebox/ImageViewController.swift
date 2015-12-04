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

class ImageViewController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    weak var delegate : ImageViewControllerDelegate?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var sizeLabel: UILabel!
    
    var selectedImage : UIImage? {
        didSet {
            self.imageView.image = selectedImage
            
            if let selectedImage = selectedImage {
                self.sizeLabel.text = String(format: "Size: %d x %d", Int(selectedImage.size.width), Int(selectedImage.size.height))
            }
        }
    }
    
    @IBAction func doneButtonTap(sender: UIButton) {
        delegate?.imageViewControllerDidFinish(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.borderColor = UIColor.blackColor().CGColor
        imageView.layer.borderWidth = 2.0
        
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "imageDidTap"))
    }
    
    func imageDidTap () {
        let alertController = UIAlertController(title: "Pick an Image", message: "Please select image source", preferredStyle: .ActionSheet)
        
        alertController.addAction(UIAlertAction(title: "Camera", style: .Default, handler: { (action) -> Void in
            let picker = UIImagePickerController()
            picker.sourceType = .Camera
            picker.delegate = self
            
            self.presentViewController(picker, animated: true, completion: nil)
        }))
        
        alertController.addAction(UIAlertAction(title: "Album", style: .Default, handler: { (action) -> Void in
            let picker = UIImagePickerController()
            picker.sourceType = .PhotoLibrary
            picker.delegate = self
            
            self.presentViewController(picker, animated: true, completion: nil)
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.selectedImage = image
        }
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}