//: Code Challenge: Write a function that takes in an array of numbers, and returns the lowest and highest numbers as a tuple


import UIKit

func giveMeExtremes<T:Comparable>(userArray: [T])-> (min: T, max: T) {
    
    var lowest = userArray[0]
    var highest = userArray[0]
    for Elements in userArray{
  
  if Elements < lowest {
    lowest = Elements
  } else {
    if Elements > highest {
      highest = Elements
    } else {
    }
  }
}
  return (lowest, highest)
}



var myArray = [12,1424,11,21,2,1,-123,0,-123,12.0,0.1]
var myArray2 = ["Fish","Alphalpha", "Taco", "alphalpha", "hotdog","Hotdog"]
println(giveMeExtremes(myArray))
println(giveMeExtremes(myArray2))



