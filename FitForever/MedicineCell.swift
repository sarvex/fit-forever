//
//  MedicineCell.swift
//  FitForever
//
//  Created by Nikita Chhabra on 18/12/15.
//  Copyright © 2015 Fit Forever. All rights reserved.
//

import UIKit

class MedicineCell: UITableViewCell {

    @IBOutlet weak var availableMedicine: UILabel!
    @IBOutlet weak var treatments: UILabel!
    @IBOutlet weak var medicineImage: UIImageView!
    @IBOutlet weak var saltName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
