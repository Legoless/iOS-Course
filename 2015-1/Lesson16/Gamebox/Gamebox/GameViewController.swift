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
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let game = currentGame {
            var displayString = "**Name**: \(game.name!)\n**Priority**:" + String(game.priority!)
            
            if let notes = game.notes {
                displayString += "\n**Notes:**\n" + notes
            }
            
            var options = MarkdownOptions()
            options.autoHyperlink = true
            options.autoNewlines = true
            options.emptyElementSuffix = ">"
            options.encodeProblemUrlCharacters = true
            options.linkEmails = false
            options.strictBoldItalic = true
            
            var markdown = Markdown(options: options)
            
            webView.loadHTMLString(markdown.transform(displayString), baseURL: nil)
            
            if let images = game.images where images.count > 0 {
                let image = images.allObjects.first as! Image
                
                imageView.image = image.imageRef
            }
        }
    }
}
