# Optional_1

## 1. 옵셔널이란?

```swift
let name: String?
```
이런 거
타입 뒤에 붙어 있는 물음표가 옵셔널이다!
"잉?"으로 생각하면 됨
**Optional은 nil을 사용할 수 있는 타입과 없는 타입을 구분하기 위함이고, nil을 사용할 수 있는 Type을 Optional Type 이라 한다**
## 2. 그럼 nil은 뭐야?
**"값이 없음"**을 뜻한다.
```swift
// 이건 값이 없는 게 아님!! 
let name: String = ""
let num: Int = 0
```
_너가 방금 지정해준 값에 오류가 난 거 같음 근데 이거 앱 중단시키기는 그러니까 오류는 안낼게. 대신에 nil 돌려줄테니까 오류인 거 알고 있으셈_
swift 안정성에 해당하는 nil
찾는 값이 없다고 Crash를 발생 시키는 게 아니라, nil을 발생시키는 거
```swift
let human = ["name" : "우주형", "gender" : "man"]

let name = human["name"]
// human이라는 딕셔너리에 "name"이라는 키에 접근하면!
```
![](https://velog.velcdn.com/images/woojusm/post/93e73c3d-3447-457a-a1cf-ee0a2e3794c8/image.png)
잘 담겨 있음

근데 없는 키로 한번 접근 해보면?
![](https://velog.velcdn.com/images/woojusm/post/f4d52093-33bf-4014-bbd5-84b34c111d59/image.png)

야 너가 원하는 값 없다! 대신에 nil 돌려줄게

## 옵셔널 타입 = 포장지?

![](https://velog.velcdn.com/images/woojusm/post/a7d8bc82-5d21-4d1b-8e45-088744b3f27c/image.png)

옵셔널 타입은 일반 값이랑 다른 값임
이 옵셔널을 쓰고 싶으면 Optional("우주형")에서 포장지를 벗기는 과정이 필요한데 다음 글에서 알아보자.
