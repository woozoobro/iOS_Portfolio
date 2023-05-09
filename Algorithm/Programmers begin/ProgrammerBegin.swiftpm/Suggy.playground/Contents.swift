import UIKit

// str1 = str2

func solution(_ str1:String, _ str2:String) -> String {
    var result = ""
    let minLength = min(str1.count, str2.count)
    
    for i in 0..<minLength {
        result.append(str1[str1.index(str1.startIndex, offsetBy: i)])
        result.append(str2[str2.index(str2.startIndex, offsetBy: i)])
    }
    return result
}

//func solution2(_ str1: String, _ str2: String) -> String {
//    return zip(str1, str2).map { String($0) + String($1) }.joined()
//}

func solution2(_ str1: String, _ str2: String) -> String {
    zip(str1, str2).map{ String($0) + String($1) }.joined()
}
