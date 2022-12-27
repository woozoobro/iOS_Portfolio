# Combine

-이벤트 처리 연산자들을 통해 비동기 이벤트들을 핸들링 할 수 있게 하는 것

## 개요

컴바인 프레임워크는 시간에 따른 값 처리 Swift API를 제공한다. 여기서 값이란, 많은 종류의 비동기 이벤트들이 될 수 있다. 컴바인은 시간에 따른 값을 제공할 수 있는 publishers와 publisher로부터 해당 값들을 받는 subscribers 로 정의 된다.

* Publisher 프로토콜은 시간에 따른 값의 흐름을 전달할 수 있는 프로토콜이다. Publisher는 값을 받아 처리하고 다시 전달하는 연산자들을 가진다.
* publishers 체인의 끝에서, subscribers는 값을 수신 받을 때 동작된다.publishers는 subscribers가 요청한 경우에만 값을 내보낸다. 이를 통해 우리가 만드는 subscribers 코드는 언제 값을 수신하고, publishers와 연결될 지 정할 수 있게 된다.  
여러개읜 publishers의 출력을 조합 및 상호 작용하도록 작성할 수 있다. 예를 들어, 텍스트 필드 publisher를 subscribe 하고 이 값의 변화에 따른 url 요청을 할 수 있다. 그 다음 응답을 처리하는 다른 publisher를 사용하고 앱에 결과를 반영할 수 있다.  

컴바인을 채택해서 이벤트 처리 코드들을 중앙 집중화 하고, (중첩 클로저나, 다른 타입들을 가진 콜백들)과 같은 문제들을 제거하고 코드를 읽기 쉽게 유지 관리할 수 있다.  
여기까지 애플 컴바인 문서의 첫장의 개요  
___
## Async 101
* 동기, 비동기? 작업은 뭐야? ->
  * 동기: 요청과 그 결과가 동시에
    ![](https://velog.velcdn.com/images/woojusm/post/289b65f4-869c-4337-8d29-db0040ae4a28/image.png)


  * 비동기: 요청과 그 결과가 동시가 아님
    * 예) 이메일로 대화
      * 대답이 언제 올지 몰라  
      ![](https://velog.velcdn.com/images/woojusm/post/a97ea83a-aa5a-4b61-80eb-6827614ecd73/image.png)

* 모바일 개발에서 비동기 작업은 엄청 많다
  * 예)
    * 서버에서 데이터 받아와서 페이지 보여주기 (언제 네트워크 통해서 데이터 받는게 완료될지 몰라...)
    * 사용자의 버튼 인터랙션 (언제 터치할 지 몰라...)

## 왜 Comgine이 소개되었는가?

* 효율적인 비동기 처리
  * 기존의 비동기 처리 방식들
    * Target / Action
    * Notification Center
    * URLSession
    * KVO
    * Ad-hoc callbacks
  * 여러 방식들을 조합해서 개발하다보니, 코드가 복잡
  * 통합된 비동기 처리 방식이 필요
* 일관된 방식으로 비동기 처리할 수 있는 API를 combine으로 제공
  * A unified, declarative API for processing values over time  

## Combine Overview
* 3가지 주요 컴퍼넌트
  * Publisher
    * 이런 단어가 어울림: 생산자, 배출자, 크리에이터, 배설자
  * Subscriber
    * 이런 단어가 어울림: 소비자, 구독자, 받는 사람
  * Operator
    * 이런 단어가 어울림: 변경시키는 사람, 마법사, 가공 하는 사람
* Event Stream (Event pipeline)

![](https://velog.velcdn.com/images/woojusm/post/40a9da65-f5d7-4caf-a63b-aa3476688799/image.png)


