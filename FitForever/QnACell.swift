//
//  QnACell.swift
//  FitForever
//
//  Created by Kshitij Negi on 16/12/15.
//  Copyright © 2015 Fit Forever. All rights reserved.
//

import UIKit

class QnACell: UITableViewCell {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerCountLabel: UILabel!
    @IBOutlet weak var topAnswerTextLabel: UILabel!
    @IBOutlet weak var writtenBy: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
