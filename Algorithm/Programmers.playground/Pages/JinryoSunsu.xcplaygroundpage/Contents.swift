//: [Previous](@previous)

import Foundation

func solution(_ emergency:[Int]) -> [Int] {
    
    return emergency.map { data in
        emergency.filter { $0 > data }.count + 1
    }
}


