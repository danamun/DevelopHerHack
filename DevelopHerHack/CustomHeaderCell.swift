//
//  CustomHeaderCell.swift
//  DevelopHerHack
//
//  Created by Da Y Mun on 8/29/15.
//  Copyright (c) 2015 danamun. All rights reserved.
//

import UIKit

class CustomHeaderCell: UITableViewCell {

    @IBOutlet weak var money: UILabel!
    @IBOutlet weak var username: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
