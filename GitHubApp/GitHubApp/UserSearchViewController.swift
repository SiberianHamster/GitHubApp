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

  var usersItems = [Users]()
  
  lazy var imageQueue = NSOperationQueue()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      UserSearchBar.delegate = self
      userCollection.dataSource = self
      userCollection.delegate = self
      
      // Do any additional setup after loading the view.
    }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "detailedUserSegue" {
      
        let destinationViewController = segue.destinationViewController as! DetailedUserViewController
        let selectedUser = userCollection.indexPathForCell(UserCollectionViewCell)
        let passedUser = usersItems[selectedUser.row]
        destinationViewController.selectedUser = passedUser
      
  }
  }
}


//Mark: UserSearchViewController CollectionDataSource

extension UserSearchViewController: UICollectionViewDataSource{
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return usersItems.count
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = userCollection.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! UserCollectionViewCell
    cell.tag++
    let tag = cell.tag
    var users = usersItems[indexPath.row]
    if let profileImage = users.userAvatarImage
    {
      cell.image.image = profileImage
    }
    
    else{
      imageQueue.addOperationWithBlock({ () -> Void in
        if let imageURL = NSURL(string:users.userAvatar),
        imageData = NSData(contentsOfURL: imageURL),
          image = UIImage(data: imageData){
            var size : CGSize
                          switch UIScreen.mainScreen().scale{
                          case 2:
                            size = CGSize(width: 160, height: 160)
                          case 3:
                            size = CGSize(width: 240, height: 240)
                          default:
                            size = CGSize(width: 80, height: 80)
                       
                            }
              let resizedImage = ImageResizer.resizeImage(image, size: size)
              NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                users.userAvatarImage = resizedImage
                self.usersItems[indexPath.row] = users
                if cell.tag == tag {
                  cell.image.image = resizedImage
                  
                }
              })
          }
        })
      }
      return cell
      
    }
}

extension UserSearchViewController: UICollectionViewDelegate{
}

//Mark: UserSearchViewController SearchBarDelegate
extension UserSearchViewController: UISearchBarDelegate{
  
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    println("Searching")
    
    GithubServices.usersForSearchTerm(UserSearchBar.text, completionHandler: { (Users) -> (Void) in
      
      NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
        self.usersItems = Users
        self.userCollection.reloadData()
        println("users count \(self.usersItems.count)")
        
      })
      
      
    })
    
  }

}