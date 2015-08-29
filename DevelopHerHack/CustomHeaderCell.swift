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
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var formatView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.whiteColor()
    
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
