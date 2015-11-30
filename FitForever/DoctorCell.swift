//
//  DoctorCell.swift
//  FitForever
//
//  Created by Sahil Mahajan on 30/11/15.
//  Copyright © 2015 Fit Forever. All rights reserved.
//

import UIKit

class DoctorCell: UITableViewCell {
    
    @IBOutlet weak var doctorProfilePic: UIImageView!
    @IBOutlet weak var doctorName: UILabel!
    @IBOutlet weak var doctorCategory: UILabel!
    @IBOutlet weak var doctorRating: UIImageView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var addToListButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
