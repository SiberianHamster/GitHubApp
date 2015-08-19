//
//  RepositoryViewController.swift
//  GitHubApp
//
//  Created by Mark Lin on 8/18/15.
//  Copyright (c) 2015 Mark Lin. All rights reserved.
//

import UIKit

class RepositoryViewController: ViewController {

  @IBOutlet weak var SearchBar: UISearchBar!
  
  @IBOutlet weak var repoTable: UITableView!
  
  var repositoryItems:[Repositories] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
        SearchBar.delegate = self
        self.repoTable.dataSource = self
        repoTable.delegate = self
      

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

}
//Mark: RepositoryViewController TableViewDataSource
extension RepositoryViewController: UITableViewDataSource{
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = repoTable.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
    
    return cell
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return repositoryItems.count
  }
  
}

//Mark: RepositoryViewController TableViewDelegate
extension RepositoryViewController: UITableViewDelegate{
}

//Mark: RepositoryViewController SearchBarDelegate
extension RepositoryViewController: UISearchBarDelegate{
  
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    println("Searching")
    
    repositoryItems = GithubServices.repositoriesForSearchTerm(SearchBar.text)
    println("repositoryItems \(repositoryItems.count)")
    
  
  
}
}
