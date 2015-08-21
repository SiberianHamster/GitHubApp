//: Code Challenge: Write a function that takes in an array of numbers, and returns the lowest and highest numbers as a tuple


import UIKit

func giveMeExtremes<T>(randomArray:[T]) -> (T, T){
  var lowest : T
  var highest : T
  highest = randomArray[0]
  lowest = randomArray[0]
  
  for Elements in randomArray {
    if Elements<lowest{lowest = Elements}
    else if Elements > highest{highest = Elements}
    else{}
  
  }
  return (lowest, highest)
}

//var array = [12,1424,11,21,2,1,-123,0,-123,12.4,0.1]
var array = [0]
println(giveMeExtremes(array))


