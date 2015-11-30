//
//  CustomRelationshipSegue.swift
//  FitForever
//
//  Created by Sahil Mahajan on 28/11/15.
//  Copyright © 2015 Fit Forever. All rights reserved.
//

import UIKit

class CustomRelationshipSegue: UIStoryboardSegue {
    override func perform() {
        
        let tabBarController = self.sourceViewController as! CustomTabViewController
        let destinationController = self.destinationViewController as! UINavigationController
        
        for view in tabBarController.placeholderView.subviews as [UIView] {
            view.removeFromSuperview()
        }
        
        // Add view to placeholder view
        tabBarController.currentViewController = destinationController
        tabBarController.placeholderView.addSubview(destinationController.view)
        
        // Set autoresizing
        tabBarController.placeholderView.translatesAutoresizingMaskIntoConstraints = false
        destinationController.view.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: .AlignAllTop, metrics: nil, views: ["v1": destinationController.view])
        
        tabBarController.placeholderView.addConstraints(horizontalConstraint)
        
        let verticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[v1]-0-|", options: .AlignAllTop, metrics: nil, views: ["v1": destinationController.view])
        
        tabBarController.placeholderView.addConstraints(verticalConstraint)
        
        tabBarController.placeholderView.layoutIfNeeded()
        destinationController.didMoveToParentViewController(tabBarController)
        
    }
}
