//
//  ProfileViewController.swift
//  FitForever
//
//  Created by Sahil Mahajan on 17/10/15.
//  Copyright © 2015 Fit Forever. All rights reserved.
//

import UIKit
import Parse
import MBProgressHUD

enum ProfileSection: Int {
    case PersonalInfo
    case ContactInfo
    case ChangePassword
    case Signout
    case LinkedAccount
    
    var description: String {
        switch self {
        case .PersonalInfo:
            return "PERSONAL INFORMATION"
        case .ContactInfo:
            return "CONTACT INFORMATION"
        case .ChangePassword:
            return ""
        case .Signout:
            return ""
        case .LinkedAccount:
            return "LINKED ACCOUNTS"
        }
    }
    
    static var count: Int { return ProfileSection.LinkedAccount.hashValue + 1}
}

enum PersonalDetail: Int {
    case FullName
    case UserName
    case DOB
    
    var description: String {
        switch self {
        case .FullName:
            return "Full Name"
        case .UserName:
            return "Username"
        case .DOB:
            return "Date Of Birth"
        }
    }
    
    var tag: Int {
        switch self {
        case .FullName:
            return 111
        case .UserName:
            return 112
        case .DOB:
            return 113
        }
    }
    
    static var count: Int { return PersonalDetail.DOB.hashValue + 1}
}

enum ContactDetail: Int {
    case Email
    case Phone
    
    var description: String {
        switch self {
        case .Email:
            return "Email"
        case .Phone:
            return "Phone Number"
        }
    }
    var tag: Int {
        switch self {
        case .Email:
            return 211
        case .Phone:
            return 212
        }
    }
    
    static var count: Int { return ContactDetail.Phone.hashValue + 1}
}

let profileCellIdentifier = "ProfileTableViewCellIdentifier"
let dobPickerContainerHeight: CGFloat = 260.0
let kHeaderImageHeight: CGFloat = 250.0

class ProfileViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate{

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileTableView: UITableView!
    @IBOutlet weak var tableViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var dobPickerView: UIDatePicker!
    @IBOutlet weak var dobContianerView: UIView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var isfacebookAccountLinked = false
    var fullName: String?
    var dob: String?
    var mobileNo: String?
    var email: String?
    var userName: String?
    var isTyping = false
    var headerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.enabled = isTyping

        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
        if let currentUser = PFUser.currentUser() {
            fullName = currentUser[kUserFullName] as? String
            userName = currentUser.username
            email = currentUser.email
            mobileNo = currentUser[kUserPhoneKey] as? String
            dob = currentUser[kUserDOBKey] as? String
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark: TableView DataSource and Delegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return  isfacebookAccountLinked ? ProfileSection.count : ProfileSection.count - 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch ProfileSection(rawValue: section)! {
        case .PersonalInfo:
            return PersonalDetail.count
        case .ContactInfo:
            return ContactDetail.count
        case .ChangePassword:
            return 1
        case .Signout:
            return 1
        case .LinkedAccount:
            return 1
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRectMake(0.0, 0.0, tableView.frame.size.width, 44.0))
        headerView.backgroundColor = colorRGB244
        headerView.layer.borderColor = colorRGB197.CGColor
        headerView.layer.borderWidth = 0.5
        let sectionLabel = UILabel(frame: CGRectMake(12.0, 20.0, headerView.frame.size.width, headerView.frame.size.height-20))
        let profileSec = ProfileSection(rawValue: section)!
        sectionLabel.text = profileSec.description
        sectionLabel.textAlignment = NSTextAlignment.Left
        sectionLabel.font = fontHelveticaNeusMedium14
        sectionLabel.textColor = colorR118G165B68
        headerView.addSubview(sectionLabel)
        return headerView
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.5
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView(frame: CGRectMake(0.0, 0.0, tableView.frame.size.width, 0.5))
        footer.backgroundColor = colorRGB197
        return footer
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch ProfileSection(rawValue: indexPath.section)! {
        case .PersonalInfo:
            let personalInfotype = PersonalDetail(rawValue: indexPath.row)!
            let cell = tableView.dequeueReusableCellWithIdentifier(profileCellIdentifier, forIndexPath: indexPath) as! ProfileTableViewCell
            cell.profileTextField.tag = personalInfotype.tag
            switch personalInfotype {
            case .FullName:
                cell.profileTextField.text = fullName
            case .UserName:
                cell.profileTextField.text = userName
            case .DOB:
                cell.profileTextField.text = dob
            }
            if cell.profileTextField.text != nil {
                cell.profileTextField.placeholder = personalInfotype.description
            }
            cell.profileTextField.delegate = self
            return cell
        case .ContactInfo:
            let contactInfo = ContactDetail(rawValue: indexPath.row)!
            let cell = tableView.dequeueReusableCellWithIdentifier(profileCellIdentifier, forIndexPath: indexPath) as! ProfileTableViewCell
            cell.profileTextField.tag = contactInfo.tag
            switch contactInfo {
            case .Email:
                cell.profileTextField.text = email
            case .Phone:
                cell.profileTextField.text = mobileNo
            }
            if cell.profileTextField.text != nil {
                cell.profileTextField.placeholder = contactInfo.description
            }
            cell.profileTextField.delegate = self
            return cell
        case .ChangePassword:
            let cell = tableView.dequeueReusableCellWithIdentifier("ChangePasswordCellIdentifier", forIndexPath: indexPath)
            cell.textLabel?.text = "Change Password"
            cell.textLabel?.textColor = colorR118G165B68
            cell.textLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 15.0)
            return cell
        case .Signout:
            let cell = tableView.dequeueReusableCellWithIdentifier("SignOutCellIdentifier", forIndexPath: indexPath)
            cell.textLabel?.text = "Sign Out"
            cell.textLabel?.textColor = colorR118G165B68
            cell.textLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 15.0)
            return cell
        case .LinkedAccount:
            let cell = tableView.dequeueReusableCellWithIdentifier("LinkedAccountCellIdentifier", forIndexPath: indexPath)
            let button = cell.viewWithTag(311) as? UIButton
            button?.addTarget(self, action: Selector("didUnlinkAccountTap"), forControlEvents: UIControlEvents.TouchUpInside)
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let tableSection = ProfileSection(rawValue: indexPath.section)!
        if tableSection == .Signout {
            MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            PFUser.logOut()
            self.dismissViewControllerAnimated(true, completion: nil)
            let loginVC = UIStoryboard.loginStoryBoard().instantiateInitialViewController()
            self.view.window?.rootViewController = loginVC
        }
    }
    
    func loadPickerForDOB() {
        self.view.endEditing(true)
        didShowPickerView(true)
        
        if let dob = dob {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd-MMM-yyyy"
            dobPickerView.date = dateFormatter.dateFromString(dob)!
        }
        profileTableView.selectRowAtIndexPath(NSIndexPath(forRow: PersonalDetail.FullName.rawValue, inSection: ProfileSection.PersonalInfo.rawValue), animated: true, scrollPosition: .Middle)
        let currentDate = NSDate()
        let componentFlags = NSCalendarUnit.Year
        let maxComponents = NSCalendar.currentCalendar().components(componentFlags, fromDate: currentDate)
        maxComponents.year = 0
        let maxDate = NSCalendar.currentCalendar().dateByAddingComponents(maxComponents, toDate: currentDate, options: NSCalendarOptions.WrapComponents)
        dobPickerView.maximumDate = maxDate
        
        dobPickerView.addTarget(self, action: Selector("dataPickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    @IBAction func dataPickerChanged(datePicker: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        dob = dateFormatter.stringFromDate(datePicker.date)
    }
    
    @IBAction func didPickerCancelButtonTap(sender: AnyObject) {
        didShowPickerView(false)
    }
    
    @IBAction func didPickerDoneButtonTap(sender: AnyObject) {
        didShowPickerView(false)
        profileTableView.reloadRowsAtIndexPaths([NSIndexPath(forRow: PersonalDetail.DOB.rawValue, inSection: ProfileSection.PersonalInfo.rawValue)], withRowAnimation: UITableViewRowAnimation.None)
    }
    
    func didShowPickerView(show: Bool) {
        tableViewBottomConstraint.constant = show ? dobPickerContainerHeight : 0.0
        dobContianerView.hidden = !show
        UIView.animateWithDuration(0.25, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
    }
    
    func didUnlinkAccountTap() {
        
    }
    
    //MARK: TextField Delegate Callbacks
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        isTyping = true
        saveButton.enabled = isTyping
        if textField.tag == PersonalDetail.DOB.tag {
            loadPickerForDOB()
            return false
        }
        else {
            return true
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if PersonalDetail.FullName.tag == textField.tag {
            let textEntered: String = (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string)
            let myRegex = "[A-Z a-z]*"
            let checkPredicate = NSPredicate(format: "SELF MATCHES %@", myRegex)
            let string = textEntered
            return checkPredicate.evaluateWithObject(string)
        }
        else if ContactDetail.Phone.tag == textField.tag {
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
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if PersonalDetail.FullName.tag == textField.tag {
            fullName = textField.text
        }
        else if PersonalDetail.UserName.tag == textField.tag {
            userName = textField.text
        }
        else if ContactDetail.Phone.tag == textField.tag {
            mobileNo = textField.text
        }
        else if ContactDetail.Email.tag == textField.tag {
            email = textField.text
        }
    }
    
    @IBAction func didSaveButtonTap(sender: AnyObject) {
        self.view.endEditing(true)
        if let fullName = fullName, userName = userName, mobileNo = mobileNo, email = email where !fullName.isEmpty && !userName.isEmpty && !mobileNo.isEmpty && !email.isEmpty {
            if let currentUser = PFUser.currentUser() {
                currentUser[kUserFullName] = fullName
                currentUser.email = email
                currentUser[kUserPhoneKey] = mobileNo
                currentUser.username = userName
                if let dob = dob {
                    currentUser[kUserDOBKey] = dob
                }
                currentUser.saveInBackgroundWithBlock({ (success: Bool, error: NSError?) -> Void in
                    if success {
                        self.navigationController?.popViewControllerAnimated(true)
                    }
                    else {
                        let alertController = UIAlertController(title: "Error", message: error?.description, preferredStyle: UIAlertControllerStyle.Alert)
                        let alertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
                        alertController.addAction(alertAction)
                        self.presentViewController(alertController, animated: true, completion: nil)
                    }
                })
            }
        }
        else {
            //Show Alert
            let alertController = UIAlertController(title: "Error", message: "Missing required fields.", preferredStyle: UIAlertControllerStyle.Alert)
            let alertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            alertController.addAction(alertAction)
            presentViewController(alertController, animated: true, completion: nil)
            return
        }
    }
    
    //MARK: UIKeyboard Notification
    func keyboardWillShow(aNotif: NSNotification) {
        if let userInfo = aNotif.userInfo {
            if let keyboardHeight = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue.size.height {
                tableViewBottomConstraint.constant = keyboardHeight
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
    func keyboardWillHide(aNotif: NSNotification) {
        tableViewBottomConstraint.constant = 0.0
        UIView.animateWithDuration(0.25, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    //MARK: TapGesture Callback
    @IBAction func didBackGroundViewTap(sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    @IBAction func didImageViewTap(sender: AnyObject) {
        saveButton.enabled = true
        
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.delegate = self
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            imagePickerVC.sourceType = UIImagePickerControllerSourceType.Camera
        }
        else {
            imagePickerVC.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        imagePickerVC.editing = true
        presentViewController(imagePickerVC, animated: true, completion: nil)
    }
    
    //MARK: ImagePicker Delegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        profileImageView.image = image
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func didCancelButtonTap(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        UIView.animateWithDuration(0.2) { () -> Void in
            var tableRect = self.profileTableView.frame
            var headerRect = self.profileImageView.frame
            if headerRect.size.height > kHeaderImageHeight {
                headerRect.size.height = kHeaderImageHeight
                self.profileImageView.frame = headerRect
                tableRect.origin.y = self.profileImageView.frame.height+self.profileImageView.frame.origin.y
                tableRect.size.height = UIScreen.mainScreen().bounds.height - tableRect.origin.y
                self.tableViewBottomConstraint.constant = 0.0
                self.profileTableView.frame = tableRect
            }
        }
    }
    
    func updateHeaderView() {

        var tableRect = profileTableView.frame
        var headerRect = profileImageView.frame
       
        if profileTableView.panGestureRecognizer.translationInView(profileTableView).y > 0  || tableRect.size.height < profileTableView.contentSize.height {
            headerRect.size.height += -profileTableView.contentOffset.y
            profileImageView.frame = headerRect
            tableRect.origin.y += -profileTableView.contentOffset.y
            tableRect.size.height -= -profileTableView.contentOffset.y
        }
        profileTableView.frame = tableRect
    }
}