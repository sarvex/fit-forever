//
//  AilmentViewController.swift
//  FitForever
//
//  Created by Sahil Mahajan on 07/10/15.
//  Copyright © 2015 Fit Forever. All rights reserved.
//

import UIKit

enum RowType: Int {
    case NewsFeed
    case Lifestyle
}

class AilmentViewController: UIViewController {

    @IBOutlet weak var ailmentTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.navigationItem.backBarButtonItem = nil
        
        ailmentTableView.estimatedRowHeight = 275.0
        ailmentTableView.rowHeight = UITableViewAutomaticDimension
    }

    override func viewWillAppear(animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: TableView Datasource and Delegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCellWithIdentifier("SuggestedDoctorsCellIdentifier", forIndexPath: indexPath) as! SuggestedDoctorsCell
            cell.updateConstraintsIfNeeded()
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("NewsFeedCellIdentifier", forIndexPath: indexPath) as! NewsFeedCell
            if indexPath.row == 0 {
                cell.postImageView.image = UIImage(named: "mosquito.png")
                cell.postImageTopConstraint.constant = 10.0
            }
            else if indexPath.row == 2 {
                cell.ailmentHeadingLabel.text = nil
            }
            else {
                cell.postImageView.image = nil
                cell.postImageTopConstraint.constant = -10.0
            }
            cell.updateConstraintsIfNeeded()
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 3 {
            return 55 + 90*3
        }
        else {
            return UITableViewAutomaticDimension
        }
    }
}
