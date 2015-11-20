//
//  CarCell.swift
//  MyGarage
//
//  Created by Dal Rupnik on 16/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

class CarCell: UITableViewCell {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mainSwitch: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
