//
//  AilmentCardViewCellTableViewCell.swift
//  FitForever
//
//  Created by Sahil Mahajan on 11/10/15.
//  Copyright © 2015 Fit Forever. All rights reserved.
//

import UIKit

class AilmentCardViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var ailmentDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.borderColor = UIColor.lightGrayColor().CGColor
        cardView.layer.shadowColor = UIColor.grayColor().CGColor
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
