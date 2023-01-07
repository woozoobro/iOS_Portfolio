# 로그인 화면 구현하기
* Firebase: 별도의 백엔드 개발없이 서버리스를 대체할 수 있는 방법


![](https://velog.velcdn.com/images/woojusm/post/1a729a89-f3bb-431f-898f-d4c093de944b/image.gif)

## 기본 UI 구성하기

![](https://velog.velcdn.com/images/woojusm/post/53d80625-2d98-4ecc-a422-ac51a832239d/image.png)

Button에 이미지를 넣어줬는데 이미지와 텍스트 사이에 패딩도 추가했다!  
버튼들에 보더를 줘보자  IBOutlet먼저 연결하고,  
![](https://velog.velcdn.com/images/woojusm/post/ae77b9b0-b738-4f2d-83c4-8dc396aaeb2e/image.png)
forEach 문을 사용해서, 클로져 내에서 border를 설정해줬다  

구글이랑 애플 버튼 액션 추가!  

enterEmailVC 새로 추가해주고  

![](https://velog.velcdn.com/images/woojusm/post/c6eec195-3fe3-43a2-bb76-9967214cf4a9/image.png)

아이디를 만드는 VC를 만들었다  
textField들의 delegate 설정도 해줬는데 내용이 입력되면 다음이 활성화되게 해줬다.
return 키를 누르면 키보드가 내려가게 설정해주고, 화면밖이 터치 되었을 때도 내려가게 해줬다!  
(이거 은근 어플 쓰다가 종종 불편할 때 있었던 경험이..)  
![](https://velog.velcdn.com/images/woojusm/post/ab5a4d68-bee0-48ba-a5f3-5aaee9f90510/image.png)
그리고 현재 VC에 진입하게 되면 emailTextField에 자동으로 입력이 시작될 수 있게 처리!  
![](https://velog.velcdn.com/images/woojusm/post/f64ec7a0-f738-432b-8b34-2eea1ad584c4/image.png)  
다음을 눌렀을 때 진입하게될 VC를 만들었다  
이때 주의할 건 왼쪽 쓸어넘기는 팝 제스쳐 꺼주기, 그리고 네비게이션 바 숨겨주기!!  
(로그인에 성공했는데 바로 이전 뷰로 가기엔 어색하니까)  
![](https://velog.velcdn.com/images/woojusm/post/ddea5c92-f5d3-4e6b-bf16-6192bd361095/image.png)  
![](https://velog.velcdn.com/images/woojusm/post/65702371-8e0e-4d86-ad85-35b5364a579b/image.png)
그리고 로그아웃 버튼 누르면 팝되서 루트뷰로 돌아갈 수 있게 해줬다!  

## Firebase 연결하기!

![](https://velog.velcdn.com/images/woojusm/post/c2d6ec75-22a3-4eeb-aac2-c90cd4bfb25e/image.png)

새로운 프로젝트 만들기!  

새로운 앱 추가해서 시작해주고  
번들ID 추가, 그리고 GoogleService info.plist를 다운받는다  

그리고 Firebase SDK를 설치해야하는데 코코아팟으로도 가능하고,
Swift 패키지 매니저로 설치도 가능하다  
![](https://velog.velcdn.com/images/woojusm/post/c30dae77-a5d4-41d3-82fb-d28902d6ec60/image.png)  
이번엔 Firebase Auth를 체크하고 설치해주자  
![](https://velog.velcdn.com/images/woojusm/post/b1b774c1-90ec-49d5-a14c-b58299cd4cbc/image.png)  
AppDelegate에서 Firebase 초기화 코드를 작성  

## 인증 추가  
콘솔에서 Authentication 탭으로 들어간다  
이메일 비밀번호 로그인을 사용설정으로 바꿔준다  
![](https://velog.velcdn.com/images/woojusm/post/7f1c5651-6cb3-423d-9c96-a4a28cb460d2/image.png)  
이메일 비밀번호 입력하는 VC에 FirebaseAuth 추가  
![](https://velog.velcdn.com/images/woojusm/post/64e53949-9a58-4996-b725-b5ff4cc7aeea/image.png)

다음 버튼이 탭될 때 신규 유저가 생성되게 해보자 클로져 내에서 원하는 로직을 실행하면 될 것 같다  
순환 참조 방지를 위해서 [weak self] 와 guard let self = self else { return } 추가

그리고 다음 화면을 띄워주는 로직을 메소드로 새로 작성해두자  
![](https://velog.velcdn.com/images/woojusm/post/2b8618d4-6697-4975-bf94-e2883c2590cd/image.png)
🤔 새로운 UIStoryboard 객체를 설정할 때 마다 등장하는 bundle이 뭘까?
bundle은 nil로 설정되면 알아서 찾아주게 끔 설정한다는 스택오버플로우 형님들의 설명

![](https://velog.velcdn.com/images/woojusm/post/449302dd-5da7-4b82-b9bb-cf473c34e97f/image.png)
mainVC를 띄워주는 로직을 구현했다!  
storyboard를 만들고, 스토리보드의 VC중에 특정한 Identifier를 가진 친구를 특정해주고,
mainVC의 modalPresentationStyle을 설정하고,  
navigationController의 메소드중 show를 통해서 띄워준다  


MainVC로 돌아와서 
![](https://velog.velcdn.com/images/woojusm/post/94396b30-9f8f-4240-a3bc-4d69bcaa2fb6/image.png)
프레임워크 추가해주고  
viewWillAppear 메소드에서 타고들어온 email을 받는 상수를 선언해주자  
![](https://velog.velcdn.com/images/woojusm/post/5b379901-212d-47ad-9cb1-e9f4a13ffde7/image.png)  
![](https://velog.velcdn.com/images/woojusm/post/51664920-89d2-4c93-847e-ff1b778012c9/image.png)

String은 여러줄을 표현하고 싶을 경우 다음과 같이 따옴표3개를 사용하면된다!  


![](https://velog.velcdn.com/images/woojusm/post/2a0e7c09-9c61-4ebf-8cc0-35ff1362377a/image.png)
계정 생성 완료!  

🤔 그럼 방금 입력해준 이메일로 다시 계정을 생성하려고 하면 어떻게 될까?

## 에러 처리
![](https://velog.velcdn.com/images/woojusm/post/b7810653-a4af-4d9b-be9b-b61c2886b976/image.png)

break포인트 지정하고 방금 이메일 다시 입력하면 에러가 발생하게 된다!  
![](https://velog.velcdn.com/images/woojusm/post/257ad035-4be6-463d-a8a8-ce8aab60468f/image.png)
에러 처리 해주자  
클로져 내에서 생긴 error가 발생했다면 if let 을 타고 로직이 실행되게 된다  
이전에 error 코드에서 17007이 이미 등록한 계정을 재등록하려는 시도일 때 였으니
이 case에선 바로 로그인이 되게 해주면 될 것 같다  
나머지 경우들엔 errorMessageLabel에 error.localizedDescription을 전달!

![](https://velog.velcdn.com/images/woojusm/post/ed2e2682-f2ad-46c9-8587-793b84221c80/image.png)  
login 메소드를 따로 빼서 작성해주고  
아까의 에러케이스 에서 loginUser를 호출해주면 될 것 같다  


![](https://velog.velcdn.com/images/woojusm/post/376a1140-aed5-4334-8556-66abf21bda6c/image.png)

💡 에러가 마냥 에러로만 쓰이지 않을 수도 있구나! 해당 에러 자체를 특정해서 원하는 로직이 실행되게도 가능하구나!!  


## 로그아웃하기

메인VC에서 로그아웃 메소드를 사용하면 된다  
근데 에러처리를 필요하는 throw함수라 do try catch문으로 작성해줘야함!  

![](https://velog.velcdn.com/images/woojusm/post/5ae2034b-3971-45f4-a4c4-96ea4c990dbf/image.png)
로그아웃 버튼이 눌렸을 때 로직이 동작하면 된다  
singOut메소드가 성공하면 루트뷰로 돌아갈 수 있게!  

## 구글 로그인

Firebase 인증 탭에서 구글 로그인 활성화!  
![](https://velog.velcdn.com/images/woojusm/post/c89dc9ae-6fac-4f01-8315-5a658bd24a79/image.png)

로그인 할 때 어떤 앱에서 요청을 하는 건지 설정해주는 내용이다  

![](https://velog.velcdn.com/images/woojusm/post/111e6aff-565e-48fc-97ea-91476edb6f89/image.png)
패키지 매니저에 GoogleSignIn을 추가해준다  
![](https://velog.velcdn.com/images/woojusm/post/9b155d71-f649-4467-8b0b-1e3a751fa49c/image.png)
URL Schemes도 추가해줘야한다  
![](https://velog.velcdn.com/images/woojusm/post/efb6e2db-a1f0-4cc8-b1d7-88ae837d0589/image.png)
Reversed Client Id의 Value를 복사하고  
![](https://velog.velcdn.com/images/woojusm/post/6339d865-4855-41b8-94dc-bc07adce3cc7/image.png)
Schemes에 추가!  
___
## 후우... 구현 성공!!
SDK들은 문법들이 종종 바뀌곤 한다. 
현재의 최신버전에 맞춰서 어떤 방식으로 구현해야할지 한참을 헤메다가    

[액세스토큰 최신](https://stackoverflow.com/questions/74799337/gidsignin-type-of-expression-is-ambiguous-without-more-context)
[configuration 최신](https://stackoverflow.com/questions/74498117/make-sure-gidclientid-is-set-in-info-plist-new-googlesignin-ios-version/74897652#74897652) 
구글링을 4시간동안 하다가 찾아냈다!!
![](https://velog.velcdn.com/images/woojusm/post/270c191c-7c08-4a3b-a253-620bdb4e4b85/image.png)
기존에 구현하던 방식은 전혀 쓸모가 없어졌다  
AppDelegate에서 따로 추가해줄 건 없다!!!  


![](https://velog.velcdn.com/images/woojusm/post/4d14d9b8-f02c-4d25-9f89-c2d1dd1909fc/image.png)  
GIDButton으로 바꿔주지 않아도 된다!!  


![](https://velog.velcdn.com/images/woojusm/post/9c901962-dcd1-43f7-a50a-52f9c154074f/image.png)
로그인 버튼이 눌렸을 때 로직만 잘 작성해주면 됨!  

🤔 scenes 부터 rootViewController까지 지금 정확하게 이해가 안된다  

## 비밀번호 변경 요청기능 구현


![](https://velog.velcdn.com/images/woojusm/post/b695fe66-9c09-42c3-bacd-a39ebf4b2ba1/image.png)  
구글로 로그인했을 때는 비밀번호 바꾸는 게 권한 밖임  
그래서 그냥 이메일 비밀번호로 로그인했을 때 비밀번호변경 버튼이 눌러질 수 있게 해줬다  
근데 코드 가독성이 안좋은 거 같음  
![](https://velog.velcdn.com/images/woojusm/post/72747191-ebb0-425b-832d-e43f2c1fa37d/image.png)
일케 바꿔줌  
이제 리셋버튼을 누르게되면 사용자의 이메일로 비밀번호를 변경하는 메일이 날라간다  
![](https://velog.velcdn.com/images/woojusm/post/0dedf41f-4c82-46b0-9217-ea9626df31f3/image.png)

요우!


## 애플 로그인 하기

는 결제를 해야 구현이 가능하다고 한다...

나중에 앱 출시하기 전에 구현 완료하자  


___

# 🤔 로그인 버튼을 따라락 빠르게 여러번 누르면 뷰가 여러번 뜬다  
