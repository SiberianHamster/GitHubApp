//
//  GithubServices.swift
//  GitHubApp
//
//  Created by Mark Lin on 8/18/15.
//  Copyright (c) 2015 Mark Lin. All rights reserved.
//

import Foundation

class GithubServices {
  
  class func repositoriesForSearchTerm(searchTerm : String, completionHandler:([Repositories])->(Void)){
    
    let baseURL = "https://api.github.com/search/repositories"
    let finalURL = baseURL + "?q=\(searchTerm)"
    var somethingcool : [Repositories]=[]
    if let url = NSURL(string: finalURL){
      NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
        if let error = error{
          println("error: \(error)")
        }else if let httpResponse = response as? NSHTTPURLResponse{
          println("response assignation successful: \(httpResponse.statusCode)")

         let Repo = GithubJSONParser.repositoryFromJSONData(data)

          completionHandler(Repo!)
          
        }
      }).resume()
    }

  }
}
