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
//let highUsers = appPortfolio.filter { $0.users > 5000 }

var highUsers: [IndieApp] = []

for app in appPortfolio {
    if app.users > 5000 {
        highUsers.append(app)
    }
}

print(highUsers)



// Map



