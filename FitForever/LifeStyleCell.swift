//
//  LifeStyleCell.swift
//  FitForever
//
//  Created by Sahil Mahajan on 16/10/15.
//  Copyright © 2015 Fit Forever. All rights reserved.
//

import UIKit

class LifeStyleCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func didInfoButtonTap(sender: AnyObject) {
        
    }
}
