import UIKit
import Combine

let subject = PassthroughSubject<String, Never>()

let subscription = subject
    .print() //디버그용 사이클 어떻게 되는지보려고
    .sink { value in
    print("Subscriber received value: \(value)")
}

subject.send("Hello")
subject.send("Hello again!")
subject.send("Hello for the last time!")
subject.send(completion: .finished)
//subscription.cancel()
subject.send("Hello?? :(")

