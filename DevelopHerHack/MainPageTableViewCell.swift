//
//  MainPageTableViewCell.swift
//  DevelopHerHack
//
//  Created by Da Y Mun on 8/28/15.
//  Copyright (c) 2015 danamun. All rights reserved.
//

import UIKit

class MainPageTableViewCell: PFTableViewCell {
    
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var money: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
