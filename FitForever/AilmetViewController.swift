//
//  AilmetViewController.swift
//  FitForever
//
//  Created by Sahil Mahajan on 07/10/15.
//  Copyright © 2015 Fit Forever. All rights reserved.
//

import UIKit
import Parse

class AilmetViewController: UIViewController {

    @IBOutlet weak var ailmentTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.navigationItem.backBarButtonItem = nil
        
        ailmentTableView.estimatedRowHeight = 275.0
        ailmentTableView.rowHeight = UITableViewAutomaticDimension
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .Plain, target: self, action: Selector("signoutButtonTapped"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func signoutButtonTapped() {
        PFUser.logOut()
        let loginVC = UIStoryboard.loginStoryBoard().instantiateInitialViewController()
        self.view.window?.rootViewController = loginVC
    }
    
    //MARK: TableView Datasource and Delegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AilmentCardViewIdentifier", forIndexPath: indexPath) as! AilmentCardViewCell
        
        cell.updateConstraintsIfNeeded()
        
        return cell
    }
}
