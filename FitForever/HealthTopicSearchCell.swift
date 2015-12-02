//
//  HealthTopicSearchCell.swift
//  FitForever
//
//  Created by Sahil Mahajan on 01/12/15.
//  Copyright © 2015 Fit Forever. All rights reserved.
//

import UIKit

class HealthTopicSearchCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var healthTopicImageView: UIImageView!
    @IBOutlet weak var healthTopicTitleLabel: UILabel!
    @IBOutlet weak var healthTopicDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        healthTopicDescriptionLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("didDescriptionLabelTap:")))
//        self.layer.shadowOffset = CGSize(width: 0, height: 2)
//        self.layer.shadowOpacity = 0.5
//        self.layer.shadowColor = UIColor.lightGrayColor().CGColor
//        self.layer.borderColor = UIColor.grayColor().CGColor
//        self.clipsToBounds = false
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func didDescriptionLabelTap(sender: AnyObject) {
        print("See More Tapped")
    }
}
