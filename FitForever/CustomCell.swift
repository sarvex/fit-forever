//
//  CustomCell.swift
//  FitForever
//
//  Created by Kshitij Negi on 15/12/15.
//  Copyright © 2015 Fit Forever. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    
    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var SubTitle1Label: UILabel!
    @IBOutlet weak var SubTitle2Label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
