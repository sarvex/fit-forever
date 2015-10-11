
//
//  Extensions.swift
//  FitForever
//
//  Created by Sahil Mahajan on 11/10/15.
//  Copyright © 2015 Fit Forever. All rights reserved.
//

import UIKit

extension CALayer {
    
    func setBorderUIColor(color: UIColor) {
        self.borderColor = color.CGColor
    }
    
    func borderUIColor() -> UIColor {
        return UIColor(CGColor: self.borderColor!)
    }
    
    func setShadowUIColor(color: UIColor) {
        self.shadowColor = color.CGColor
    }
    
    func shadowUIColor() -> UIColor {
        return UIColor(CGColor: self.shadowColor!)
    }
}

extension UIStoryboard {
    class func loginStoryBoard() -> UIStoryboard {
        return UIStoryboard(name: "Login", bundle: NSBundle.mainBundle())
    }
    
    class func HomeStoryBoard() -> UIStoryboard {
        return UIStoryboard(name: "Home", bundle: NSBundle.mainBundle())
    }
}