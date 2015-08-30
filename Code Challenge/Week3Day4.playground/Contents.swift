//: Code Challenge: Given a string, return a string where for every char in the original, there are two chars.

//Example: doubleChar("The") → "TThhee"

import UIKit

func printEachCharTwice(originalString: String) -> String{
  var newString: String = ""
  
  for char in originalString{
    newString.append(char)
    newString.append(char)
  }
  
  return newString
}

var originalStringToFunkify = "Hi This is a String"
println(printEachCharTwice(originalStringToFunkify))