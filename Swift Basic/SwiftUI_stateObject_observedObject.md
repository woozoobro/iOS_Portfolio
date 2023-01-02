# SwiftUI_stateObject_observedObject

* SwiftUI에서는 Single source of truth에 의한 상태 관리가 중요함
* SwiftUI에서는 @State를 이용해서 Single source of truth 상태를 나타낼 수 있음
* @Binding을 통해서 Single source of truth 상태 정보에 접근 가능
* SwiftUI에서는 상태가 변하면, 뷰는 상태를 반영하여 자동으로 그려짐  

## SwiftUI에서 중요하게 생각하는 것

* 바로 Single Source of truth 에 의한 상태 관리
  * 요즘 애플 wwdc 영상을 보면 single source truth가 많이 나온다.
  * 그만큼, 그전에 데이터가 여기저기 주고받아지고, 그렇게 주고 받은 데이터를 여기저기서 수정하고,
    * 결국에는 어떤 게 진짜인지 헷갈리고, 복사된 데이터가 상태가 다 다르다보니
    버그에 취약해지고 -> 그만큼 개발자가 더 신경을 많이 썼어야했음  
    -> 애플 생각은, 개발자들이 신경 덜쓸 수 있는 시스템을 만들어줘야겠다!  
    
## State, Binding은 Value 타입을 위한 것임  
* `struct`,`enum`
* `String`, `Int`, `Bool`

## 그럼 class 같은 Reference 타입은?
* 바로 `@StateObject`, `@ObservedObject를 이용하면 됨
  * SSO(Single source of truth)
    * Value 타입: @State
    * Reference 타입: @StateObject
  * Reference of SSO
    * Value 타입: `@Binding`
    * Reference 타입: `@ObservedObject`

### 어떻게 @StateObject, @ObservedObject 클래스를 만들까?


* `Observable` protocol 사용해서 class 생성
* 변경에 대한 옵저빙이 필요한 프로퍼티는 앞에 @Published 붙이기
  * `@Published`가 붙은 프로퍼티의 값이 변경될 때마다 Observable class를 통해 알아차림  
```swift
class Contact: ObservableObject {
    @Published var name: String
    @Published var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func haveBirthday() -> Int {
        age += 1
        return age
    }
}

let john = Contact(name: "John Appleseed", age: 24)
cancellable = john.objectWillChange
    .sink { _ in
        print("\(john.age) will change")
}
print(john.haveBirthday())
```

