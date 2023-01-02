# SwiftUI_참조형태 data 모델 전달


![](https://velog.velcdn.com/images/woojusm/post/2a97cb66-ba80-476b-9eb8-5abdc0a80127/image.gif)

Viewmodel
* list
* favorite
을 만들어봅시다  
![](https://velog.velcdn.com/images/woojusm/post/c69791a4-3f58-4376-b945-d681c03971c8/image.png)
ObservableObject 프로토콜을 준수하는 StockRankViewModel을 만들고  
모델을 @Published로 선언한다  

![](https://velog.velcdn.com/images/woojusm/post/2977d538-d9c3-4d62-9271-75c836a5f7ef/image.png)  
기존에 있던 건 코멘트아웃하고 @StateObject로 스톡랭크 뷰모델 선언해줌  

![](https://velog.velcdn.com/images/woojusm/post/aba87dd3-3de9-4127-ae28-21e1b223beac/image.png)
뷰모델에 있는 models 가 StockModel.list이니까 저렇게  
$vm.models 로 리스트에 넣어줘야함  

## 디테일 뷰 수정

![](https://velog.velcdn.com/images/woojusm/post/6d20385b-1c31-4dd1-bb12-4a0a476e9f07/image.png)

위에 텍스트엔 내가 좋아요 표시한 거 몇개인지 볼거임
아래의 이미지는 선택하면 색깔이 바뀔거고  

![](https://velog.velcdn.com/images/woojusm/post/7cf0e2b8-71a8-45a6-8d6d-4b3408357d42/image.png)

isFavorite Bool 값에 따라 바뀔거라서 모델에 새로 변수 작성해줌  

이제 하트이미지 버튼으로 바꿔주면 될 것 같다  

![](https://velog.velcdn.com/images/woojusm/post/0d48f0fd-23e1-4b2a-abf5-75fc63aaa298/image.png)

Button이 할 액션 넣고 label안에 이미지 넣어줌  

![](https://velog.velcdn.com/images/woojusm/post/1359faf3-8c92-4c25-b80b-7a00b0bb9831/image.png)
@ObservedObject var vm: StockRankViewModel을 옵저브 하게 해줬다  

![](https://velog.velcdn.com/images/woojusm/post/549e037d-eecd-4061-951b-d538a9937030/image.png)

![](https://velog.velcdn.com/images/woojusm/post/06fa6711-a4fb-408e-88b5-c5db04057afc/image.png)

그리고 몇개의 하트가 눌렸는지 새로운 변수가 필요할 거 같다

![](https://velog.velcdn.com/images/woojusm/post/60aa706e-4b38-419a-993f-a97d027a5d42/image.png)
numOfFavorites는 스톡 모델을 필터 메소드로 .isFavorite 값이 있는 것들을 모아서
갯수로 전달하게 해줬다  


![](https://velog.velcdn.com/images/woojusm/post/53f586eb-b4fb-4f58-9ec3-86d6d1376442/image.png)
스톡 디테일뷰에 넘겨줄 때 전달되는 애는 vm인데 이때는 $사인이 필요 없다  

## 기존 뷰 업데이트!  

지금 디테일뷰로 넘어갈 때 까진 괜찮은데  다시 돌아왔을 때 하트의 색상이 안바뀌고 있음  
![](https://velog.velcdn.com/images/woojusm/post/1daf7357-71e8-465b-bfad-4176f8004ba8/image.png)
수정해주면 된다!  
