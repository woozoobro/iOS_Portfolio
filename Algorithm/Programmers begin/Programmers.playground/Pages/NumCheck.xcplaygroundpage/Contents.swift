

import Foundation

/*
func solution(_ numer1:Int, _ denom1:Int, _ numer2:Int, _ denom2:Int) -> [Int] {
    guard numer1 >= 0 && numer1 <= 1000, denom1 >= 0 && denom1 <= 1000,
    numer2 >= 0 && numer2 <= 1000, denom2 >= 0 && denom2 <= 1000 else { return [] }
    
    
    let multipliedNumer = numer1 * denom2 + numer2 * denom1
    let multipliedDenom = denom1 * denom2
    
    if multipliedNumer % denom1 == 0 && multipliedDenom % denom1 == 0 {
        return [(multipliedNumer / denom1) , (multipliedDenom / denom1)]
    } else if multipliedNumer % denom2 == 0 && multipliedDenom % denom2 == 0 {
        return [(multipliedNumer / denom2) , (multipliedDenom / denom2)]
    } else {
        return [multipliedNumer, multipliedDenom]
    }
}

solution(1, 2, 3, 4)
solution(9, 2, 1, 3)

solution(1, 1, 1, 1)

solution(2, 4, 4, 9)
*/


let numberArray = [1,2,3,4,5,600000]

solution(numberArray)


func solution(_ numbers:[Int]) -> [Int] {
    guard numbers.count >= 1 && numbers.count < 1000 else { return [] }
    let doubledNumbers = numbers.map { $0 * 2 }
    for i in doubledNumbers {
        if i > 20000 || i < -20000 {
            return []
        }
    }
    return doubledNumbers
}
