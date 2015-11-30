//
//  ViewController.swift
//  Gamebox
//
//  Created by Dal Rupnik on 21/10/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, ImageViewControllerDelegate {

    let manager = GameManager.shared
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var prioritySlider: UISlider!
    @IBOutlet weak var notesTextView: UITextView!
    
    var image : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = "Click to add game!"
        
        nameTextField.delegate = self
        
        if let gameName = NSUserDefaults.standardUserDefaults().objectForKey("GameName") as? String {
            nameTextField.text = gameName
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

    func textFieldDidEndEditing(textField: UITextField) {
        print("ENDED EDITING")
        
        if (textField == self.nameTextField)
        {
            print ("NAME ENDED")
        }
    }
    
    @IBAction func addGameButtonTap(sender: UIButton) {
        guard let name = nameTextField.text where name.characters.count > 0 else {
            resultLabel.text = "Verify your data!"
            resultLabel.textColor = UIColor.redColor()
            
            if nameTextField.text!.characters.count == 0 {
                var center = nameTextField.center
                center.x = self.view.center.x
                
                var centerLeft = center
                centerLeft.x -= 10
                
                var centerRight = center
                centerRight.x += 10
                
                UIView.animateWithDuration(0.2, animations: {
                    self.nameTextField.center = centerLeft
                    }, completion: { success in
                        UIView.animateWithDuration(0.2, animations: {
                            self.nameTextField.center = centerRight
                            }, completion: { success2 in
                                UIView.animateWithDuration(0.2) {
                                    self.nameTextField.center = center
                                }
                        })
                })
            }
            
            return
        }
        
        let game = Game(name: name, priority: UInt(prioritySlider.value))
        game.image = image
        
        if notesTextView.text.characters.count > 0 {
            game.notes = notesTextView.text
        }
        
        manager.addGame(game)
        
        resultLabel.text = "Added! There are \(manager.allGames.count) games in database!"
        resultLabel.textColor = UIColor.blackColor()
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            sender.transform = CGAffineTransformMakeScale(1.05, 1.05)
            }) { success in
                UIView.animateWithDuration(0.3) {
                    sender.transform = CGAffineTransformIdentity
                }
        }
        
        GameManager.shared.save()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ImageSegue" {
            let viewController = segue.destinationViewController as! ImageViewController
            viewController.delegate = self
        }
    }
    
    func imageViewControllerDidFinish(imageViewController: ImageViewController) {
        if (imageViewController.selectedImage != nil) {
            image = imageViewController.selectedImage
        }
        
        self.navigationController?.popViewControllerAnimated(true)
    }
}

