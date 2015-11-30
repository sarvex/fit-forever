//
//  SuggestedDoctorsCell.swift
//  FitForever
//
//  Created by Sahil Mahajan on 29/11/15.
//  Copyright © 2015 Fit Forever. All rights reserved.
//

import UIKit

class SuggestedDoctorsCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {

    var doctorDataSource: [AnyObject]?
    @IBOutlet weak var suggestedDoctorTableView: UITableView!
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.layer.borderColor = UIColor.lightGrayColor().CGColor
        cardView.layer.shadowColor = UIColor.grayColor().CGColor
        suggestedDoctorTableView.estimatedRowHeight = 90.0
        suggestedDoctorTableView.registerNib(UINib(nibName: "DoctorCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "DoctorCellIdentifier")
        suggestedDoctorTableView.rowHeight = UITableViewAutomaticDimension
        suggestedDoctorTableView.reloadData()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    //MARK: TableView Datasource and Delegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DoctorCellIdentifier", forIndexPath: indexPath) as! DoctorCell
        cell.addToListButton.tag = indexPath.row
        cell.updateConstraintsIfNeeded()
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if cell.respondsToSelector(Selector("setSeparatorInset:"))  {
            cell.separatorInset = UIEdgeInsetsZero;
        }
        cell.preservesSuperviewLayoutMargins = false
        cell.layoutMargins = UIEdgeInsetsZero
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    @IBAction func didAddToListButtonTap(sender: AnyObject) {
        
    }
    
}
