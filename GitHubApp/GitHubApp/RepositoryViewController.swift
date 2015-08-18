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
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
        SearchBar.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

}

extension RepositoryViewController: UISearchBarDelegate{
  
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    println("Searching")
    
    GithubServices.repositoriesForSearchTerm(SearchBar.text)
  
  
}
}
