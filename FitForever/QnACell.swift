//
//  QnACell.swift
//  FitForever
//
//  Created by Kshitij Negi on 16/12/15.
//  Copyright © 2015 Fit Forever. All rights reserved.
//

import UIKit

class QnACell: UITableViewCell {

    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var AnswerCountLabel: UILabel!
    @IBOutlet weak var TopAnsLabel: UILabel!
    @IBOutlet weak var WrittenByLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
