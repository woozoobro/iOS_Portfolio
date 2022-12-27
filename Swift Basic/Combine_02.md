# Publisher, Subscriber, Operator


[Generic](https://babbab2.tistory.com/136)
[Combine](https://medium.com/harrythegreat/swift-combine-입문하기-가이드-1-525ccb94af57)

## Publisher

```swift
protocol Publisher {
    associatedtype Output
    associatedtype Failure: Error
    
    func subscribe<S: Subscriber>(_ subscriber: S)
        where S.Input == Output, S.Failure == Failure
}
```
* 데이터 배출하는 친구
  * 구체적인 output 및 실패 타입을 정의함
  * Subscriber가 요청한 것 만큼 데이터를 제공
* 빌트인 Publihser인 `Just`, `Futre`가 있음
  * `Just`는 값을 다루고
  * `Future`는 Function을 다룸
* iOS 에서는 자동으로 제공해주는 녀석들이 있음
  * NotificationCenter
  * Timer
  * URLSession.dataTask

## Subscriber

```swift
protocol Subscriber {
    associatedtype Input
    associatedtype Failure: Error
    
    func receive(subscription: Subscription)
    func receive(_ input: Input) -> Sbuscribers.Demand
    func receive(completion: subscribers.Completion<Failure>)
}
```
* Publihser에게 데이터 요청함
* Input, Failure 타입이 정의 필요함
* Publihser 구독 후, 갯수를 요청함
* 파이프라인을 취소할 수 있음
* 빌트인 Subscriber인 `assign`과 `sink`가 있음
  * `assign`는 Publihser가 제공한 데이터를 특정 객체의 키패스에 할당
  * `sink`는 Publisher가 제공한 데이터를 받을 수 있는 클로져를 제공함
  
## Subscriber & Publisher Pattern  
![](https://velog.velcdn.com/images/woojusm/post/3447a066-626d-482f-9cb8-b8bc15eac453/image.png)

## Subscription
* Subscriber가 Publisher에 연결됨을 나타내는 녀석
  * 쉽게 생각하면, Publisher가 발행한 구독 티켓
  * 이 구독 티켓만 있으면, 데이터를 받을 수 있음
  * 이 구독티켓이 사라지면 구독 관계도 사라짐
* `Cancellable` protocol을 따르고 있음
  * 따라서, Subscription을 통해 연결을 Cancel 할 수 있음
## Subject(Publisher)
* `send(_:)` 메소드를 이용해서 이벤트 값을 주입시킬 수 있는 퍼블리셔
* 기존의 비동기처리 방식에서 Combine으로 전환 시 유용함
* 2가지 빌트인 타입이 있음
  * `PassthroughSubject`
    * Subscriber가 달라고 요청하면,
    * 그때 부터, 받은 값을 전달해주기만 함
    * 전달한 값을 들고 있지 않음
  * `CurrentValueSubject`
    * Subscriber가 달라고 요청하면,
    * 최근에 가지고 있던 값을 전달하고, 그때부터 받은 값을 전달함
    * 전달한 값을 들고 있음
    
## @Published (Publisher)
* `@Published` 로 선언된 프로퍼티를 퍼블리셔로 만들어줌
* 클래스에 한해서 사용됨 (구조체에서 사용 안됨)
* `$` 를 이용해서 퍼블리셔에 접근할 수 있음

```swift
class Weather {
    @Published var temperature: Double
    init(temperature: Double) {
        self.temperature = temperature
    }
}

let weather = Weather(temperature: 20)
let subscription = weather.$temperature.sink {
    print("Temperature now: \($0)")
}
weather.temperature = 25

// Temperature now: 20.0
// Temperature now: 25.0
```
## Operator
* Publisher에게 받은 값을 가공해서 Subscriber에게 제공
* Input, Output, Failure type을 받는데 타입이 다를 수 있음
* 빌트인 오퍼레이터가 많이 있음
  * map, filter, reduce, collect, combineLatest ...

## Scheduler
* Scheduler는 언제, 어떻게 클로져를 실행할 지 정해주는 녀석임
* Operator에서 Scheduler를 파라미터로 받을 때가 있음
  * 따라서, 작업에 따라 백그라운드 혹은 메인스레드에서 작업이 실행될 수 있게 도와줌
* Scheduler가 스레드 자체는 아님

### 2가지 Scheduler 메소드
`subscribe(on:)`을 이용해서, publisher가 어느 스레드에서 수행할지 결정해주는 것
* 무거운 작업은 메인스레드가 아닌 다른 스레드에서 작업할 수 있게 도와줌
  * 예) 백그라운드 계산이 많이 필요한 것
  * 예) 파일 다운로드 해야하는 경우
`receive(on:)` 을 이용해서 operator, subscriber가 어느 스레드에서 수행할 지 결정해주는 것
* UI업데이트 필요한 데이터를 메인 스레드에서 받을 수 있게 도와줌
  * 예) 서버에서 가져온 데이터를 UI 업데이트 할때

### Pattern

```swift
let jsonPublisher = MyJSONLoaderPublisher() //Some publisher.

jsonPublisher
    .subscribe(on: backgroundQueue)
    .receive(on: RunLoop.main)
    .sink { value in
        label.text = value
    }
```

![](https://velog.velcdn.com/images/woojusm/post/e6cdf047-5d56-4d4d-ad27-78618175e746/image.png)

### UI 업데이트 시
🔴이렇게 하지말기
```swift
pub.sink {
    DispatchQueue.main.async {
        // Do update UI
    }
}
```
🟢이렇게 하기
```swift
pub.receive(on: DispatchQueue.main).sink {
    // Do update ui
}
```

## 참고 
- [https://developer.apple.com/videos/play/wwdc2019/722/](https://developer.apple.com/videos/play/wwdc2019/722/)
- [https://developer.apple.com/videos/play/wwdc2019/721/](https://developer.apple.com/videos/play/wwdc2019/721/)
- [https://developer.apple.com/documentation/combine/using-combine-for-your-app-s-asynchronous-code](https://developer.apple.com/documentation/combine/using-combine-for-your-app-s-asynchronous-code)
- [https://developer.apple.com/documentation/combine/replacing-foundation-timers-with-timer-publishers](https://developer.apple.com/documentation/combine/replacing-foundation-timers-with-timer-publishers)
- [https://developer.apple.com/documentation/combine/processing-published-elements-with-subscribers](https://developer.apple.com/documentation/combine/processing-published-elements-with-subscribers)
