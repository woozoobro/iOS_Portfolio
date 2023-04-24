
//MARK: - add
func add(_ num1: Int, _ num2: Int) -> Int {
    guard -50000...50000 ~= num1, -50000...50000 ~= num2 else { return -1}
    return num1 + num2
}

//MARK: - divide

func divide(_ num1: Int, _ num2: Int) -> Int {
    
    guard num1 > 0 && num1 <= 100, num2 > 0 && num2 <= 100  else { return -1 }
    
    return num1 % num2
}



func divide2(_ num1: Int, _ num2: Int) -> Int {
    
    guard num1 > 0, num1 <= 100, num2 > 0, num2 <= 100 else {return 0}
    
    return num1 / num2
}

//MARK: - angle
func solution(_ angle:Int) -> Int {
    guard 1...180 ~= angle else { return 0 }
    if 1 ..< 90 ~= angle {
        return 1
    } else if angle == 90 {
        return 2
    } else if 90 < angle, angle < 180 {
        return 3
    } else {
        return 4
    }
}
solution(30)
