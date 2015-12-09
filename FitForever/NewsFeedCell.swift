//
//  AilmentCardViewCellTableViewCell.swift
//  FitForever
//
//  Created by Sahil Mahajan on 11/10/15.
//  Copyright © 2015 Fit Forever. All rights reserved.
//

import UIKit

class NewsFeedCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var ailmentDescriptionLabel: UILabel!
    @IBOutlet weak var postTimeLabel: UILabel!
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var doctorSpecialisationLabel: UILabel!
    @IBOutlet weak var ailmentHeadingLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postImageTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomBarViewForPost: UIView!
    @IBOutlet weak var bottomBarViewForAnswer: UIView!
    @IBOutlet weak var nDoctorReplyLabel: UILabel!
    @IBOutlet weak var answeredLabel: UILabel!
    @IBOutlet weak var answerByDoctorsCollectionView: UICollectionView!
    @IBOutlet weak var askMeView: UIView!
    @IBOutlet weak var postTimeView: UIView!
    
    var replyByDoctorsList: [AnyObject]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.borderColor = UIColor.lightGrayColor().CGColor
        cardView.layer.shadowColor = UIColor.grayColor().CGColor
        answerByDoctorsCollectionView.registerNib(UINib(nibName: "AnswerByDoctorCollectionViewCell", bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: "AnswerByDoctorCellIdentifier")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func didLikeButtonTap(sender: AnyObject) {
    }
    
    @IBAction func didCommentButtonTap(sender: AnyObject) {
    }
    
    @IBAction func didShareButtonTap(sender: AnyObject) {
    }
    
    //MARK: Collection Vie  w Delegate and Datasource Methods
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AnswerByDoctorCellIdentifier", forIndexPath: indexPath) as! AnswerByDoctorCollectionViewCell
        cell.doctorProfileImageView.backgroundColor = UIColor.brownColor()
        
        return cell
    }
    
    @IBAction func didAskDoctorButtonTap(sender: AnyObject) {
    }
}
