//: [Previous](@previous)

import Foundation
import Combine

// Publisher & Subscriber
let just = Just(1000)
let subcription1 = just.sink { value in
//    print("Received Value: \(value)")
}

let arrayPublisher = [1, 3, 5, 7, 9].publisher
let subscription2 = arrayPublisher.sink { value in
    print("Received Value: \(value)")
}

class MyClass {
    var property: Int = 0 {
        didSet {
            print("Did set property to \(property)")
        }
    }
}

let myObject = MyClass()
let subscription3 = arrayPublisher.assign(to: \.property, on: myObject)
print("Final Value: \(myObject.property)")

//object.property = 3
