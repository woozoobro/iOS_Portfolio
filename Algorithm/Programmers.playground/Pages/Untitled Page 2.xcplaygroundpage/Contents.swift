import Foundation

func solution(_ numer1:Int, _ denom1:Int, _ numer2:Int, _ denom2:Int) -> [Int] {
    guard numer1 >= 0 && numer1 <= 1000, denom1 >= 0 && denom1 <= 1000,
    numer2 >= 0 && numer2 <= 1000, denom2 >= 0 && denom2 <= 1000 else { return [] }
    
    let multipliedNumer = numer1 * denom2 + numer2 * denom1
    let multipliedDenom = denom1 * denom2
    var gcdNumber = gcd(multipliedNumer, multipliedDenom)
    
    return [multipliedNumer / gcdNumber, multipliedDenom / gcdNumber]
}

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return gcd(b, a%b)
}

solution(6, 20, 3, 4)
