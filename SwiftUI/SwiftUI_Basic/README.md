# SwiftUI 기초 View 만들어보기

## 기초 View 만들기

프로젝트를 SwiftUI로 맞춰놓고 생성해준다  
새로운 view를 만들 땐 이제 SwiftUI로 만들어야한다!!  
![](https://velog.velcdn.com/images/woojusm/post/fa41cf4c-38c9-4a4f-9f43-7beb07a6fd4c/image.png)

TextView라는 이름으로,  
ButtonView라는 이름으로,  
ImageView라는 이름으로 새로운 뷰를 생성해보자  

![](https://velog.velcdn.com/images/woojusm/post/2790dddf-a36b-4fbe-9a75-9b338fe49639/image.png)
어떤식으로 구성하는지 보면 알 수 있듯이 클로져 형태를 많이 사용한다!  
![](https://velog.velcdn.com/images/woojusm/post/e5cc2d30-b285-42ce-b7ac-5ec316b29b56/image.png)  
SwiftUI_BasicApp 파일을 보면 이니셜 뷰를 설정해줄 수 있다!  
새로 만들어준 친구들로 변경하면?!  바뀌겠죠!  

## Modifier 추가해보기!  
![](https://velog.velcdn.com/images/woojusm/post/7265a9d4-8ac0-40d1-8c37-56aa0ea5e399/image.png)
.문법으로 modifier를 추가해서 커스텀할 수 있다!  
![](https://velog.velcdn.com/images/woojusm/post/96d3befc-73a5-4f40-a518-36aceeb7ce56/image.png)
이미지뷰도 마찬가지!  

![](https://velog.velcdn.com/images/woojusm/post/1c58969e-d18b-47b9-9170-ead98fc9649e/image.png)  
버튼도 간단하게 바꿀 수 있다  
단 모디파이어에도 순서가 있음  
반환형태가 달라지게되면 순서에 유의해야함  
인스펙터창에서 모디파이어 넣어줄 수도 있음!
![](https://velog.velcdn.com/images/woojusm/post/577d6b0e-1ecc-430f-8678-88b67952ec8e/image.png)  
우측 하단에 있는 거  

## Stack을 이용한 레이아웃 

UIKit의 스택뷰랑 비슷하다! 
ZStack이 추가된 것말고는!  
![](https://velog.velcdn.com/images/woojusm/post/410dc170-e111-43b9-8178-c1f9854eb8bf/image.png)

호호 이지  
위에있는게 젤먼저 `등장`한다고 생각하면 된다!  
유니티에서 hierarch 쌓을 때랑 똑같음  


![](https://velog.velcdn.com/images/woojusm/post/919f98a5-9ed7-4154-8bf1-ac0ec0dcc7a2/image.png)

요렇게 스택이 가진 () 파라미터를 가지고 올 수도 있다!  

