//: Code Challenge: Given an array of ints of odd length, return a new array length 3 containing the elements from the middle of the array. The array length will be at least 3.

import UIKit

func giveMeTheMiddleThree(myArray: [Int])->([Int]){

  var newArray = myArray
  while newArray.count != 3{
    newArray.removeLast()
    newArray.removeAtIndex(0)
  }
  
  return newArray
}

var myOddArray = [12,11,12,22,11, 33, 55]
println(giveMeTheMiddleThree(myOddArray))

