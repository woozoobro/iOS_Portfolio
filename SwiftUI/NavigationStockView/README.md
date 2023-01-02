# SwiftUI 네비게이션 뷰

* `NavigationView` 이용해서 네비게이션 뷰 + 컨트롤러 표현
  * `NavigationView` 가 감싸는 View에 `navigationTitle` 지정하기
* 네비게이션 push 를 구현하기 위해서 (상세뷰로 들어가기)
  * `NavigationLink` 이용
  * `destination View` 제작하기

___
## 상세뷰 만들기

StockDetailView를 만들어주자  

![](https://velog.velcdn.com/images/woojusm/post/ec9cccbf-9df7-4000-9794-f8a0c55d2f52/image.png)

@State는 Single source of truth 로 진짜 데이타!!
@Binding은 Single source of truth로 참조형태로 접근하는 방법!  


![](https://velog.velcdn.com/images/woojusm/post/b49ecd1b-321a-46a7-82eb-f2b457e8aac9/image.png)

@Binding으로 바인드 해줍니다  
그리고 .constant를 통해서 현재 프리뷰 되고 있는 곳에 값 임시로 넣어줄 수 있음  


___
## 🤔 궁금한 점  
@State로 선언했던 변수는 [StockModel] 타입이었는데
@Binding은 StockModel 타입이다?!  
어떻게 가능할까  추후에 찾아보기로
___


![](https://velog.velcdn.com/images/woojusm/post/5cd797a3-e445-493f-927c-4eef7e840d94/image.png)

아래에 보면 .preferredColorScheme이 있는데 프리뷰 할 때 다크모드로 본다는 거 작성해줌  
![](https://velog.velcdn.com/images/woojusm/post/0c5c42ea-4ad6-48c8-b4f4-b55c1bd15b12/image.png)
그리고 Binding해서 넣을라면 $ 로 접근해줘야함  


![](https://velog.velcdn.com/images/woojusm/post/01acfe1e-c3b8-4c35-9f4f-52d80d956651/image.png)  


아 그리고 프리뷰 레이아웃 하려면 우측에서
![](https://velog.velcdn.com/images/woojusm/post/6f784192-7de9-4c65-af88-0f37e8ecedfb/image.png)
화살표 버튼 눌러야 나오는 걸로 업데이트 된 듯  


## 네비게이션 뷰 넣기

NavigationView로 감싸준다  
넣는 위치는 StockRankView임  

![](https://velog.velcdn.com/images/woojusm/post/a748155e-4a61-4d46-a9ba-ded687dd0044/image.png)  

요런 식으로  
![](https://velog.velcdn.com/images/woojusm/post/96c03eb6-babc-4468-b58c-4dd1e65ff4a4/image.png)

그리고 강제로 다크 뷰로 보게 요렇게 작성해줌  

![](https://velog.velcdn.com/images/woojusm/post/20b1a515-73af-4986-9605-6e87d5282bcf/image.png)

NavigationLink를 넣어주면 창 새로 띄울 수 있게 된다!  

![](https://velog.velcdn.com/images/woojusm/post/fe84cda4-0f09-4408-abf4-3f983c27b275/image.png)
가고싶은 뷰를 destination으로 작성하고, 
그전에 표시해줄애를 뒤에 작성함  

근데 지금 클릭할 때 이상한 테두리가 보임  
없애보자  
![](https://velog.velcdn.com/images/woojusm/post/a5e999a2-f306-421b-bcd1-d83d372dfe4c/image.png)  
ZStack으로 꼼수를 써볼 수 있음 (아직 제대로 만들어져 있지는 않은 것 같다)

NavigationLink와 StockRankRow를 Z축으로 나눠 놓고 (그래서 label:에 EmptyView()가 들어가게 됨, 원래는 아무 것도 안넣어도 되지만 이상해서)  


___
## 새로 알게 된 사실

![](https://velog.velcdn.com/images/woojusm/post/0d69139d-d6b7-46d8-b59c-d770fc0f8be9/image.png)

![](https://velog.velcdn.com/images/woojusm/post/663441ac-44bd-4f1b-8ce5-396136571c98/image.png)

var id: UUID = UUID() 가 아니라 다른 방법으로 되어 있으면
order가 이상하게 잡힌다!! 
Identifiable 프로토콜 준수할 때는 UUID 쓰는 걸로!!  

