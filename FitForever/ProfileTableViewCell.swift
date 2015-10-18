//
//  ProfileTableViewCell.swift
//  FitForever
//
//  Created by Sahil Mahajan on 17/10/15.
//  Copyright © 2015 Fit Forever. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
   
    @IBOutlet weak var profileTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
