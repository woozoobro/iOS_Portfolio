# Type Inference Vs Type Annotation


## 1. Swift의 변수(상수) 선언

```swift
let 상수
var 변수
```
## 2.타입 추론 (Type Inference)
상수와 변수를 선언하면 일반적으로 타입을 명시해줘야 하는데
swift에선 타입 추론이라는 게 가능하다!
```swift
let name = "우주형"
```
**선언과 동시에 초기값을 넣어줬다 -> 초기화 해줬다!**

이렇게 컴파일러가 초기화된 값을 보고 타입을 추론하는 것이
### Type Inference!
"우주형" 은 스트링 값이니까 스트링이겠구나  
추론 하는 거임

#### a)원하는 타입으로 추론되지 않는 경우
```swift
let num = 1.0
```
![](https://velog.velcdn.com/images/woojusm/post/0de175cd-d3ea-4ff1-8198-6e6a27c56be6/image.png)Float으로 넣고 싶었지만 Double형으로 잡힘...

```swift
let name = "W"
```

![](https://velog.velcdn.com/images/woojusm/post/a41b44d7-4c40-45fd-8e3e-8825b760a5cf/image.png)Character로 넣고 싶었지만 String으로 잡힘

컴파일러가 초기값을 보고 알아서 자료형 유추할 때
애매하면 그냥 자료형을 더 큰 범위의 자료형으로 지정해버린다


#### b) 초기값이 없는 경우

예를 들면 네트워크와 통신하는 경우처럼 서버로 데이터를 받기 전까지 값을 알 수 없을 때!
초기값이 없는 경우 타입을 유추할 수 없기 때문에
타입을 명시해줘야한다!! 

## 3.타입 어노테이션(Type Annotation)

```swift
let name: String

let/var 변수이름: 자료형
```
이런 방식으로 자료형을 지정해주는 거

타입 추론은 컴파일러가 타입을 추론하는 과정에서
타입 어노테이션보다 시간이 조금 더 걸릴 수 있다!


## 4. 정리

||타입 추론(Type Inference)|타입 어노테이션(Type Annotation)|
|------|---|---|
|선언|let name = "우주형"|let name: String|
|특징|초기값을 지정|자료형을 지정|
|문제점|1. 원하는 타입이 추론되지 않을 수 있다.||
|| 2. 초기 값이 없을 경우 사용할 수 없다| |
| |이 문제점들이 발생 하면 타입어노테이션 고고|
