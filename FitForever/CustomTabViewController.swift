//
//  CustomTabViewController.swift
//  FitForever
//
//  Created by Sahil Mahajan on 28/11/15.
//  Copyright © 2015 Fit Forever. All rights reserved.
//

import UIKit
let availableIdentifiers = ["HomeSegueIdentifier", "SearchSegueIdentifier", "AskDoctorsSegueIdentifier", "HealthPackageSegueIdentifier", "WalletSegueIdentifier"]


class CustomTabViewController: UIViewController {

    @IBOutlet weak var placeholderView: UIView!
    var currentViewController: UIViewController?
    @IBOutlet var tabBarButtons: [UIButton]!
    @IBOutlet var tabBarIcons: [UIImageView]!
    @IBOutlet var tabBarTitles: [UILabel]!
    @IBOutlet weak var customTabBarBackgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backLayer = CALayer()
        backLayer.frame = CGRectMake(0.0, 0.0, UIScreen.mainScreen().applicationFrame.width, 0.5)
        backLayer.backgroundColor = UIColor.lightGrayColor().CGColor
        customTabBarBackgroundView.layer.addSublayer(backLayer)
    }
    
    override func viewWillAppear(animated: Bool) {
        if(tabBarButtons.count > 0) {
            performSegueWithIdentifier("HomeSegueIdentifier", sender: tabBarButtons[0])
            tabBarIcons[0].highlighted = true
            tabBarTitles[0].highlighted = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let segueIdentifier = segue.identifier {
            if(availableIdentifiers.contains(segueIdentifier)) {
                for btn in tabBarButtons {
                    btn.selected = false
                }
                
                
                if let senderBtn = sender as? UIButton {
                    senderBtn.selected = true
                    for icon in tabBarIcons {
                        icon.highlighted = senderBtn.tag == icon.tag
                    }
                    for label in tabBarTitles {
                        label.highlighted = senderBtn.tag == label.tag
                    }
                }
            }
        }
    }
}
