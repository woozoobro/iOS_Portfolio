import Foundation
import Combine

let arrPublisher = [1, 2, 3].publisher

let queue = DispatchQueue(label: "custom")

let subscription = arrPublisher
    .subscribe(on: queue)
    .map { value -> Int in
        print("transform: \(value), thread: \(Thread.current)")
        return value
    }
    .receive(on: DispatchQueue.main)
    .sink { value in
        print("Receive value: \(value), thread: \(Thread.current)")
    }
