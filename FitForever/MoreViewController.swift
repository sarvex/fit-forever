//
//  MoreViewController.swift
//  FitForever
//
//  Created by Sahil Mahajan on 16/10/15.
//  Copyright © 2015 Fit Forever. All rights reserved.
//

enum MoreItems :Int {
    case HealthPackage
    case DoctorsList
    case History
    
    var description: String {
        switch self {
        case .HealthPackage:
            return "Health Packages"
        case .DoctorsList:
            return "Doctors"
        case .History:
            return "History"
        }
    }
    
    var icon: String {
        switch self {
        case .HealthPackage:
            return "ic_health_package"
        case .DoctorsList:
            return "ic_history"
        case .History:
            return "ic_find_doctor"
        }
    }
}

import UIKit

class MoreViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

         self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MoreTableViewCellIdentifier", forIndexPath: indexPath)
        let item = MoreItems(rawValue: indexPath.row)!
        cell.imageView?.image = UIImage(named: item.icon)
        cell.textLabel?.text = item.description
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }

    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
