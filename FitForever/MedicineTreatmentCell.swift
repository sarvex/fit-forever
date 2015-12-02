//
//  MedicineTreatmentCell.swift
//  FitForever
//
//  Created by Sahil Mahajan on 01/12/15.
//  Copyright © 2015 Fit Forever. All rights reserved.
//

import UIKit

class MedicineTreatmentCell: UITableViewCell {

    @IBOutlet weak var medicineOrTreatmentNameLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
