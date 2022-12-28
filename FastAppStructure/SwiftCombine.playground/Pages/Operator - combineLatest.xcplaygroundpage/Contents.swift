import Foundation
import Combine


//MARK: - Basic CombineLatest

let strPublisher = PassthroughSubject<String, Never>()
let numPublisher = PassthroughSubject<Int, Never>()

//"a"          "b"    "c"
//    1      2  3            5

// 아래처럼도 가능!
// Publishers.CombineLatest(strPublisher, numPublisher).sink {
strPublisher.combineLatest(numPublisher).sink { (str, num) in
    print("Receive: \(str), \(num)")
}

strPublisher.send("a")
numPublisher.send(1)
numPublisher.send(2)
strPublisher.send("b")
numPublisher.send(3)
strPublisher.send("c")
numPublisher.send(5)


//MARK: - Advanced CombineLatest
let usernamePublisher = PassthroughSubject<String, Never>()
let passwordPublisher = PassthroughSubject<String, Never>()

let validatdCredentialsSubscription = usernamePublisher.combineLatest(passwordPublisher)
    .map { (username, password) -> Bool in
        return !username.isEmpty && !password.isEmpty && password.count > 12
    }
    .sink { valid in
        print("Credential valid? : \(valid)")
    }

usernamePublisher.send("woozoobro")
passwordPublisher.send("weakpw")
passwordPublisher.send("verystrongpassword")


//MARK: - Merge
let publisher1 = [1, 2, 3, 4, 5].publisher
let publisher2 = [300, 400, 500].publisher

//이렇게 머지도 가능
//Publishers.Merge(publisher1, publisher2)

let mergePublisherSubscription = publisher1.merge(with: publisher2)
    .sink { value in
        print("Merge: sbuscription received value: \(value)")
    }

