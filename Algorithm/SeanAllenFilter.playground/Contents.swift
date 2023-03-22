import UIKit

struct IndieApp {
    let name: String
    let monthlyPrice: Double
    let users: Int
}

let appPortfolio: [IndieApp] = [
    IndieApp(name: "Creator View", monthlyPrice: 11.99, users: 4356),
    IndieApp(name: "FitHero", monthlyPrice: 0.00, users: 1756),
    IndieApp(name: "Buckets", monthlyPrice: 3.99, users: 7598),
    IndieApp(name: "Connect Four", monthlyPrice: 1.99, users: 34081),
]

// Filter

//let freeApps = appPortfolio.filter { $0.monthlyPrice == 0 }
let highUsers = appPortfolio.filter { $0.users > 5000 }
//print(highUsers)



// Map
let incresedPrices = appPortfolio.map { $0.monthlyPrice * 1.5 }
//print(incresedPrices)


// Reduce
let numbers = [3,5,9,12,18]
let sum = numbers.reduce(0, +)
//print(sum)

let totalUsers = appPortfolio.reduce(0, { $0 + $1.users})
//print(totalUsers)


// Chaining
let recurringRevenue = appPortfolio.map { $0.monthlyPrice * Double($0.users) * 0.7 }.reduce(0, +)
//print(recurringRevenue)



// Compact Map
let nilNumbers: [Int?] = [1, nil, 17, nil, 3, 7, nil, 99]
let nonNilNumbers = nilNumbers.compactMap { $0 }
//print(nonNilNumbers)



// Flat Map
let arrayOfArrays: [[Int]] = [[1,2,3],
                              [4,5,6],
                              [7,8,9]]

let singleArray = arrayOfArrays.flatMap { $0.map { $0 * 2} }
print(singleArray)
