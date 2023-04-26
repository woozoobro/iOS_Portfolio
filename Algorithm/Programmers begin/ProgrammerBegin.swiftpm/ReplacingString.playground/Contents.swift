import UIKit

/*
 my_string, overwrite_string이 주어지고, 정수 s가 주어진다. 문자열 my_string의 s 인덱스부터 overwrite_string의 길이만큼
 문자열을 추가해버린 string을 반환하는 함수 작성하기
 */


func solution(_ my_string:String, _ overwrite_string:String, _ s:Int) -> String {
    let prefix = my_string.prefix(s)
    let suffix = my_string.suffix(from: my_string.index(my_string.startIndex, offsetBy: s))
    
    return prefix + overwrite_string + suffix
}

