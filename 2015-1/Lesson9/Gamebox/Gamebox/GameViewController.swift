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
            displayString.appendAttributedString(NSAttributedString(string: "Name: ", attributes: [NSFontAttributeName : UIFont.systemFontOfSize(fontSize)]))
            displayString.appendAttributedString(NSAttributedString(string: "\(game.name)\n", attributes: [NSFontAttributeName : UIFont.boldSystemFontOfSize(fontSize)]))
            
            displayString.appendAttributedString(NSAttributedString(string: "Priority: ", attributes: [NSFontAttributeName : UIFont.systemFontOfSize(fontSize)]))
            
            if let notes = game.notes {
                displayString.appendAttributedString(NSAttributedString(string: "\nNotes:\n", attributes: [NSFontAttributeName : UIFont.systemFontOfSize(fontSize), NSForegroundColorAttributeName : UIColor.purpleColor(), NSKernAttributeName : 50.0]))
                displayString.appendAttributedString(NSAttributedString(string: notes, attributes: [NSFontAttributeName : UIFont.boldSystemFontOfSize(fontSize)]))
            }
            
            descriptionLabel.attributedText = displayString
        }
    }
}
