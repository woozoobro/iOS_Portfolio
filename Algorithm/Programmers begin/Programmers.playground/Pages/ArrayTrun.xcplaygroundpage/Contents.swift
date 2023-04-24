//: [Previous](@previous)

import Foundation

func solution(_ numbers:[Int], _ direction:String) -> [Int] {
    var numbersArray = numbers
    
    let firstElement = numbersArray[0]
    let lastElement = numbersArray[numbers.count - 1]
    
    if direction == "left" {
        numbersArray.append(firstElement)
        numbersArray.remove(at: 0)
        return numbersArray
    } else if direction == "right" {
        numbersArray.removeLast()
        numbersArray.insert(lastElement, at: 0)
        return numbersArray
    } else {
        return []
    }
}


