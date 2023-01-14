# Collection Types  
## 배열
배열은 더해서 생성도 가능
```swift
var threeDoubles = Array(repeating: 0.0, count: 3)
// threeDoubles is of type [Double], and equals [0.0, 0.0, 0.0]

var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
// anotherThreeDoubles is of type [Double], and equals [2.5, 2.5, 2.5]

var sixDoubles = threeDoubles + anotherThreeDoubles

// sixDoubles is inferred as [Double], and equals
// [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
```

서브 스크립트 구문을 사용하여 배열의 값을 가져올 수도 있다.
배열의 이름 뒤에 대괄호를 붙이고 가져올 값의 인덱스를 넣어 해당 값을 가져오기 가능!  
```swift
var firstItem = shoppingList[0]
```
배열의 특정 인덱스에 아이템을 추가하려면 insert 메소드를 호출한다
```swift
shoppingList.insert("Maple Syrup", at: 0)
```
비슷하게 remove도 가능
___
## 집합(Sets)
집합은 콜렉션의 순서와 상관없이 같은 타입 '다른' 의 값들을 저장한다.

집합에 저장하기 위해 타입은 반드시 hashable 해야한다.  
즉, 해쉬값(Hash value)을 계산할 수 있는 방법을 타입은 제공해야 함. 해쉬 값은 동일하게 비교되는 모든 객체에 대해 동일한 Int 값으로 a==b이면 a.hashValue == b.hashValue를 따른다.

Swift의 모든 기본타입(String, Int, Double,그리고 Bool)은 기본적으로 hashable이고 집합의 값 타입 또는 딕셔너리의 키 타입으로 사용 가능. 연관된 값이 없는 열거형(enum) 케이스 값은 기본적으로 hashable

### 빈 집합 생성과 초기화
```swift
var letters = Set<Character>()
```
생각나느거 있죠!

```swift
var subscriptions = Set<AnyCancellable>()
```
그리고 집합은 수학에서 배우던 집합, 벤다이어그램처럼
두 집합간의 교집합 차집합 같은 것들을 표현할 수 도 있음  
___

## 딕셔너리
딕셔너리는 순서와 상관없이 콜렉션에 같은 타입의 키 와 같은 타입의 값을 저장한다.  
각 값은 딕셔너리 내부에서 값에 대한 식별자로 동작하는 유니크한 키와 조합됨  
사전에서 단어를 찾을 때 처럼 특정 키 값을 바탕으로 원하는 값을 찾을 때 딕셔너리 사용  
* 딕셔너리 Key 타입은 집합의 값 타입과 마찬가지로 반드시 Hashable 프로토콜을 준수해야 한다  

### 빈 딕셔너리 생성
```swift
var namesOfIntegers = [Int: String]()
```

서브 스크립트 구문을 사용해서 딕셔너리에 새로운 아이템 추가 가능!  
```swift
airports["LHR"]  = "London"
```

특정 키를 서브 스크립트 구문으로 사용해서 값 변경도 가능함  
```swift
airports["LHR"]  = "London Hearthrow"
```

딕셔너리의 해당 키에 nil 값을 할당해서 키- 값 쌍을 서브스크립트 구문을 사용해서 삭제 가능  
```swift
airports["LHR"] = nil
//LHR has now been removed from the dictionary
```

### Iterating Over a Dictionary
for-in 루프로 딕셔너리의 키-값 쌍을 반복할 수 있다.
딕셔너리의 각 아이템은 (key, value) 튜플 형태로 반환되고 튜플의 멤버를 임시 상수 또는 변수로 분리할 수 있다.
___

🤔 Swift의 Dictionary 타입은 정의된 순서를 가지고 있지 않다.특정 순서로 딕셔너리의 키 또는 값을 반복하려면 Keys 또는 values 프로퍼티에 sorted()메서드를 사용하세요.

그럼 배열로 바뀐 키나 값을 가져올 수 있는건가? 집합일까?

