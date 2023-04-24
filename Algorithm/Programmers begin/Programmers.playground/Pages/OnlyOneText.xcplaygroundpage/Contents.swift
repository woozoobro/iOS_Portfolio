//: [Previous](@previous)

import Foundation

func solution(_ s:String) -> String {
    
    var charFrequency = [Character: Int]()
    for char in s {
        charFrequency[char, default: 0] += 1
    }
    let uniqueChars = charFrequency.filter { $0.value == 1}.keys.sorted()
    
    return String(uniqueChars)
}
solution("alskdjf")
