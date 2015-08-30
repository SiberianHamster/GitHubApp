//: Code Challenge: Given a non-negative number "num", return true if num is within 2 of a multiple of 10. Note: (a % b) is the remainder of dividing a by b, so (7 % 5) is 2

import UIKit


func amICloseToATens(numberInQuestion: Int)->Bool{
  
  var results: Bool
  var modol = numberInQuestion%10
  
  if modol < 3 || modol > 7 { results = true }
  else {results = false}
  
return results
}


var num = 12
println(amICloseToATens(num))
var num2 = 13
println(amICloseToATens(num2))
var num3 = 9
println(amICloseToATens(num3))
var num4 = 0
println(amICloseToATens(num4))