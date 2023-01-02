# EnvironmentObject 프로젝트

![](https://velog.velcdn.com/images/woojusm/post/03d02289-7d0e-46f1-89ee-7b30545c8685/image.gif)

## UI 구성

![](https://velog.velcdn.com/images/woojusm/post/6fa3a081-b58d-4f73-9a8f-dcd1c5b8339a/image.png)


크게 다른점은 없다  
NavigationLink 처음 클로져는 목적지 작성해주는 곳  


![](https://velog.velcdn.com/images/woojusm/post/61918883-355f-41e5-a21a-157ef85727ca/image.png)  

데이터 전달해줄 파일 만들었다!  
ObservableObject 채택하고 필요한 변수들 퍼블리쉬 해줌  
![](https://velog.velcdn.com/images/woojusm/post/a404f9d3-274f-452c-a108-092082c255f5/image.png)
처음 시작 관리하는 스트럭트로 와서
@StateObject를 방금 만들어준 모델로 선언하고
FirstView에 .environmentObject(userprofile)로 꽂아줬다  

![](https://velog.velcdn.com/images/woojusm/post/120d1594-8ea8-430e-8db3-4b0bf33a251a/image.png)  

FirstView로 와서 @EnvironmentObject로 UserProfileSettings 타입의 변수를 선언해준다  
그리고 프리뷰에도 .environmentObject(UserProfileSettings()) 꽂아줘야 에러 안남

그러고 나면 이제 body View에서 userProfile의 요소들에 접근이 가능해진다  

SecondView로 네비게이션 되게 해주고!  

![](https://velog.velcdn.com/images/woojusm/post/d65e10c6-8c4f-4306-873b-b09a82e805ad/image.png)  
SecondView에서 ThirdView로 넘어가게 작성!  
(이 때는 UserProfile 데이터는 아무것도 사용하지 않고!)  


![](https://velog.velcdn.com/images/woojusm/post/1f45094c-df1e-474c-a49d-c45656d6034b/image.png)  
Third View로 넘어와서  
.environmentObject를 서드뷰에 꽂아줬다!!   
