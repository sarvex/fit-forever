//
//  VendorCell.swift
//  FitForever
//
//  Created by Nikita Chhabra on 18/12/15.
//  Copyright © 2015 Fit Forever. All rights reserved.
//

import UIKit

class VendorCell: UITableViewCell {

    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var vendorRating: UILabel!
    @IBOutlet weak var vendorType: UILabel!
    @IBOutlet weak var vendorName: UILabel!
    @IBOutlet weak var vendorImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
