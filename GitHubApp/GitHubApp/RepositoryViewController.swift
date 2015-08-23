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
  
  var repositoryItems = [Repositories]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
        SearchBar.delegate = self
        repoTable.dataSource = self
//        repoTable.delegate = self
      navigationController?.delegate = self
      
      

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
    let cell = repoTable.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
    let repo = self.repositoryItems[indexPath.row]
    cell.repoName.text = repo.name
    cell.repoURL.text = repo.repoURL
    return cell
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return repositoryItems.count
  }
  
}

////Mark: RepositoryViewController TableViewDelegate
//extension RepositoryViewController: UITableViewDelegate{
//  func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return toVC is DetailedUserViewController ? ToUserDetailAnimationController() : nil
//  }
//}

//Mark: RepositoryViewController SearchBarDelegate
extension RepositoryViewController: UISearchBarDelegate{
  
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    println("Searching")
    
    GithubServices.repositoriesForSearchTerm(SearchBar.text, completionHandler: { (aRepo) -> (Void) in
   
      NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
        self.repositoryItems = aRepo
      self.repoTable.reloadData()
      println("repositories count \(self.repositoryItems.count)")
      })
      
      
      })

}
}

//Mark: RepositoryViewController NavigationControllerDelegate
extension RepositoryViewController: UINavigationControllerDelegate{
  
}
