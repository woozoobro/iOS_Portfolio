# 깃헙 서치 (콜렉션 뷰)

## 해야할 것들

* SearchController  
* collectionView 구성
* bind() 검색된 사용자를 collectionView 업데이트하는 메소드  
  * 데이터 -> 뷰
    * 검색된 사용자를 collectionView 업뎃 하는 거  
  * 사용자 인터랙션 대응
    * 서치 컨트롤에서 텍스트 -> 네트워크 요청


## 서치컨트롤 넣기
![](https://velog.velcdn.com/images/woojusm/post/7570aef0-8842-42aa-bd9a-5af6d8f067e9/image.png)

필요한 프로토콜 구현해줘야겠죠  
![](https://velog.velcdn.com/images/woojusm/post/4b12a900-7568-42fb-b6e3-39382977b586/image.png)

## collectionView 구성  


![](https://velog.velcdn.com/images/woojusm/post/aac9b6f5-a83b-4a0a-8e58-60da979a6f14/image.png)

diffableDataSource로 만들어줄 거고
configureCollectionView라는 메소드를 새로 판다!

![](https://velog.velcdn.com/images/woojusm/post/b69b91b8-8a6e-460c-8430-2b4f38083245/image.png)

프레젠테이션과 레이아웃을 묶음 configureCollectionView 메소드를 만들었다!

스냅샷은 어디에서 구성해줘야하지?!  

## bind() 메소드
구성해줄건데 먼저 필요한 요소들 준비!  
![](https://velog.velcdn.com/images/woojusm/post/7910a6df-f346-4581-9191-5a175a9b68ed/image.png)

![](https://velog.velcdn.com/images/woojusm/post/ed599e56-4224-44d4-9579-f3ef11cf137d/image.png)


바인드에서 스냅샷 구현해줬다!!  
users의 값이 변경되면 snapshot이 적용되게!  

## User Interaction 구현하기

서치 버튼을 눌렀을 때 실제로 검색이 되게끔 만들어줘야겠다

![](https://velog.velcdn.com/images/woojusm/post/4b1613c0-7c0a-4981-8f7e-270a0e11f21e/image.png)

네트워크 request를 만들어줬다
이번엔 queryItem을 사용했는데
실제로 어떻게 url이 만들어지는 지 궁금해서 찾아본 결과  
![](https://velog.velcdn.com/images/woojusm/post/411412ab-4c52-4179-a390-e48e951d6b5f/image.png)

`https://api.github.com/search/users?q=woozoobro`
의형태로 만들어진다!! 
그럼 queryItem은 ? 와 키 "q" , 그리고 value "username"이 들어가게 되는 거!!  

그리고 SearchUserResponse 모델을 따로 뺐던 이유는 
지금 보는 것처럼 items안에 배열의 형태로 담겨 있어서임!!  

## 네트워크서비스 리팩토링해보자


`let network = NetworkService(configuration: .default)`
네트워크 서비스 추가해주고
![](https://velog.velcdn.com/images/woojusm/post/035dc387-c2ec-42be-93c1-34271d2b2c23/image.png)  
Resource는 SearchUserResponse 타입이 온다고 명시해줌.  
(이게 최상위에 있으니까! items로 안에 담겨있는 게 SearchResult의 내용들이니)  

![](https://velog.velcdn.com/images/woojusm/post/1d35ad66-4baa-4e8a-a7a9-161f6fc28764/image.png)  
보면 네트워크 서비스에서는 load메소드가 아래의 코멘트아웃된 decode부분까지만 작성되어 있음  
그러니까 mpa으로 안에담긴 items를 꺼내오고 에러없애주고 ... 이렇게 진행되는겨  


