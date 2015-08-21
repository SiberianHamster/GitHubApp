//
//  UserSearchViewController.swift
//  GitHubApp
//
//  Created by Mark Lin on 8/20/15.
//  Copyright (c) 2015 Mark Lin. All rights reserved.
//

import UIKit

class UserSearchViewController: UIViewController {
  
  @IBOutlet weak var userCollection: UICollectionView!
  @IBOutlet weak var UserSearchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
      
      userCollection.dataSource = self
      
      // Do any additional setup after loading the view.
    }
  

}

//Mark: UserSearchViewController CollectionDataSource

extension UserSearchViewController: UICollectionViewDataSource{
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 11
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = userCollection.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! UICollectionViewCell
    
    
    return cell
  }
  
}
