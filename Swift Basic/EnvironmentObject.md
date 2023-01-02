# EnvironmentObject
## Previously
### 1. Value 타입의 Single Source of truth 전달하기

![](https://velog.velcdn.com/images/woojusm/post/d93ce9eb-8845-404d-bf1b-a7a866d40e2a/image.png)

### 2. Reference(Object) 타입의 Single Source of truth 전달하기 
![](https://velog.velcdn.com/images/woojusm/post/19f3c3a9-e1e3-4475-b680-97a44c00193e/image.png)

### 3. Reference(Object) 타입의 Single Source of truth 전달하기 
* 여러 뷰에 걸쳐서
![](https://velog.velcdn.com/images/woojusm/post/09eccfe9-29e5-4c0d-abd9-382b6a5fc2a4/image.png)

### 4.Reference(Object) 타입의 Single Source of truth 전달하기 
* 여러 뷰에 더 걸쳐서
![](https://velog.velcdn.com/images/woojusm/post/bced7a82-7a7d-4819-973c-b26397b1e6cb/image.png)

### 5. Reference(Object) 타입의 Single Source of truth 전달하기 
- 여러뷰에 🔥더 걸쳐서
- 중간 뷰에서는 Single Source of truth 필요없는 경우는?
![](https://velog.velcdn.com/images/woojusm/post/77925db3-6dd7-4e80-9c21-a959c3e975d3/image.png)

### 6. 5번과 같은 상황에서 EnviromentObject  사용해서 전달
- Reference(Object) 타입의 Single Source of truth 전달하기
- 여러뷰에 🔥더 걸쳐서
- 중간 뷰에서는 Single Source of truth 필요없는 경우는?
- 이럴때, `EnviromentObject` 를 이용해서 전달 가능

![](https://velog.velcdn.com/images/woojusm/post/c340f87d-fa53-4f2d-95c9-3466d07a45b1/image.png)

## 어떻게, @EnvironmentObject 클래스 만들까?
* @StateObject, @ObservedObject 만들던 클래스와 똑같음

- `observable` protocol 사용해서 class 생성
- 변경에 대한 옵저빙이 필요한 프로퍼티는 앞에 `@Published` 붙이기
    - `@Published`  가 붙은 프로퍼티의 값이 변경될때 마다 Observable class 를 통해 알아차림
    
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

## 참조

- [https://developer.apple.com/documentation/SwiftUI/State-and-Data-Flow](https://developer.apple.com/documentation/SwiftUI/State-and-Data-Flow)
- [https://developer.apple.com/documentation/swiftui/environmentobject](https://developer.apple.com/documentation/swiftui/environmentobject)
- [https://developer.apple.com/videos/play/wwdc2020/10040/](https://developer.apple.com/videos/play/wwdc2020/10040/)
- [https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-environmentobject-to-share-data-between-views](https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-environmentobject-to-share-data-between-views)
