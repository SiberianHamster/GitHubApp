//
//  DetailedUserViewController.swift
//  GitHubApp
//
//  Created by Mark Lin on 8/21/15.
//  Copyright (c) 2015 Mark Lin. All rights reserved.
//

import UIKit

class DetailedUserViewController: UIViewController {
  
        var selectedUser = Users(userName: "temp", userAvatar: "temp", userHTMLURL: "temp", userAvatarImage: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
      println(selectedUser.userHTMLURL)
      
      

      
      
        // Do any additional setup after loading the view.
    }
}
