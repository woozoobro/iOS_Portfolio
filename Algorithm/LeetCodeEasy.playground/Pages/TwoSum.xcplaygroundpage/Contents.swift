import Foundation
//MARK: - Two sum Problem
/*
어떤 어레이가 주어지고 타겟이 주어지면
어레이의 엘리먼트들을 더했을 때 합이 타겟값이 되는 엘리먼트의 index를 Array로 반환하는 Sum 만들기!

Input: nums [2, 7, 11, 15], target = 9
Output: [0, 1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 
 Input: nums = [3,3], target = 6
 Output: [0,1]
*/


//MARK: - My First Bruit force
/*
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var a = 0
        var b = 0
        for num in nums {
            a = num
            for num in nums {
                if a != num {
                    if a + num == target {
                        b = num
                        guard let first = nums.firstIndex(where: {$0 == a}),
                              let second = nums.firstIndex(where: {$0 == b}) else { return []}
                        return [first, second]
                    }
                } else if a == num && a + num == target {
                    b = num
                    guard let first = nums.firstIndex(where: {$0 == a}),
                          let second = nums.firstIndex(where: {$0 == b}),
                          first != second
                    else { return []}
                    return [first, second]
                }
            }
        }
        return []
    }
}

*/

//MARK: - The answer

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]()
    for (index, num) in nums.enumerated() {
        let complement = target - num
        if let complementIndex = dict[complement] {
            return [complementIndex, index]
        }
        dict[num] = index
    }
    return []
}

//func test() -> [Int : Int] {
//    var numArray: [Int] = [5,23,55,6,8,11,36,78,90]
//    var someDict = [Int : Int]()
//
//    for (index, num) in numArray.enumerated() {
//
//
//        someDict[num] = index
//        print(someDict)
//    }
//}
//print(test())
