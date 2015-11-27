//
//  GameViewController.swift
//  Gamebox
//
//  Created by Dal Rupnik on 08/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    var currentGame : Game?
    
    let fontSize : CGFloat = 20.0
    
    @IBOutlet weak var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if currentGame == nil {
            currentGame = Game(name: "My first game", priority: 2)
            currentGame?.notes = "My game note"
        }
        
        
        if let game = currentGame {
            let displayString = NSMutableAttributedString()
            displayString.appendAttributedString(NSAttributedString(string: "Name: ", attributes: [NSFontAttributeName : UIFont(name: "Lato-Regular", size: fontSize)!]))
            displayString.appendAttributedString(NSAttributedString(string: "\(game.name)\n", attributes: [NSFontAttributeName : UIFont(name: "Lato-Bold", size: fontSize)!]))
            
            displayString.appendAttributedString(NSAttributedString(string: "Priority: ", attributes: [NSFontAttributeName : UIFont(name: "Lato-Regular", size: fontSize)!]))
            displayString.appendAttributedString(NSAttributedString(string: String(game.priority), attributes: [NSFontAttributeName : UIFont(name: "Lato-Bold", size: fontSize)!]))
            
            if let notes = game.notes {
                displayString.appendAttributedString(NSAttributedString(string: "\nNotes:\n", attributes: [NSFontAttributeName : UIFont(name: "Lato-Regular", size: fontSize)!, NSForegroundColorAttributeName : UIColor.purpleColor()]))
                displayString.appendAttributedString(NSAttributedString(string: notes, attributes: [NSFontAttributeName : UIFont(name: "Lato-Bold", size: fontSize)!]))
            }
            
            descriptionLabel.attributedText = displayString
        }
    }
}
