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
         let Repo = GithubJSONParser.repositoryFromJSONData(data)
          completionHandler(Repo!)
        }
      }).resume()
    }
  }
  
  class func usersForSearchTerm(searchTerm : String, completionHandler:([Users])->(Void)){
    
    let baseURL = "https://api.github.com/search/users"
    let finalURL = baseURL + "?q=\(searchTerm)"
    
    if let url = NSURL(string: finalURL){
      NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
        if let error = error{
          println("error:\(error)")
        }else
          if let httpResponse = response as? NSHTTPURLResponse{
            println(httpResponse)
            let users = GithubJSONParser.usersFromJSONParserData(data)
            completionHandler(users!)
        }
      }).resume()
    }
  }
}
