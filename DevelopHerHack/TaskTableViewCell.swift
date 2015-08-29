//
//  TaskTableViewCell.swift
//  DevelopHerHack
//
//  Created by Ya Kao on 8/29/15.
//  Copyright (c) 2015 danamun. All rights reserved.
//

import UIKit

class TaskTableViewCell: PFTableViewCell {

    @IBOutlet weak var taskTitle: UILabel!
    @IBOutlet weak var whom: UILabel!
    @IBOutlet weak var money: UILabel!
    @IBOutlet weak var taskDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
