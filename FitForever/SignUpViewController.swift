//
//  SignUpViewController.swift
//  FitForever
//
//  Created by Sahil Mahajan on 07/10/15.
//  Copyright © 2015 Fit Forever. All rights reserved.
//

import UIKit
import Parse
import MBProgressHUD

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        nameTextField.text = nil
        emailTextField.text = nil
        usernameTextField.text = nil
        passwordTextField.text = nil
        mobileTextField.text = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didCreateAccountButtonTap(sender: AnyObject) {
        if let username = usernameTextField.text, let password = passwordTextField.text , let name = nameTextField.text {
            if name.isEmpty {
                let alertController = UIAlertController(title: "Error", message: "Name can't be left blank", preferredStyle: UIAlertControllerStyle.Alert)
                let alertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
                alertController.addAction(alertAction)
                presentViewController(alertController, animated: true, completion: nil)
            }
            else if username.isEmpty {
                let alertController = UIAlertController(title: "Error", message: "Username can't be left blank", preferredStyle: UIAlertControllerStyle.Alert)
                let alertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
                alertController.addAction(alertAction)
                presentViewController(alertController, animated: true, completion: nil)
            }
            else if password.isEmpty {
                let alertController = UIAlertController(title: "Error", message: "Password can't be left blank", preferredStyle: UIAlertControllerStyle.Alert)
                let alertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
                alertController.addAction(alertAction)
                presentViewController(alertController, animated: true, completion: nil)
            }
            else if let email = emailTextField.text where !Utility.isEmailValid(email) {
                let alertController = UIAlertController(title: "Error", message: "Invalid Email Address", preferredStyle: UIAlertControllerStyle.Alert)
                let alertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
                alertController.addAction(alertAction)
                presentViewController(alertController, animated: true, completion: nil)
            }
            else {
                let progressView = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                progressView.labelText = "Signing Up..."
                let newUser = PFUser()
                newUser.username = username
                newUser.password = password
                if let email = emailTextField.text {
                    newUser.email = email
                }
                if let phone = mobileTextField.text {
                    newUser["phone"] = phone
                }
                // other fields can be set just like with PFObject
                
                newUser.signUpInBackgroundWithBlock {
                    (succeeded: Bool, error: NSError?) -> Void in
                    MBProgressHUD.hideHUDForView(self.view, animated: true)

                    if let error = error {
                        let errorString = error.userInfo["error"] as! String
                        let alertController = UIAlertController(title: "Error", message: errorString, preferredStyle: UIAlertControllerStyle.Alert)
                        let alertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
                        alertController.addAction(alertAction)
                        self.presentViewController(alertController, animated: true, completion: nil)
                    } else {
                        // Hooray! Let them use the app now.
                        let ailmentVC = self.storyboard?.instantiateViewControllerWithIdentifier("AilmetViewController") as! AilmetViewController
                        self.navigationController?.pushViewController(ailmentVC, animated: true)
                    }
                }
            }
        }
    }
    
    //MARK : UITextField Delegate
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if textField == nameTextField {
            let textEntered: String = (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string)
            let myRegex = "[A-Za-z]*"
            let checkPredicate = NSPredicate(format: "SELF MATCHES %@", myRegex)
            let string = textEntered
            return checkPredicate.evaluateWithObject(string)
        }
        else if textField == mobileTextField {
            let textEntered = (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string)
            if textEntered.characters.count > 10 {
                return false
            }
            let myRegex: String = "[0-9]*"
            let checkPredicate = NSPredicate(format: "SELF MATCHES %@", myRegex)
            
            let string = textEntered
            return checkPredicate.evaluateWithObject(string)
        }
        return true
    }
    
    @IBAction func didBackgroundViewTap(sender: AnyObject) {
        self.view.endEditing(true)
    }
}
