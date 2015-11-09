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
    
    @IBOutlet weak var priorityTextField: UITextField!
    
    @IBOutlet weak var notesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = "Click to add game!"
        
        nameTextField.delegate = self
        priorityTextField.delegate = self
        
        if let gameName = NSUserDefaults.standardUserDefaults().objectForKey("GameName") as? String {
            nameTextField.text = gameName
        }
        
    }

    func textFieldDidEndEditing(textField: UITextField) {
        print("ENDED EDITING")
        
        if (textField == self.nameTextField)
        {
            print ("NAME ENDED")
        }
    }

    @IBAction func addGameButtonTap(sender: UIButton) {
        if let name = nameTextField.text, priority = UInt(priorityTextField.text!) where name.characters.count > 0 {
            
            let game = Game(name: name, priority: priority)
            
            if notesTextView.text.characters.count > 0 {
                game.notes = notesTextView.text
            }
            
            manager.games.append(game)
            
            resultLabel.text = "Added! There are \(manager.games.count) games in database!"
            resultLabel.textColor = UIColor.blackColor()
            
            GameManager.shared.save()
        }
        else {
            resultLabel.text = "Verify your data!"
            resultLabel.textColor = UIColor.redColor()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ImageSegue" {
            let viewController = segue.destinationViewController as! ImageViewController
            viewController.delegate = self
        }
    }
    
    func imageViewControllerDidFinish(imageViewController: ImageViewController) {
        imageViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}

