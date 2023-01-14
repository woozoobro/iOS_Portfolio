

# [Swift Language] 기본(The Basics)

### 타입 명시 (Type Annotations)
```swift
var welcomeMessage: String
var red, green, blue: Double
```
* 상수 또는 변수를 선언할 때 초기값을 지정하면 Type Safety와 Type Infrence로 타입 유추가 가능함  

### Floating point Numbers
Double, Float 두 타입이 있는데 Double이 선호됨  


### 튜플 (Tuples)

```swift
let http404Error = (404, "Not Found")
// http404Error is of type (Int, String), and equals (404, "Not Found")
```
튜플은 별도의 상수 또는 변수로 분해해서 평소처럼 접근 가능함  

```swift
let (statusCode, statusMessage) = http404Error
print( "\(statusCode)")
print("\(statusMessage)")
```
0부터 시작하는 인덱스를 사용해서 개별 요소에 접근도 가능
```swift
http404Error.0
http404Error.1
```
이름으로도 접근 가능

간단한 값의 간단한 그룹에 용이  
### 옵셔널
기본값 없이 옵셔널 변수 정의하면 이 변수는 자동적으로 nil로 설정됨
```swift
var surveyAnswer: String?
```
### if 구문 / 강제 언래핑
```swift
if convertedNumber != nil {
    print("hello")
}
```
```swift
convertedNumber!
```
### Optional Binding
```swift
if let actualNumber = Int(possibleNumber) {
    print(actualNumber)
}
```

if let 뿐만아니라 if var도 사용 가능함  

필요한 경우 if 구문에 쉼표로 구분해서 옵셔널 바인딩 이나 부울 조건을 여러개 포함할 수 있다!  

```swift
if let firstNumber = Int("4"), let seccondNumber = Int("42") {
    //...
}
```

### Implicitly Unwrapped Optionals
```swift
let possibleString: String? = "An optional String"
let forcedString: String = possibleString!

let assumedString: String! = "An implicitly unwrapped optional String"
let implicitString: String = assumedString 
// no need for an exclmanation point
```

## 에러 처리 (Error Handling)

프로그램이 실행되는 동안 에러가 발생할 때 처리하기 위해 에러처리를 사용함

값의 존재 유무를 사용해서 함수의 성공, 실패를 전달할 수 있는 옵셔널과 달리  
에러처리를 사용하면 에러 원인을 판별하고 필요한 경우 에러를 프로그램의 다른 부분으로 전파할 수 있음  
```func canThrowAnError() throws {
    // this function may or may not throw an error
}
```
throw로 선언한 함수는 에러가 발생할 수 있음을 나타내주는 거  
이 함수를 호출할 때는 try 키워드를 붙여야함

```swift
do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}
```
catch 구문을 여러개 사용해서 여러개의 에러 처리도 가능  
