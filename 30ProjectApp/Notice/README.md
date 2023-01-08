# 실시간 공지사항 팝업
![](https://velog.velcdn.com/images/woojusm/post/cc4df99c-2c90-4c00-9cf1-4ccfba68bc47/image.png)


* 원격 구성(Remote Config)란?
  * 배포없이, 업데이트 다운로드 없이 앱 변경
  * 기본갑 설정 후 값 재정의
  * 클라우드 기반 key-value 저장소  

## A/B 테스팅?
* Google Anlytics, Firebase 예측을 통한 사용자 타겟팅
* 원격구성(Remote Config) 또는 알림작성기(Cloud Messaging)활용
* 제품, 마케팅 실험을 쉽게 실행, 분석, 확장  
___
## UI 구성

![](https://velog.velcdn.com/images/woojusm/post/d10ae1a9-3997-4a9e-b257-079f45ee1697/image.png)
xib파일도 함께 생성한 NoticeVC.  
이렇게 생성한 이유는 언제 뷰가 뜰지 모르기 때문이다  

## Firebase 연결하기

![](https://velog.velcdn.com/images/woojusm/post/764c50c7-3411-47ae-83f8-8dc9fd255df0/image.png)
이번엔 구글 애널리틱스도 체크 해주자  

프로젝트에 Firebase 추가!  
패키지 매니저로 추가해줬다  

AppDelegate에 초기화 코드 작성해주고
![](https://velog.velcdn.com/images/woojusm/post/62e2e2ca-5ec8-498c-9158-df1b454f3d90/image.png)  
![](https://velog.velcdn.com/images/woojusm/post/a439025f-c994-4cc0-a637-4548120895e6/image.png)
다음 처읨 띄울 VC에서 remoteConfig 객체를 생성해줬다  

![](https://velog.velcdn.com/images/woojusm/post/f72ccf22-2a57-47fc-922c-bf98ea052212/image.png)  
초기 세팅을 설정해주고  


![](https://velog.velcdn.com/images/woojusm/post/93749aff-fef7-40fa-b8e2-091d22d5cbe0/image.png)
새로운 plist도 작성했다  
![](https://velog.velcdn.com/images/woojusm/post/c991dfed-6acd-46e6-abb6-d3841d514203/image.png)
4가지의 plist를 만들어주고 이제 이 기본값이 들어있는 plist를 인식 시켜주자  
![](https://velog.velcdn.com/images/woojusm/post/d57f62ca-9a21-4890-888b-599acabc57a8/image.png)


![](https://velog.velcdn.com/images/woojusm/post/efac75fc-c348-4f93-8875-8e7511ae53e3/image.png)

콘솔로 돌아와서


![](https://velog.velcdn.com/images/woojusm/post/655d20a9-a06b-4b6f-a52b-60abe392e944/image.png)
plist에 추가해준 프로퍼티와 동일하게 프로퍼티를 추가해준다  
![](https://velog.velcdn.com/images/woojusm/post/89b1ebcc-1b43-445d-b391-26bc0eec502f/image.png)
remoteConfig 메소드 작성  
.replacingOccurrences는 콘솔에서 \n 이라고 줄바꿈을 줬을 때 패치하는 과정에서 \\n으로 들어와서 줄바꿈이 스위프트에서 가능하게 바꿔줌  


## 값 업데이트

콘솔에서 한번 수정해보자  
![](https://velog.velcdn.com/images/woojusm/post/7c07dba8-a624-436b-be38-23752c1d034f/image.png)


![](https://velog.velcdn.com/images/woojusm/post/be8403c5-1779-424a-b6be-fa64a20e5b10/image.png)  
notice 호출하는 메소드 추가해주고!  


![](https://velog.velcdn.com/images/woojusm/post/dce92b8b-e34e-4173-a097-c95fe9834424/image.png)

잘 작동한다!!  

설정 언어에 따라서 값 변경도 가능하다  
![](https://velog.velcdn.com/images/woojusm/post/af23f260-9b20-4bc1-af44-c926caf4c380/image.png)  
이렇게 조건을 추가해주면 된다  

![](https://velog.velcdn.com/images/woojusm/post/d3920f9b-6d7d-4f7e-91cd-fb8b4cd6d9d4/image.png)
언어설정 바꾸니 뜨는 거 확인!  

## A/B 테스트로 팝업 제어하기

![](https://velog.velcdn.com/images/woojusm/post/c9a2e1b3-9132-4f55-8d0f-b6767cb904f9/image.png)  
![](https://velog.velcdn.com/images/woojusm/post/f512745d-3472-4640-8fd6-fa9bd8e01dc0/image.png)


![](https://velog.velcdn.com/images/woojusm/post/88b64ff5-90c1-4b6d-afea-3ea86e32d0dc/image.png)

UIAlert을 추가했다  

이제 유저들이 어떤 반응을 보였는지 기록을 해야되는데  
이건 FirebaseAnalytics 프레임웤을 추가해야한다  

![](https://velog.velcdn.com/images/woojusm/post/071c776d-404a-4df2-932c-9e771e8aa691/image.png)
그리고 확인을 누를 때 로그이벤트가 저장되게 해줌  

![](https://velog.velcdn.com/images/woojusm/post/c44c4e6e-53e2-4357-803c-b65435463782/image.png)

![](https://velog.velcdn.com/images/woojusm/post/f1dac49e-9024-4f5b-881e-ce6aed3ee448/image.png)  
product 탭에서  Argument 추가해주고  

![](https://velog.velcdn.com/images/woojusm/post/83a8bb2f-09be-44b9-913c-67242ca0a4bb/image.png)

Firebase 콘솔창에서 애널리틱스 - debugView를 키면 이벤트를 확인해볼 수 있다!!  
![](https://velog.velcdn.com/images/woojusm/post/b02438cd-f71a-49b6-ad1c-143dd98f8292/image.png)
Firebase에서 각각의 기기에 부여한 인증토큰을 프린트해서 이벤트 실험이 잘 나오고 있는지 확인해보자 
인증토큰을 테스트 기기로 등록을 시켜서 변수나 기준 중에 선택해서 나오게 실행이 가능함!!  

![](https://velog.velcdn.com/images/woojusm/post/005c7a9c-1b6d-4602-92a3-27aecfc9c200/image.png)
