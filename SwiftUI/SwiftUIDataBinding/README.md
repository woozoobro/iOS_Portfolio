# SwiftUI 데이터 플로우 이해하기

## 사용자 시나리오
* 팟캐스트 플레이어 화면
* 팟캐스트 정보(타이틀, 쇼이름)
* 플레이 버튼(재생 여부에 따라 다르게 표시)
* 현재 재생 상태표시 이미지(재생여부에 따라 다르게 표시)
![](https://velog.velcdn.com/images/woojusm/post/6315bf04-1b2a-4e14-8b5e-9e445bfca030/image.gif)  

___
## SwiftUI 이전에,,,  어려웠던 시절

![](https://velog.velcdn.com/images/woojusm/post/3f8759a6-b297-45a1-bce6-0ba464afd67b/image.png)  


## SwiftUI와 함께라면,,,


![](https://velog.velcdn.com/images/woojusm/post/f7258e16-975f-40db-b102-34896eb85fc0/image.png)  

## 이전엔 왜 어려웠을까?
![](https://velog.velcdn.com/images/woojusm/post/fbb747c4-3ccb-44e8-a1fd-ac7cced94add/image.png)
* 상태 관리를 위해서 중복된 데이터가 여기저기….
* 아,,, 뭐가 진짜야… 🤷‍♀️

## SwiftUI 에서는 Single Source of Truth

- 진짜 상태를 쉽게 관리하게끔 도와줌
    - 바로   `@State` 를 이용해서 Single source of truth 를 나타낼수 있음
    - `@Binding` 을 통해서 Single source of truth 에 접근할 수 있음
- 상태가 업데이트 되면, 뷰는 자동으로 업데이트 된다!! 🔥
- SwiftUI 뷰의 상태 정보는 따로 보관하는 장소가 있음  
![](https://velog.velcdn.com/images/woojusm/post/8fa40715-0828-4493-8314-b2487003f6a3/image.png)  
![](https://velog.velcdn.com/images/woojusm/post/bc7fca11-3405-485f-be77-8098651ae87c/image.png)  
![](https://velog.velcdn.com/images/woojusm/post/1421702f-5e57-4e4c-9dac-ab6fbf7c267a/image.png)  


## 요약

- SwiftUI 에서는  Single source of truth 에 의한 **상태** 관리가 중요함
- SwiftUI 에서는   `@State` 를 이용해서 Single source of truth **상태**를 나타낼수 있음
- `@Binding` 을 통해서 Single source of truth **상태** 정보에 접근 가능
- SwiftUI 에서는 **상태**가 변하면, 뷰는 상태를 반영하여 자동으로 그려짐
___
## 프로젝트에서 살펴보자

![](https://velog.velcdn.com/images/woojusm/post/5af17c9d-1916-4970-8b2c-52e00517929d/image.png)
isPlaying 이라는 bool값에 따라 상태가 변하는 뷰를 만들어 줬다  
![](https://velog.velcdn.com/images/woojusm/post/449d546e-3b1b-4d9c-adc4-9d6bb0872554/image.png)
Button이라는 뷰를 SubView로 빼낼 수 있다 (커맨드 클릭)  

그리고 컨트롤+커맨드+e로 edit all in scope 로 이름 바꿔줄 수 있음  
(리팩터 리네임이랑 비슷)  

![](https://velog.velcdn.com/images/woojusm/post/36e8cc54-e6bb-43cd-8f4f-c3c8f30ca1b9/image.png)
이렇게 새로운 뷰가 아래에 생성되었는데 현재 isPlaying에 대한 값을 접근할 수가 없다  
(가지고있지 않으니까)

![](https://velog.velcdn.com/images/woojusm/post/fe558cd3-06ad-4486-b31c-2dea871ece87/image.png)
@Binding이라는 키워드로 불 프로퍼티를 만들고  

![](https://velog.velcdn.com/images/woojusm/post/ae93437e-6700-4ffb-896e-77742173037c/image.png)

기존에 선언되었던 뷰에서 $isPlaying을 통해 접근하게 되면 끝!  

![](https://velog.velcdn.com/images/woojusm/post/2062e67f-fd3d-4c6a-b8fd-b4b7765da380/image.png)
그리고 새로운 파일들로 뷰를 떼어주면 된다  

상태를 참조를 통해서 여러개의 뷰들이 하나의 정보를 공유하게끔 하는 데이터 구조가  `@State` `@Binding`
