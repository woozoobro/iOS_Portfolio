# SymbolRoller

## 1. UI 구성하기!
![](https://velog.velcdn.com/images/woojusm/post/8841d67d-76d9-431e-ab5b-f3d37f33ad3f/image.gif)


![](https://velog.velcdn.com/images/woojusm/post/ffd67c49-26ff-40f5-9a4d-087308bd05a0/image.png)
UIimageView와 UILabel 그리고 UIButton을 스택뷰로 묶고  
button과 label에는 height 수치를 오토레이아웃으로 넣어 줬다.

그리고 imageView와 label을 ViewController에 IBOutlet으로 넣어줬는데

여기서 잠깐!  

이 각각에 대해서 ui구성할 때 대충 이렇게 되겠거니~ 하고 넘어갔던 것 같은데
정의는 어떻고, 그리고 어떤 의미인지 제대로 파악해보자.  

### UIImageView
![](https://velog.velcdn.com/images/woojusm/post/6a1ea503-dbda-42c5-8c27-4768112d215c/image.png)
view인데 싱글 이미지나 animated 이미지를 인터페이스에 보여주는 클래스!

UIView를 상속받고 있다고 하는데... UIView도 알아야겠군
contentMode라는 파라미터도 있고 (scaleAspectFit,scaleAspectFill 등)  

💡처음 안 사실! 만약에 Core Animation을 사용해서 이미지를 돌린다고 할 때
isOpaque 프로퍼티를 (투명한가?) true로 설정해서 성능을 향상 시키는 게 가능하다!! 이미지뷰는 Background도 있고, 이미지 자체도 가지고 있다.

### UIView
![](https://velog.velcdn.com/images/woojusm/post/9914fdd8-1d94-43c8-8f32-824bfa667e25/image.png)
UI의 되게 많은 친구들이 이걸 상속하고 있다.
오브젝트인데 스크린의 네모네모 공간을 관리해주는 녀석

💡처음 안 사실!
UIView 쓸 때 책임져야하는 게 있음
* Drawing and Animation
  * 뷰는 네모네모 공간에 UIKit이나 CoreGraphics를 사용해 콘텐트를 그린다
  * 일부 View Property들은 새로운 값으로 애니메이트 가능
* Layout and subview Management
  * 뷰는 여러개의 서브뷰를 담을 수 있음.(없어도 되기도 하고)
  * 뷰의 사이즈와 위치는 서브뷰들에 적용될 수 있음
  * 오토 레이아웃 써서 이쁘게 그려라~
* Event Handling
  * View는 UIResponder 의 서브클래스이다! 터치 이벤트나 여러가지 타입의 이벤트 응답 가능
  * View는 또 gesture 알아채는 애 설치할 수 있음
  
ClipstoBounds 서브뷰들을 뷰 안에 가둘 건지 나타내는 불리언
![](https://velog.velcdn.com/images/woojusm/post/a8708d89-04fa-4d2e-9539-feb1ddad6277/image.png)

Frame 과 Bounds에 대한 차이도 알아두기!

### UILabel
이것도 UIView를 상속받고 있다.
근데 이러면 UIView 안에 string 값이 담긴 text가 담겨지는 건가?! 궁금하다.
문서에 적힌 내용 대부분은 어떻게 디자인 할지 적혀있다

---
## 2. UIImage 들어갈 재료 준비

```swift
let symbols: [String] = ["sun.min", "moon", "cloud", "wind", "snowflake"]
```
배열 형태로 먼저 선언해두자! 이름들은 SFSymbols에서 가져옴

뷰가 로드 될 때 위 이미지 이름들을 넣어주면 되겠네!

콜렉션의 randomElement() 메소드를 사용해보자
![](https://velog.velcdn.com/images/woojusm/post/4d7612f8-244b-4d36-9c6d-1325137a8f0f/image.png)


```swift
let symbol = symbols.randomElement()!
imageView.image = UIImage(systemName: symbol)
label.text = symbol
```
이걸 뷰가 로드 될 때랑 버튼 액션에 추가해주면 끝!
메소드로 새로 파서 넣어주자!

![](https://velog.velcdn.com/images/woojusm/post/d9d54fa7-9d3c-4db9-a5dc-bd790fd614b9/image.png)

## 3. Challenge! 랜덤이 눌렸을 때 이미지를 조금 바꿔보자!!

이미지 롤링하는 것만 하니까 너무 심심하다
이미지를 애니메이트할 방법을 찾아보자
UIView에 animate라는 함수가 있음 클로져로 하고 싶은 동작 추가하면됨

```swift
func animation() {
    let newBounds = CGRect(x: 0, y: 0, width: 500, height: 500)
    UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut) {
    self.imageView.bounds = newBounds
    }
}
```
요런식으로! 유니티에서 하던 느낌이랑 비슷하다
이부분은 나중에 다시 정리해봐야겠다.
[UIView animation]

