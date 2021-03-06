//
//  WebViewController.swift
//  GitHubApp
//
//  Created by Mark Lin on 8/23/15.
//  Copyright (c) 2015 Mark Lin. All rights reserved.
//

import UIKit
import WebKit


class WebViewController: UIViewController {

  var webLink = "nil"
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      let webView = WKWebView(frame: view.frame)
      view.addSubview(webView)
      
      let urlRequest = NSURLRequest(URL: NSURL(string: "\(webLink)")!)
      webView.loadRequest(urlRequest)
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
