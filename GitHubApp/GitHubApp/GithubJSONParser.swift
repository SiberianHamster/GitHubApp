//
//  GithubJSONParser.swift
//  GitHubApp
//
//  Created by Mark Lin on 8/18/15.
//  Copyright (c) 2015 Mark Lin. All rights reserved.
//

import Foundation

class GithubJSONParser{
  class func repositoryFromJSONData(jsonData: NSData) -> [Repositories]?{
    var error : NSError?
    
    if let rootObject = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &error) as? [ String : AnyObject ]{
      var repository = [Repositories]()

      if let items = rootObject["items"] as? [[String : AnyObject]]
        {

          for item in items{
            println("loop")
           if let repoName = item["name"] as? String,
           repoURL = item["html_url"] as? String
          {
            let repo = Repositories(name: repoName, repoURL: repoURL)
            repository.append(repo)
           
          }
        }
          println("jsoncount\(repository.count)")
          return repository
      }
    }
  return nil}
  
  }

