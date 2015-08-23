//
//  DetailedUserViewController.swift
//  GitHubApp
//
//  Created by Mark Lin on 8/21/15.
//  Copyright (c) 2015 Mark Lin. All rights reserved.
//

import UIKit

class DetailedUserViewController: UIViewController {
  
  @IBOutlet weak var userName: UILabel!
  
  @IBOutlet weak var webLink: UIButton!
  
  @IBOutlet weak var image: UIImageView!
  
        var selectedUser = Users(userName: "temp", userAvatar: "temp", userHTMLURL: "temp", userAvatarImage: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
      image.image = selectedUser.userAvatarImage
      userName.text = selectedUser.userName
      webLink.setTitle(selectedUser.userHTMLURL, forState: nil)
      }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "showWebsite"
    {
      let WebView = segue.destinationViewController as! WebViewController
      WebView.webLink = self.selectedUser.userHTMLURL
    }
  }
}
