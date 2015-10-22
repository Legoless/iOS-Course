//
//  ViewController.swift
//  Converter
//
//  Created by Dal Rupnik on 21/10/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let usdRate = 1.14
    let jpyRate = 136.12
    
    var currentCurrency = Currency(type: "USD", rate: 1.14)
    var converter = Converter()
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var usdButton: UIButton!
    @IBOutlet weak var jpyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //usdButton.selected = true
    }
    
    @IBAction func usdButtonTap(sender: UIButton) {
        currentCurrency = Currency(type: "USD", rate: usdRate)
        
        usdButton.selected = true
        jpyButton.selected = false
    }
    
    @IBAction func jpyButtonTap(sender: UIButton) {
        currentCurrency = Currency(type: "JPY", rate: jpyRate)
        
        usdButton.selected = false
        jpyButton.selected = true
    }

    @IBAction func convertButtonTap(sender: UIButton) {
        if let value = Double(textField.text!) {
            let (converted, _) = converter.convert(value, startCurrency: Currency(), targetCurrency: currentCurrency)
            
            resultLabel.text = "In \(currentCurrency.type): \(converted)"
            resultLabel.textColor = UIColor.blackColor()
        }
        else {
            resultLabel.text = "Error: Enter valid value!"
            resultLabel.textColor = UIColor.redColor()
        }
    }

}

