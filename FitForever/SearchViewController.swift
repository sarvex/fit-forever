//
//  SearchViewController.swift
//  FitForever
//
//  Created by Sahil Mahajan on 17/10/15.
//  Copyright © 2015 Fit Forever. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {

    var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.searchBarStyle = .Minimal
        searchBar.placeholder = "Search for Ailment, Medicine & Doctors"
        self.navigationItem.titleView = searchBar
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didBackgroundButtonTap(sender: AnyObject) {
        searchBar.resignFirstResponder()
        self.view.endEditing(true)
    }

}
