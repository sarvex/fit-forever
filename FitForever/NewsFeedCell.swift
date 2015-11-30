//
//  AilmentCardViewCellTableViewCell.swift
//  FitForever
//
//  Created by Sahil Mahajan on 11/10/15.
//  Copyright © 2015 Fit Forever. All rights reserved.
//

import UIKit

class NewsFeedCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var ailmentDescriptionLabel: UILabel!
    @IBOutlet weak var postTimeLabel: UILabel!
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var doctorSpecialisationLabel: UILabel!
    @IBOutlet weak var ailmentHeadingLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postImageTopConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.borderColor = UIColor.lightGrayColor().CGColor
        cardView.layer.shadowColor = UIColor.grayColor().CGColor
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func didLikeButtonTap(sender: AnyObject) {
    }
    
    @IBAction func didCommentButtonTap(sender: AnyObject) {
    }
    
    @IBAction func didShareButtonTap(sender: AnyObject) {
    }
    
}
