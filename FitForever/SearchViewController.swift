//
//  SearchViewController.swift
//  FitForever
//
//  Created by Sahil Mahajan on 17/10/15.
//  Copyright © 2015 Fit Forever. All rights reserved.
//

import UIKit
import SDWebImage

enum SectionType: Int {
    case Doctors
    case HealthTopics
    case Medicine
    case Treatments
    
    var description : String {
        switch self {
        case .Doctors:
            return "DOCTORS"
        case .HealthTopics:
            return "HEALTH TOPICS"
        case .Medicine:
            return "MEDICINE"
        case .Treatments:
            return "TREATMENTS"
        }
    }
    
}

class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

    var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    
    var dataSource : [String: AnyObject]?
    var doctorsList = [AnyObject]()
    var medicineList = [AnyObject]()
    var healthTopicsList = [AnyObject]()
    var treatmentsList = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.searchBarStyle = .Minimal
        searchBar.placeholder = "Search for Ailment, Medicine & Doctors"
        self.navigationItem.titleView = searchBar
        
        fetchRecordsForSearch()
        searchTableView.registerNib(UINib(nibName: "DoctorCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "DoctorCellIdentifier")
        searchTableView.registerNib(UINib(nibName: "HealthTopicSearchCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "HealthTopicSearchCellIdentifier")
        searchTableView.registerNib(UINib(nibName: "MedicineTreatmentCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "MedicineTreatmentCellIdentifier")
        searchTableView.estimatedRowHeight = 150.0
        searchTableView.rowHeight = UITableViewAutomaticDimension
        searchTableView.backgroundColor = colorR237G242B245
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func fetchRecordsForSearch() {
        if  dataSource == nil {
            do {
                let jsonData = try NSData(contentsOfFile:  NSBundle.mainBundle().pathForResource("search_data", ofType: "json")!, options: .DataReadingMappedAlways)
                dataSource =  try NSJSONSerialization.JSONObjectWithData(jsonData, options: .MutableContainers) as? [String : AnyObject]
            }
            catch let error as NSError {
                print(error)
            }
        }
        if let data = dataSource {
            doctorsList = data["doctors"] as! [AnyObject]
            medicineList = data["medicines"] as! [AnyObject]
            treatmentsList = data["treatments"] as! [AnyObject]
            healthTopicsList = data["topics"] as! [AnyObject]
        }
    }

    @IBAction func didBackgroundButtonTap(sender: AnyObject) {
        searchBar.resignFirstResponder()
        self.view.endEditing(true)
    }

    //MARK: Search Bar Delegate Methods
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        fetchRecordsForSearch()
        if !searchText.isEmpty {
            searchDataInDataSource(searchText)
        }
        searchTableView.reloadData()
    }
    
    func searchDataInDataSource(searchText: String) {
        let docPredicate = NSPredicate(format: "name contains [cd] %@ OR %K contains [cd] %@ OR %K contains [cd] %@", searchText, "spec", searchText, "loc", searchText)
        doctorsList = doctorsList.filter( {docPredicate.evaluateWithObject($0)})
        
        let healthPredicate = NSPredicate(format: "%K contains [cd] %@ OR %K contains [cd] %@", "title", searchText, "desc", searchText)
        healthTopicsList = healthTopicsList.filter( {healthPredicate.evaluateWithObject($0)})
        
        let medPredicate = NSPredicate(format: "SELF contains [cd] %@", searchText)
        medicineList = medicineList.filter( {medPredicate.evaluateWithObject($0)})
        
        let treatmentPredicate = NSPredicate(format: "SELF contains [cd] %@", searchText)
        treatmentsList = treatmentsList.filter( {treatmentPredicate.evaluateWithObject($0)})
    }
    
    //MARK: TableView DataSource and Delegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return SectionType.Treatments.rawValue+1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = SectionType(rawValue: section)!
        switch sectionType {
        case .Doctors:
            return doctorsList.count
        case .HealthTopics:
            return healthTopicsList.count
        case .Medicine:
            return medicineList.count
        case .Treatments:
            return treatmentsList.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch SectionType(rawValue: indexPath.section)! {
        case .Doctors:
            let cell = tableView.dequeueReusableCellWithIdentifier("DoctorCellIdentifier", forIndexPath: indexPath) as! DoctorCell
            let dict = doctorsList[indexPath.row] as! [String : String]
            cell.doctorName.text = dict["name"]
            cell.doctorProfilePic.sd_setImageWithURL(NSURL(string: dict["img"]!)!)
            cell.doctorCategory.text = dict["spec"]
            cell.location.text = dict["loc"]
            return cell
        case .HealthTopics:
            let cell = tableView.dequeueReusableCellWithIdentifier("HealthTopicSearchCellIdentifier", forIndexPath: indexPath) as! HealthTopicSearchCell
            let dict = healthTopicsList[indexPath.row] as! [String : String]
            cell.healthTopicTitleLabel.text = dict["title"]
            cell.healthTopicImageView.sd_setImageWithURL(NSURL(string: dict["img"]!)!)
            var desc = dict["desc"]!
            if desc.characters.count > 40 {
                desc = desc.substringToIndex(desc.startIndex.advancedBy(40))
            }
            
            let attributedDesc = NSMutableAttributedString(string: desc)
            let seeMoreString = NSAttributedString(string: " See More...", attributes: [NSForegroundColorAttributeName : colorR118G165B68])
            attributedDesc.appendAttributedString(seeMoreString)
            cell.healthTopicDescriptionLabel.attributedText = attributedDesc
            
            return cell
        case .Medicine:
            let cell = tableView.dequeueReusableCellWithIdentifier("MedicineTreatmentCellIdentifier", forIndexPath: indexPath) as! MedicineTreatmentCell
            let medicine = medicineList[indexPath.row] as! String
            cell.medicineOrTreatmentNameLabel.text = medicine
            return cell
        case .Treatments:
            let cell = tableView.dequeueReusableCellWithIdentifier("MedicineTreatmentCellIdentifier", forIndexPath: indexPath) as! MedicineTreatmentCell
            let treatment = treatmentsList[indexPath.row] as! String
            cell.medicineOrTreatmentNameLabel.text = treatment
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch SectionType(rawValue: section)! {
        case .Doctors:
            return doctorsList.count > 0 ? 44.0 : 0.0
        case .Medicine:
            return medicineList.count > 0 ? 44.0 : 0.0
        case .HealthTopics:
            return healthTopicsList.count > 0 ? 44.0 : 0.0
        case .Treatments:
            return treatmentsList.count > 0 ? 44.0 : 0.0
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRectMake(0.0, 0.0, tableView.frame.size.width,44.0))
        headerView.backgroundColor = colorR237G242B245
        let sectionLabel = UILabel(frame: CGRectMake(5.0, 20.0, headerView.frame.size.width, headerView.frame.size.height-20))
        let section = SectionType(rawValue: section)!
        sectionLabel.text = section.description
        sectionLabel.textAlignment = NSTextAlignment.Left
        sectionLabel.font = fontHelveticaNeusMedium14
        sectionLabel.textColor = colorRGB155
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
}
