```swift
// Publisher & Subscriber
let just = Just(1000)
let subcription1 = just.sink { value in
    print("Received Value: \(value)")
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

```

### Just

![](https://velog.velcdn.com/images/woojusm/post/ab4b301d-a413-42c4-a787-b1cf17a63998/image.png)

subscriber에게 값을 한번 뱉어내는 친구

### sink(receiveValue:)
![](https://velog.velcdn.com/images/woojusm/post/eef93d63-6621-4263-8521-960983d51066/image.png)

실패하지 않는 publisher에게 클로져의 형태로 subscriber를 붙입니다

### Subscription
A protocol representing the connection of a subscriber to a publisher

### assign

![](https://velog.velcdn.com/images/woojusm/post/58dee6e0-4227-44ca-afb4-52e2390f8896/image.png)
![](https://velog.velcdn.com/images/woojusm/post/0fdd20ad-5604-471d-b9fc-fb164b6e0bfd/image.png)
___

## Subject

```swift
// PassthroughSubject
let relay = PassthroughSubject<String, Never>()
let subscription1 = relay.sink { value in
    print("subscription1 received value: \(value)")
}

relay.send("Hello")
relay.send("World!")

// CurrentValueSubject

let variable = CurrentValueSubject<String, Never>("")

variable.send("Initial text")

let subscription2 = variable.sink { value in
    print("subscription2 received value: \(value)")
}

variable.send("More text")
variable.value


let publisher = ["Here", "we", "go"].publisher
publisher.subscribe(relay)
```


### PassthroughSubject 
값을 저장하진 않고 흘려보내기만 하는 publisher

### CurrentValueSubject
초기값을 가지고 가졌던 값들을 저장하고 있는 publisher

### .send
값을 보내는 메소드

___
## Subscription
```swift
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
```
subject라는 퍼블리셔를 만들고
subject의 subscriber가 되는 .sink 메소드를 subscription으로 부르기로 했다!

subject에 값을 보내면 subject를 subscribe 하는 subscription의 행위들이 호출이 될거다  
subject에서 completion으로 .finished 구독관계를 청산할 수도 있고,
subscription 자체에서 .cancel로 취소도 가능하다!
취소하고 나면 더 이상 값을 보낼 수가 없음  
___

## Published

```swift
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
```
클래스 내의 프로퍼티에 @Published로 퍼블리셔를 만들 수가 있다

`vm.$name.assign(to: \.text, on: label)`
이 구문으로 label의 텍스트는 vm의 텍스트에 맞춰서 값이 바뀌게 된다!
___
## Foundation and Combine

```swift
import Foundation
import UIKit
import Combine

// URLSessionTask Publisher and JSON Decoding Operator

struct SomeDecodable: Decodable { }

URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.google.com")!)
    .map { data, response in
        return data
    }
    .decode(type: SomeDecodable.self, decoder: JSONDecoder())

// Notifications

let center = NotificationCenter.default
let noti = Notification.Name("MyNoti")
let notiPublisher = center.publisher(for: noti, object: nil)
let subscription1 = notiPublisher.sink { _ in
    print("Noti Received")
}

center.post(name: noti, object: nil)
subscription1.cancel()

// KeyPath binding to NSObject instances

let ageLabel = UILabel()
print("text: \(ageLabel.text)")

Just(28)
    .map { "Age is \($0)"}
    .assign(to: \.text, on: ageLabel)
print("text: \(ageLabel.text)")


// Timer
let timerPublisher = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

let subscription2 = timerPublisher.sink { time in
    print("time: \(time)")
}
    
DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    subscription2.cancel()
}
```
___
## DispatchQueue
`DispatchQueue`는 작업 항목의 실행을 관리하는 클래스이다.

Queue는 놀이공원 줄 처럼 대기열 이라고 생각하면되고  
Dispatch는 이 대기열을 '보낸다'는 의미  

## Scheduler

```swift
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
```
`subscribe(on: )` 이나 `receive(on: )`을 통해 어떤 스레드에서 작업을 수행할 것인지 지정해줄 수 있다!  

___

## Operator - map & filter
```swift
// Transform - Map
let numPublisher = PassthroughSubject<Int, Never>()
let subscription1 = numPublisher
    .map { $0 * 2 }
    .sink { value in
        print("Transformed Value: \(value)")
    }
numPublisher.send(10)
numPublisher.send(20)
numPublisher.send(30)
subscription1.cancel()

// Filter
let stringPublisher = PassthroughSubject<String, Never>()
let subscription2 = stringPublisher
    .filter { $0.contains("a") }
    .sink { value in
        print("Filtered Value: \(value)")
    }

stringPublisher.send("abc")
stringPublisher.send("Hi")
stringPublisher.send("Jack")
stringPublisher.send("Woozoo")
stringPublisher.send("Jason")
subscription2.cancel()
```
___

## Operator - combineLatest

두개의 퍼블리셔를 같이 받는다!
```swift
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
```
___

## Operator - removeDup & compactMap
```swift
var subscriptions = Set<AnyCancellable>()

//MARK: - removeDuplicates
let words = "hey hey there! Mr Mr ?"
    .components(separatedBy: " ")
    .publisher

// 기존엔 let subcription = words. 이런 식으로 진행을 했지만
// 지금처럼 subscriptions라는 통을 전역으로 설정하고
// .store을 사용해서 저장 시키는 것도 가능
words
    .removeDuplicates()
    .sink { value in
        print(value)
    }.store(in: &subscriptions)

//MARK: - compactMap : 실제로 가능한 것들만 뽑아주는 거, nil은 제외시키는 거
let strings = ["a", "1.24", "3", "def", "45", "0.23"].publisher

strings
    .compactMap { Float($0) }
    .sink { value in
        print(value)
    }.store(in: &subscriptions)

//MARK: - ignoreOutput
let numbers = (1...10_000).publisher

numbers
    .ignoreOutput()
    .sink(receiveCompletion: { print("Completed with: \($0)")}, receiveValue: { print($0)})
    .store(in: &subscriptions)

//MARK: - prefix 앞에 몇개까지만 받겠다

let tens = (1...10).publisher

tens
    .prefix(2)
    .sink(receiveCompletion: { print("Completed with: \($0)")}, receiveValue: { print($0) })
    .store(in: &subscriptions)
```



