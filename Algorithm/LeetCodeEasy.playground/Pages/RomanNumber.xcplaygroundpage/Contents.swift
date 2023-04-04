//: [Previous](@previous)

import Foundation

// "LVIII" = 58   "MCMXCIV" = 1994   "III" = 3
class Solution {
    func romanToInt(_ s: String) -> Int {
        var result = 0
        var prev = 0
        
        for c in s {
            let curr = getNumber(c)
            if curr > prev {
                result = result - 2 * prev
            }
            
            result = result + curr
            prev = curr
        }
        return result
    }
    
    func getNumber(_ c: Character) -> Int {
        switch c {
        case "I": return 1
        case "V": return 5
        case "X": return 10
        case "L": return 50
        case "C" : return 100
        case "D" : return 500
        case "M" : return 1000
        default : return 0
        }
    }
}

let solution = Solution()
solution.romanToInt("IV")



//: [Next](@next)
