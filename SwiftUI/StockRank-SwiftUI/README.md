# SwiftUI 리스트 구현하기

## UI 구성

SwiftUI View로 Row부터 만들어보자

![](https://velog.velcdn.com/images/woojusm/post/1e35b8eb-f4df-4fe3-8c02-983e326cfb2e/image.png)  

![](https://velog.velcdn.com/images/woojusm/post/bd74013d-7590-4cdd-891e-3d45dae6a2dc/image.png)
디테일들 추가해서 UI 제대로 그려주고!  


## 데이터 넘겨주기 (RowView 만들기)

![](https://velog.velcdn.com/images/woojusm/post/dbfb7e83-b97a-4df6-ae98-7796eb91bbb5/image.png)
![](https://velog.velcdn.com/images/woojusm/post/d390bc55-9098-4ae4-8a93-c7cb89c521f6/image.png)


스톡 모델 변수로 선언해주고 프리뷰될때 모델 초기화해준다!  
![](https://velog.velcdn.com/images/woojusm/post/9c46235f-32f5-4e7c-b8f5-53d9c72fbc60/image.png)

지금 stock.diff 뒤에 소수점들이 보인다 
![](https://velog.velcdn.com/images/woojusm/post/11897bc4-d480-4bcc-899e-1b0a86a9dfba/image.png)
String format하던거랑 비슷하게 specifier 파라미터를 사용해주면 됨!  
![](https://velog.velcdn.com/images/woojusm/post/52cc30a5-a21f-43db-946d-ca64bf573d1c/image.png)  
삼항연산자 사용해서 폰트색상 변경되게 해주고!  

## RowView 쌓아주기

![](https://velog.velcdn.com/images/woojusm/post/02ef65da-419d-43b4-804a-1b70b38a468f/image.png)

@State 로 싱글소스오브 투르스 list 를 만들어주고
위아래로 쌓을거니까 VStack안에 ForEach를 통해서 가지고와준다  
![](https://velog.velcdn.com/images/woojusm/post/25ab3abe-ab7f-444a-926d-c031000630e0/image.png)


근데 이대로는 스크롤이 안됨  
VStack을 스크롤 뷰로 바꿔주자  
![](https://velog.velcdn.com/images/woojusm/post/dc0e4bf2-1a61-4738-8863-0df6eaa38366/image.png)

## List
콜렉션뷰를 생각해보면 셀들이 화면밖으로 나가게되면 다시 재사용 하게되는 경우처럼  
SwiftUI에서도 이런 매커니즘을 사용할 수 있다.

![](https://velog.velcdn.com/images/woojusm/post/e9407463-1ae5-4f9e-8a9f-3475c4d8955c/image.png)  
![](https://velog.velcdn.com/images/woojusm/post/3ccf1713-be70-4a24-8196-47d806a412f7/image.png)
리스트에는 기본적인 디자인이 적용되어 있는데 이것들을 바꾸자  


![](https://velog.velcdn.com/images/woojusm/post/868af75d-cebf-45f5-a5ff-ff02960479e0/image.png)



