//: [Previous](@previous)

import Foundation
import Combine

final class SomeViewModel {
    @Published var name: String = "Jack"
    var age: Int = 20
}

final class Label {
    var text: String = ""
}

let label = Label()
let vm = SomeViewModel()
print("text: \(label.text)")

vm.$name.assign(to: \.text, on: label)
print("text: \(label.text)")

vm.name = "Woozoo"
print("text: \(label.text)")
