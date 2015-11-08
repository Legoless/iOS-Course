//
//  ReceiverViewController.swift
//  Messages
//
//  Created by Dal Rupnik on 04/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

class ReceiverViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textMessage:", name: "TextMessage", object: nil)
    }
    
    func textMessage(notification: NSNotification) {
        if let text = notification.object as? String {
            textView.text = text
        }
    }

}
