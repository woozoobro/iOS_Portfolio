//: [Previous](@previous)

import Foundation

enum AppleProduct {
    case iPad(model: String)
    case iPhone(model: String, storage: Int)
    case macbook(model: String, storage: Int, size: Int)
}

let product: AppleProduct = .macbook(model: "Pro", storage: 256, size: 13)



