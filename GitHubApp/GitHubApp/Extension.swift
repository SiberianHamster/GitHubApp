//
//  Extension.swift
//  GitHubApp
//
//  Created by Mark Lin on 8/23/15.
//  Copyright (c) 2015 Mark Lin. All rights reserved.
//

import Foundation


extension String {
  func validateForURL() -> Bool {
    
    var error : NSError?
    
    if let regex = NSRegularExpression(pattern: "[^0-9a-zA-Z\n]", options: nil, error: &error){
      let matches = regex.numberOfMatchesInString(self, options: nil, range:NSRange(location: 0, length: count(self)))
      
      return matches > 0 ?  false : true
    }
    return false
    
  }
}