# 카드 추천 리스트  
- Firebase Realtime Database
  * 비관계형 클라우드 데이터베이스
  ![](https://velog.velcdn.com/images/woojusm/post/41f3fb05-3dab-4138-a219-25089abbfe05/image.gif)

## Database란?
* 데이터의 집합체
* 일반적으로 관계형 데이터 베이스 형태  

## Realtime Database & Cloud Firestore

* Realtime Database:
  * 하나의 큰 JSON트리
  * 정렬 || 필터링
  * 깊고 좁은 쿼리
  * 데이터세트가 올라갈 수록 쿼리성능은 낮아진다
* Cloud Firestore
  * 문서 컬렉션
  * 정렬 && 필터링
  * 얕고 넓은 쿼리
  * 데이터세트 크기는 쿼리성능에 영향을 주지 않는다  
  
### 그럼 어떨 때 사용할까
* Realtime Database:
  * 기본적인 데이터 동기화
  * 적은양의 데이터가 자주 변경
  * 간단한 JSON 트리
  * 많은 데이터베이스
* Cloud Firestore
  * 고급쿼리, 정렬, 트랜젝션
  * 대용량 데이터가 자주 읽힘
  * 구조화된 컬렉션
  * 단일 데이터베이스
___
## UI 구성하기


  
 ![](https://velog.velcdn.com/images/woojusm/post/d306f989-b45b-443c-b5fd-37e85449f69e/image.png)
![](https://velog.velcdn.com/images/woojusm/post/b06f32ca-d0c0-4668-9e04-fe5687fe7ad8/image.png)

요런 형태의 JSON을 가지고 올거다  
모델을 만들어주자!  
![](https://velog.velcdn.com/images/woojusm/post/0aa079c2-3289-4fab-ac44-0fcc68a63a1d/image.png)  


CardListCell을 만들어주자  
테이블뷰에서 사용할 셀로 xib파일도 함께 생성했다  
![](https://velog.velcdn.com/images/woojusm/post/4c6fdc9d-5c27-4526-8036-ee6c72f39f6e/image.png)  

cell IBOutlet연결해주고  
![](https://velog.velcdn.com/images/woojusm/post/c7a010da-e98b-47d8-b931-1e4598931b90/image.png)

셀을 cardLitsView에서 테이블뷰에 등록을 해준다  
![](https://velog.velcdn.com/images/woojusm/post/275b2b2a-b73b-4f43-93dc-fb33cef09a9a/image.png)
보통 delegate 패턴을 채택하게 될 때 사용하던 메소드들 override해주고  
(cell의 ui업뎃해주는 코드는 Cell 파일 내부에 configure라는 메소드로 따로 빼줬다)  

이제 이미지URL을 처리하는 걸 킹피셔를 이용해서 해보자  
![](https://velog.velcdn.com/images/woojusm/post/9b267acf-8fc2-4580-94bf-4e9012982bdf/image.png)

![](https://velog.velcdn.com/images/woojusm/post/9ad314cd-786b-44f6-9f0c-863dc588257f/image.png)
테이블뷰셀의 높이는 80정도로 맞춰줌  

![](https://velog.velcdn.com/images/woojusm/post/25725903-d7a5-40e2-a3ae-05638c192801/image.png)
cell이 선택되면 띄워줄 VC를 만들었다  
![](https://velog.velcdn.com/images/woojusm/post/712c0469-5f2e-4de4-9859-a62ce9d6abde/image.png)
액션을 Show로 연결해줬는데  
🤔 navigationController.push로 못 띄우나?!  

## 로티 이미지 띄워보기

![](https://velog.velcdn.com/images/woojusm/post/ed405fb9-0670-4e70-9ada-e860444dabaa/image.png)

[로티 깃헙](https://github.com/airbnb/lottie-ios)  
패키지 매니저로 설치했다!  

![](https://velog.velcdn.com/images/woojusm/post/d22e6592-4956-4f7b-8010-429303b2c413/image.png)

빈 뷰에다 클래스를 LottileAnimationView로 설정 해준다 그럼 모듈에 Lottie가 뜨는 걸 확인!  
그리고 이미지가 될 money.json파일을 추가해줬다  
![](https://velog.velcdn.com/images/woojusm/post/b8c41124-8090-4e4f-b1b7-d7e71a21eda2/image.png)  

![](https://velog.velcdn.com/images/woojusm/post/fde0d830-faef-4873-9463-a92f704045de/image.png)  
로티뷰 아웃렛 연결해주고 뷰가 로드된 시점에서  
로직을 작성해준다. 이 때 LottieAnimationView(name: )에 들어가는 건 넣어준 json 파일의 이름!  
![](https://velog.velcdn.com/images/woojusm/post/b7b152a2-350d-4288-b9c1-1fa08076b388/image.png)  
UILabel들 아웃렛 연결!  
![](https://velog.velcdn.com/images/woojusm/post/8af9c125-f8b0-4da4-97ec-357dad9d7829/image.png)
viewWillAppear에서 ui업뎃 코드를 작성해준다  
![](https://velog.velcdn.com/images/woojusm/post/79554699-9a68-414f-a1e1-274dc9b1daed/image.png)
cell이 선택되는 시점에서 넘어가고 싶은 뷰 인스턴스화 해주고  
해당뷰에 선택된 정보를 전달한 다음 show 메소드로 띄워준다!  
___
## Firebase Realtime Database

![](https://velog.velcdn.com/images/woojusm/post/fb043953-7f41-457c-834d-9321d509149f/image.png)
파이어베이스 프로젝트 추가해주고 ios앱도 추가!  
![](https://velog.velcdn.com/images/woojusm/post/a17f7ddb-aa15-4b2f-aa4e-04a1bc83504d/image.png)
realtime databse도 추가해준다  

보안 규칙은 아래 항목으로 선택  
![](https://velog.velcdn.com/images/woojusm/post/a9290f3e-13d1-4df7-a0f9-135a123deeba/image.png)
JSON가져오기로 데이터를 추가해준다  

그리고 프로젝트에 파이어베이스 패키지 추가!  
![](https://velog.velcdn.com/images/woojusm/post/294ef6d3-be24-40a9-b9de-735d42585893/image.png)
초기화 코드 작성  
## 데이터 불러오고, 입력, 수정, 삭제

![](https://velog.velcdn.com/images/woojusm/post/9760eb96-3f0f-4538-a4c2-251fff8a6826/image.png)  
ref라는 databaseReference를 선언한다. 이게 Firebase Realtime Database를 가지고 올 수 있는 레퍼런스 값.  
![](https://velog.velcdn.com/images/woojusm/post/0648e841-2d54-41d5-b287-f620dabb338c/image.png)  
그리고 뷰디드로드에서 database를 가지고오면 됨  
![](https://velog.velcdn.com/images/woojusm/post/d09d917d-5542-4039-9272-5b8aa57aa8ef/image.png)
ref의 .value인 snpashot이라는 객체를 observe 할건데  
guard문으로 value를 바인딩해주고, 다운캐스팅으로 어떤 형태인 지 명시해준다
value를 사용해서 jsonData를 만들고 디코딩! 그리고 디코딩된 형태에서 value값만 이용해서  
cardList를 만들고 그걸 다시 VC안에 전역으로 선언한 creditCardList에 담아준다!  
이 다음엔 테이블 뷰 리로드하면 끝!!  


🤔 근데 콘솔에 넣어준 snapshot.value가 [String: [String: Any]] 형태인지 모르겠다.  

![](https://velog.velcdn.com/images/woojusm/post/bcdf7a99-3635-44d7-8f71-9a70c5fd954a/image.png)

이제 셀에 데이터를 흘려보낼건데 Cell에 클래스를 설정했었다면 지워준다  

![](https://velog.velcdn.com/images/woojusm/post/5ee22177-6696-47ab-b9c6-0dbbdf29fa3f/image.png)
![](https://velog.velcdn.com/images/woojusm/post/ef6a0ba9-1e79-4194-8871-5e425c1ea7ea/image.png)
이런 식으로 새로운 값을 실시간으로 설정해줄 수 있다.  
![](https://velog.velcdn.com/images/woojusm/post/e28162e9-aad3-4d5b-84f0-35e2236a1240/image.png)  
다른 방법으로도 쓰기가 가능한데 이경우엔 어떤 객체가 생성될지 모르는 상황일 때  
이 키의 값을 가져와줘! 해서 snapshot에서 검색을 하고, 
그 다음에 ref에 값을 씌워주는 방법이다  


### 삭제하기
setValue에 nil을 할당해서 지워줘도 된다!  
근데 더 명시적인 방법이 있음  
아이템목록을 삭제해주는 걸로 한번 구현해보자  

먼저 스와이프 액션을 추가  

![](https://velog.velcdn.com/images/woojusm/post/d880a4d0-de4b-4c0a-bf2a-22be5045e0ee/image.png)
요 두가지 메소드를 이용해서 셀의 delete 액션을 추가할 수 있다

![](https://velog.velcdn.com/images/woojusm/post/2c5ebaf1-a962-4edb-9508-3bc373bff629/image.png)

그리고 마찬가지로 두가지 방법으로 삭제 가능!  
___
## Firestore Database 연결하기 (보류)
![](https://velog.velcdn.com/images/woojusm/post/04f486ad-dd88-47c4-8314-881a1a779c74/image.png)
이미 패키지를 설치했지만 라이브러리를 새로추가하고 싶을 땐 이 창에서 추가 가능하다  
FirebaseFirestore, FirebaseFirestoreSwift 추가!  
![](https://velog.velcdn.com/images/woojusm/post/dec7d549-245a-4029-9243-40b4e7684e09/image.png)
콘솔로 이동해서 Firestore Database를 만들어 준다  
![](https://velog.velcdn.com/images/woojusm/post/1ba6ee07-7bd9-4de1-b44b-04cfde91a926/image.png)
![](https://velog.velcdn.com/images/woojusm/post/f70d9a32-ae0d-451f-9536-db7e48f5c950/image.png)
컬렉션에 문서를 추가하는 방식으로 데이터가 저장되게 된다  
또 컬렉션안에 또다른 컬렉션이 추가되게도 가능!  

수동으로 일일이 다 입력하기엔 무리가 있다.  
하지만 이전에 했던 통 JSON 파일 가져오기도 어렵다... 

구글 클라우드 플랫폼이라는 서비스를 활용해서 가져오는 게 가능한데 유로이다  

한가지 가능한 방법이 있긴 한데  
![](https://velog.velcdn.com/images/woojusm/post/6c579fae-8855-4790-9111-5290f57fd133/image.png)

먼저 dummy 파일을 넣어주고  

![](https://velog.velcdn.com/images/woojusm/post/6902057f-49d0-4a76-bf2a-1cd87d0a2201/image.png)

요런 형태로 batch를 진행하려했지만 새로운 문법들이 생긴 듯 하다  
🤔 지금 당장은 방법을 못찾겠다...  


___
## 💡셀.xib파일에
오토레이아웃이 잡혀있지 않다면 셀들이 엄청 좁게 나온다!  
꼭 오토레이아웃들 잘 설정해주기  
