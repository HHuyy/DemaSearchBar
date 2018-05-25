//
//  TableViewController.swift
//  DemaSearchBar
//
//  Created by tham gia huy on 5/19/18.
//  Copyright © 2018 tham gia huy. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UISearchResultsUpdating {
    var arrayString = ["San Francisco","New York","San Jose","Chicago","Los Angeles","Austin","Seattle"]
    let searchController = UISearchController(searchResultsController: nil)
    var filtered = [String]()
    
//    var searchActive: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filtered = arrayString
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text == "" {
            filtered = arrayString
        } else {
            filtered = arrayString.filter { $0.contains(searchController.searchBar.text!) }
        }
        tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filtered.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = filtered[indexPath.row]
        return cell
    }

}
