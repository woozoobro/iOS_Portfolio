# MVVM 개념 이해하기
## 왜 MVVM이 생겼나?  
### 기존 MVC 패턴의 문제
*  애플에서 가이드 하던 MVC패턴

![](https://velog.velcdn.com/images/woojusm/post/c30e57bc-1ce3-4b4f-a600-b4c367fd0529/image.png)
* `view` `viewController` 이 둘을 view와 Controller 레이어로 나누어서 설명 했지만
* 실제로 구현을 할때는 이둘이 거의 분리되지 않음
![](https://velog.velcdn.com/images/woojusm/post/d6eb932a-f191-4c3a-87e1-7a1b73f78646/image.png)
* 따라서, 위의 그림과 같이 표현 되는 게 좀 더 현실적이다.
* 이렇다 보니, `View Controller`에 많은 로직들이 존재하게 됨
  * 프레젠테이션 로직
  * 비즈니스 로직
  * 데이터 접근 로직
  * 등등...
* 결국에 Massive View Controller (MVC)라는 불명예스러운 용어가 붙게됨

### 위와 같은 이슈로 발생하는 문제
* `ViewController`가 너무 많은 책임을 지고 있다.
* 모델(데이터)를 직접 접근하면서 수정하다보니, 버그에 취약하게 됨
* 유지 보수가 어려움 (변경과 수정에 어려움이 많아짐0

## 기존 문제를 어떻게 해결할까?

* `ViewController`를 View레이어로 생각하자
  * View 레이어에서 해야하는 일
    * 데이터를 뷰에 표시
    * 사용자 인터랙션 받기
* View 레이어에 알맞은 형태로 Model을 가공해서 전달하자
  * 즉, ViewModel을 제공하자
    * 예를 들어 Model에 `Date`타입이 있다면, `String`으로 변환해서 주자
  * ViewModel에 필요한 각종 Controller 및 Manager는 View 레이어가 모르게 하자
    * 예를 들어 `ViewController`에 네트워크 서비스, 디비접근 리포지토리 등을 놓지 말자
* 결론적으로 `ViewModel`을 만들자

## MVVM은 그럼 어떻게 만들까?

* MVVM 이란?
  * Model - View - ViewModel
* MVVM 구조
![](https://velog.velcdn.com/images/woojusm/post/b12f0e9f-0463-4bfd-b87d-6c4026d7629c/image.png)

* ViewController는 ViewModel을 들고 있음
* ViewModel은 Model(Data)을 들고 있음
* ViewModel은 다음과 같은 역할을 함

### 1. Data -> Output
  * Model(Data)를 가지고 있고,
    * View에 적용할 수 있도록 가공되어 있음
### 2. User Action -> Input
  * User Action에 대한 처리를 담당함
    * 실제 액션에 대해서는 View가 알려줌
    * 다만 액션으로 수행되어야 하는 비즈니스 로직을 처리함
    
## 참고
* https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/MVC.html

