# Optional_2

## 1. Optional Unwrapping
Optional로 선언된 자료형은 일반 자료형이 아닌
Optional이란 포장지로 포장된 자료형이다!!

근데 이 자료형에 값을 넣어준 걸 사용하고 싶다면?

## 2. Force Unwrapping
```swift
let name: String? = "우주형"
print(name)
// Optional("우주형")
print(name!)
// 우주형
```
강제 추출.
Optional로 선언된 변수(상수) 뒤에 ! 느낌표를  사용하면 된다.
근데 nil인 값을 강제 추출 하려고 할 경우
컴파일 에러가 발생해서 -> 엄청 위험한 일
강제 추출은 많이 사용하지 않는 걸로...

## 3. Optional Binding

### if let을 사용해서 해제하기!
```swift
let name: String? = "우주형"

if let safeName = name {
    print(safeName)
} else {
    print(name)
}
```
safeName이라는 상수에 name이라는 옵셔널 타입을 집어 넣는데
만약! name에게 값이 있다면 safeName을 프린트해주세요.
그게 아니라면 (즉 name이 값이 없는 nil이라면) else 구문의 코드가 실행 되는 거

처음 이거 봤을 때 헷갈렸었는데 
if 랑 let safeName = name 을 다른 덩이라고 생각하면 됨

```swift
let name: String? = nil
let age: Int? = nil

if let name = name, let age = age {
    //let name은 방금 만들어준 이름이고 뒤에 name은 상단에 옵셔널로 선언 된 부분
    //지금처럼 한번에 콤마로 연결해주는 것도 가능하다!!
}
```
아 그리고 콤마로 조건도 추가해줄 수 있음
```swift
if let name = name, let age = age, age > 28 {
//    요런 식으로 추가한 조건까지 전부 참이어야 if 구문이 실행된다!
}
```

### guard let을 사용해서 해제하기!

```swift
let name: String? = "우주형"

func test() {
    guard let safeName = name else { return }
    print(safeName)
}
test()
```
if let이랑 비슷한데 좀 다름
if let은 옵셔널 해제된 값을 쓸 수 있는 범위가 if 구문 내에서지만
guard let은 guard 구문 이후에도 쓸 수 있음(옵셔널이 정상적으로 해제 되었다면!)

가드 safeName에 name을 넣을 건데 값이 있어요?
* 값이 있을 경우 계속 진행
* 값이 없을 경우 else 를 통해 return 으로 빠져나와진다! 함수가 종료 된다!


## 4. Nil-Coalecing Operation


![](https://velog.velcdn.com/images/woojusm/post/bf23cbf1-128d-492b-947e-56b821e2c87d/image.png)

금도끼 줄까 ?? 은도끼 줄까 로 생각 하면 됨

금도끼 -> 값이 있는 경우
은도끼 -> 값이 없는 경우 즉 nil일 때 은도끼(넣어주고 싶은 값)

이 때 금도끼와 은도끼는 Optional을 제외한다면 같은 자료형이어야함
금도끼가 String? 이면 은도끼는 String
금도끼가 Int? 이면 은도끼는 Int

이거 네트워킹할 때 에러 핸들링 시에 엄청 간단하게 구현 가능해져서
쓰는 거 본 거 같음
