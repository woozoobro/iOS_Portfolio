# 당근 홈 탭

![](https://velog.velcdn.com/images/woojusm/post/43849721-fbfb-4619-a4f7-5d3a66141426/image.gif)


![](https://velog.velcdn.com/images/woojusm/post/1dbc2f03-d49b-4ab1-aa6b-b9d6380112ea/image.png)

여태까지와는 다르게 세그를 끊고  
UINavigationController 파일이랑 UITabBarController을 만들어주자  

Storyboard를 나누는 이유는 한 스토리보드 내에서 계속 작업하게 되면 여러 뷰들간에  
충돌이 생길 수도 있어서!!  

탭이 되었을 때 아래의 탭바가 사라진다고 가정해보자  
그럼 Navigation이 Tabbar를 들고 있는 구조로 만들어주면 됨!  
![](https://velog.velcdn.com/images/woojusm/post/b310d445-b12c-44de-b812-49652787dda3/image.png)

네비게이션에서 우클 드래그해서 탭바 컨트롤러로 루트뷰 설정해주면됨  
![](https://velog.velcdn.com/images/woojusm/post/915520b2-e92d-4f0b-953f-5049353dbcdf/image.png)
DetailVC가 푸시되게 해보자  

탭바에 연결된 Controllers의 item 이미지와 이름 설정!  

탭바의 이미지 틴트도 변경해줌  
___

![](https://velog.velcdn.com/images/woojusm/post/9bd85217-bce9-426c-bc34-d077cc463a27/image.png)
좌측 상단에 보이는 것처럼 leftBarButtonItem을 설정할 수 있음!  
![](https://velog.velcdn.com/images/woojusm/post/91b55662-317f-4cd1-871a-f22cda8872ef/image.png)  
요렇게 우측에도 만들어 줄 수 있음  

근데 해보고 싶은 건 각각의 탭바가 눌렸을 때 다른 네비게이션 아이템들을 그려보고 싶다  
![](https://velog.velcdn.com/images/woojusm/post/d6e46e67-3844-49cf-8421-e2e0345ea6f0/image.png)
![](https://velog.velcdn.com/images/woojusm/post/0f4b217e-346a-4a5d-9325-4943b6bd1555/image.png)

delegate 작성해줌! 

viewController 몇개만 작성해서 탭이랑 연결해주자  
![](https://velog.velcdn.com/images/woojusm/post/80d20a39-2e27-42be-98f8-50e8ef69b79f/image.png)
그리고 switch case로 들어온 viewContoller의 네비게이션 아이템을 바꿔 줬다  
![](https://velog.velcdn.com/images/woojusm/post/df33f421-49d4-47e7-a430-61e272ab975b/image.png)

글자랑 디자인 수정이 필요할 거 같다  
![](https://velog.velcdn.com/images/woojusm/post/5843b05a-ea5b-467c-8167-0b416de12a6d/image.png)  
커스텀뷰로 BarbuttonItem을 바꿔보자  
새로운 뷰를 만들어줘야겠다  

![](https://velog.velcdn.com/images/woojusm/post/260471ec-983b-4280-91e1-487fd151d699/image.png)

근데 init부분의 파라미터를 조금 더 일기 쉽게 만들고 싶다  
구조체로 재정의 하자  
![](https://velog.velcdn.com/images/woojusm/post/1f561604-8a27-4d67-93c0-713f40085a50/image.png)  

![](https://velog.velcdn.com/images/woojusm/post/fa209043-cd78-424b-9949-279872bd7834/image.png)  

요런느낌으로 커스텀 가능  
![](https://velog.velcdn.com/images/woojusm/post/fcecaaee-5f03-4385-bf7b-70aaf4b139b0/image.png)  
![](https://velog.velcdn.com/images/woojusm/post/0cbedf98-8465-4c5c-8e21-ce573b9ec301/image.png)  


아이템 constraint 조절도 가능함  
![](https://velog.velcdn.com/images/woojusm/post/ad79a8f6-0167-45a9-bade-b0a19c70b84a/image.png)

근데 이대로 전부 다 설정해주자니 코드가 길어진다  
공통분모들 묶어보자  
![](https://velog.velcdn.com/images/woojusm/post/f3ffb8e2-a2ee-4df8-b73e-1c0c2d237322/image.png)

UIBarButtonItem의 extension을 만들어주고  
구조 자체는 조금씩 복잡해지지만 일반적인 뷰들이 어떤 느낌으로 구성되는지 감이 조금씩 온다  
![](https://velog.velcdn.com/images/woojusm/post/92d0a65f-f741-41d8-9fc3-ac963b2e51c1/image.png)


![](https://velog.velcdn.com/images/woojusm/post/362cad3e-dbe0-47da-bd68-9cf3dc6f6b4c/image.png)
아이템 안띄워주고 싶을 경우에는 빈 배열로 작성해줘야함  

근데 첨 로드 될 때 세팅이 안되고 있다   
![](https://velog.velcdn.com/images/woojusm/post/99643c02-65fc-49db-8073-bd4b1d50b955/image.png)  
view가 뜨기 전에 self.selectedViewController에 접근이 가능한데
이전에 작성했던 로직을 따로 빼서 updateNavigationItem을 한뒤에 넣어주면 되겠다!!  
![](https://velog.velcdn.com/images/woojusm/post/dea79fc9-3672-450c-9296-ee462782268b/image.png)
![](https://velog.velcdn.com/images/woojusm/post/e121ec4f-20af-45a5-8547-afc5fe31c9b1/image.png)  
요렇게!  
![](https://velog.velcdn.com/images/woojusm/post/aae25886-a5f8-4ccf-be45-32c35f02b04e/image.png)  
그리고 지금 새로운 뷰로 푸쉬되서 들어갈 때 Back이라는 단어도 없애고 싶다  
backButtonDisplayMode를 .minimal로 설정해주면 텍스트도 사라짐  

그리고 푸쉬되고난 후의 navigationItem의 아이콘을 바꾸고 싶다면  
![](https://velog.velcdn.com/images/woojusm/post/5be31e18-67a3-42ca-82e0-02a9e7e1adc5/image.png)  
푸쉬가 펼쳐진 뷰컨트롤러로 들어가서 처리해주면 된다  
___
폴더 정리 해주자

![](https://velog.velcdn.com/images/woojusm/post/48229fb8-3f06-4d6d-83a8-6ff5972cee54/image.png)

___
## 띄울 데이터 가져오기  
홈 뷰모델 만들고 뷰모델은 데이터를 가져올거다  
먼저 메인 스토리보드에 있는 뷰컨트롤러를 똑 떼서 새로운 스토리보드로 만들어주자  
뷰 컨트롤러 선택하고  
Editor - Refactor to Storyboard 해주면 됨  

그리고 홈뷰모델 만들어주자  
![](https://velog.velcdn.com/images/woojusm/post/5687c974-4e1a-4af8-97d2-9fe4f49cdf6e/image.png)

![](https://velog.velcdn.com/images/woojusm/post/e20f2880-2e49-4a5c-8c71-80f7a1506406/image.png)
바인드 까지 끝!  
___
## 콜렉션뷰 구성

![](https://velog.velcdn.com/images/woojusm/post/8433a911-3f54-42be-9d2f-9cf6fa17beac/image.png)

홈vc에서 Combine으로 콜렉션뷰 구성해줌  
___
## 디테일뷰

구성해주고 bind

___

# 옵션 누르고 드래그하면 여러줄 한번에 수정 가능  

