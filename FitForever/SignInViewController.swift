//
//  ViewController.swift
//  FitForever
//
//  Created by Sahil Mahajan on 05/10/15.
//  Copyright © 2015 Fit Forever. All rights reserved.
//

import UIKit
import Parse
import MBProgressHUD

class SignInViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        userNameTextField.text = nil
        passwordTextField.text = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: IBActions
    @IBAction func didSignInButtonTap(sender: AnyObject) {
        guard let username = userNameTextField.text, let password = passwordTextField.text where !username.isEmpty && !password.isEmpty else {
            let alertController = UIAlertController(title: "Error", message: "Email or Password can't be left blank", preferredStyle: UIAlertControllerStyle.Alert)
            let alertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            alertController.addAction(alertAction)
            presentViewController(alertController, animated: true, completion: nil)
            return
        }
       
        let progressView = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        progressView.labelText = "Signing In..."
        
        PFUser.logInWithUsernameInBackground(username, password: password) {
            (user: PFUser?, error: NSError?) -> Void in
            MBProgressHUD.hideHUDForView(self.view, animated: true)
            if user != nil {
                // Do stuff after successful login.
                let ailmentVC = self.storyboard?.instantiateViewControllerWithIdentifier("AilmetViewController") as! AilmetViewController
                self.navigationController?.pushViewController(ailmentVC, animated: true)
            } else {
                // The login failed. Check error to see why.
                let alertController = UIAlertController(title: "Error", message: error?.description, preferredStyle: UIAlertControllerStyle.Alert)
                let alertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
                alertController.addAction(alertAction)
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
    }

    @IBAction func didTwitterLoginButtonTap(sender: AnyObject) {
        
    }
    
    @IBAction func didFbLoginButtonTap(sender: AnyObject) {
        
    }
    
    @IBAction func didSignUpButtonTap(sender: AnyObject) {
        let signUpVC = self.storyboard?.instantiateViewControllerWithIdentifier("SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    //MARK : UITapGesture Event
    @IBAction func didBackgroundViewTap(sender: AnyObject) {
        self.view.endEditing(true)
    }
}

