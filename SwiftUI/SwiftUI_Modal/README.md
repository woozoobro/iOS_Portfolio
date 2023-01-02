# SwiftUI 모달

![](https://velog.velcdn.com/images/woojusm/post/3b08503e-65c9-4585-a613-81797903d9f5/image.gif)

## UI구성
현재 애플 프레임워크 메뉴 앱 콜렉션뷰로 구현이 된 상태  

디테일 뷰 부터 만들자  
![](https://velog.velcdn.com/images/woojusm/post/45b896a8-7d84-4699-a2d2-bb6a7995b81c/image.png)  
바인딩 된거 꽂아줄때는 .constant로 임시로 꽂아주는거 잊지말기!!  
___
sheet이라는 메소드를 사용할 건데 isPresented라는 Bool이 @State로 선언되어야 할 거 같음  
-> 차라리 기존 list 랑 묶어서 ViewModel로 만들자  
![](https://velog.velcdn.com/images/woojusm/post/3f218ddb-9730-4e86-a208-586f0a483537/image.png)  
![](https://velog.velcdn.com/images/woojusm/post/82b303dd-9df6-4322-8b92-d5474005eabb/image.png)  
근데 지금 약간 헷갈리는게 $를 붙여줘야할지 말지인 것 같다  
*  우선 붙인 상태에서 진행해보자   
( @State선언된 객체의 '프로퍼티'에 접근하고 싶을 때 $를 붙인다는 애플의 설명 )




## 모달 넣어보자  
![](https://velog.velcdn.com/images/woojusm/post/f80c8e53-9e74-4346-8c8c-b591ec5b40fb/image.png)
FrameworkCell을 .onTapGesture로 클릭되었을 때 뭐할 지 설정해줄 수 있음  
선택된 아이템을 뷰모델에 추가해줘야할 거 같다  


![](https://velog.velcdn.com/images/woojusm/post/f069b016-ed9a-44e3-9578-a2224850c0c1/image.png)

![](https://velog.velcdn.com/images/woojusm/post/2a3f0ce6-3d24-424c-8aa5-6bf13ccff8d9/image.png)

이렇게 작성했을 때  
![](https://velog.velcdn.com/images/woojusm/post/d92ce0db-b33d-46e1-b8d9-3b33d4c1cae8/image.png)  
FrameworkDetailView의 framework도 optional이 되어야 해서 피가 난다  
옵셔널 바인딩해주자  
![](https://velog.velcdn.com/images/woojusm/post/5cad402f-5234-4188-9c2e-2f5350588cf4/image.png)  

오케이  

![](https://velog.velcdn.com/images/woojusm/post/12e23ff2-a75e-4c5f-89b6-795d1472881f/image.png)  
.sheet은 모달 형태중에 하나! .fullScreenCover 같이 꽉찬 화면으로 넘기는 것도 가능!   
![](https://velog.velcdn.com/images/woojusm/post/3b496c30-e8ac-4e3a-8383-9ab35bf2ca71/image.png)  

요렇게  

풀스크린 모드로 나오는데 버튼으로 닫는 거 잠시 구현해보자  

FrameworkDetailView에서 @Environment(\.presentationMode)  
![](https://velog.velcdn.com/images/woojusm/post/d9b6b33a-3326-441b-9084-cfdde349479b/image.png)  
애플에서 만들어둔 모드임!  
이런 식으로 Environment 변수 선언하고  

![](https://velog.velcdn.com/images/woojusm/post/00685a28-f922-492c-9f49-83f3ebb71858/image.png)  
요런 식으로 dismiss 가능  


![](https://velog.velcdn.com/images/woojusm/post/51d037b3-0783-4056-8178-0d1b0ff5e735/image.png)  
요렇게도 디스미스 가능!  밑에꺼가 더 깔끔해 보이긴 한다  

![](https://velog.velcdn.com/images/woojusm/post/daa717c8-ee6f-4753-9cc2-6dac9b7f555f/image.png)  
요런식으로 상태 확인도 가능함  


![](https://velog.velcdn.com/images/woojusm/post/e3779e3f-74b4-40e9-9743-6aa09c5d0c90/image.png)

![](https://velog.velcdn.com/images/woojusm/post/4489b078-4525-4c3b-965f-5c34a823935b/image.png)  

![](https://velog.velcdn.com/images/woojusm/post/accbbe11-f7b8-4d41-9374-341e969c0221/image.png)  

저렇게 isShowingDetail을 바인드 해서 디스미스도 가능하다  
PresentationMode랑 매핑이 되는 것 같음  


___

## ViewModel
현재 DetailView의 변수 framework가 옵셔널로 선언되어 있는데 옵셔널이 아니게 바꿔주고 싶다  
뷰모델을 만들어주자  

![](https://velog.velcdn.com/images/woojusm/post/0a199a99-cfc4-4ddc-a918-f08a87e7858d/image.png)

![](https://velog.velcdn.com/images/woojusm/post/a6d0c34b-aa40-4742-bd49-be5cff8ba5d3/image.png)
![](https://velog.velcdn.com/images/woojusm/post/1ac8ba4f-5173-4a6e-a1d3-8e6790df5dc3/image.png)

이제 디테일뷰 디자인 디테일 추가!!  

![](https://velog.velcdn.com/images/woojusm/post/56e8ca72-9050-446e-bd38-a659d6fa5b08/image.png)

## 사파리뷰 띄우기

![](https://velog.velcdn.com/images/woojusm/post/23a38b09-1952-487e-affe-5d7c41dbc76f/image.png)

먼저 사파리뷰를 만들어준다  

![](https://velog.velcdn.com/images/woojusm/post/8bdcc7d5-f25a-4916-8bc4-1678bee2e068/image.png)  
sheet 으로 띄울건데 Binding된 변수가 필요함  
![](https://velog.velcdn.com/images/woojusm/post/2a087fdb-c938-4002-923d-283a5eab6614/image.png)  
isSafariPresented 를 만들어 줬다  
버튼이 토글되면 이 값이 변경되게 되고 바인딩이되어 있어서 UI로직이 작동하게 되는 원리  
![](https://velog.velcdn.com/images/woojusm/post/45931621-911b-4cc0-a32e-a5a6f0c0decb/image.png)  

뷰를 내리게되면 다시 false로 자동으로 바뀜!!  

