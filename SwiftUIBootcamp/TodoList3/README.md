## Creating the Views

![](https://velog.velcdn.com/images/woojusm/post/769ad33b-39e1-4b1d-98da-9e3a2f12d8db/image.png)

List의 row가 될 뷰를 추출해줌.  
그리고 새로운 파일로 옮겨줬다  
![](https://velog.velcdn.com/images/woojusm/post/b0264b83-e37f-464a-a64f-ab979a3926ea/image.png)  
샘플 데이터를 만들고 ForEach로 표현!  
![](https://velog.velcdn.com/images/woojusm/post/1fd7811c-1509-4831-bf51-82bbfd440207/image.png)

navigationBar아이템들을 추가해줌  
leading에는 EditButton, trailing에는 navigationLink를!  
이렇게 보니까 navigationLink는 세그웨이랑 비슷하다  
![](https://velog.velcdn.com/images/woojusm/post/838ae643-3e40-4c48-b2ec-526d0a310d13/image.png)  
그 다음엔 AddView를 구성해줌  
첫번째 화면에서 Add를 누르면 나올 뷰  
textField 넣고, 버튼 으로 구성  

## Create a custom data model for Todo items  

```swift
struct ItemModel: Identifiable {
    let id: UUID = UUID()
    let title: String
    let isCompleted: Bool
}
```
새로운 모델을 만들어줬다  

가끔 새로 만들어준 스크립트가 자동완성이 안될 경우에 Product-Clean Build Folder 해주면 됨  

![](https://velog.velcdn.com/images/woojusm/post/d38cddba-1871-4acf-8bd1-2892a040c02a/image.png)

ForEach에 [ItemModel] 타입의 데이터가 들어갈 예정이다.  
-> ListRow도 수정해줘야겠다  

![](https://velog.velcdn.com/images/woojusm/post/79bfbaae-c450-4f8a-b893-424c19f30fee/image.png)

기존엔 스트링이 들어가던 데이터를 ItemModel형태로 받고,  
프리뷰에선 가짜 데이터들 임시로 넣어줌 (static으로 선언했음)  
그리고 프리뷰가 진짜 사이즈만 나올 수 있게 .previewLayout설정을 해줌  

![](https://velog.velcdn.com/images/woojusm/post/bfe9d5e9-a8cd-41b5-86b1-8c720dbc5ba9/image.png)
그리고 삼항연산자로 이미지를 교체해준다  

## Creating the ViewModel

뷰모델을 만들어줄 예정  
그 전에 간단한 로직들은 구현을 해주자  

![](https://velog.velcdn.com/images/woojusm/post/2876031f-0f97-4767-a846-1e021f89ddcc/image.png)
리스트 뷰에서 .onDelete 메소드를 붙여줌.  indexSet을 atOffsets에 전달해서 모델리스트에서도 삭제 가능하게 해줬다  

![](https://velog.velcdn.com/images/woojusm/post/5c18733a-09e1-427a-97ba-39087108beff/image.png)
deleteItem으로 메소드를 따로 빼주게 되면 저렇게 축약도 가능해짐  
![](https://velog.velcdn.com/images/woojusm/post/0fe7e8ce-e921-4dd7-817a-a3ef5a71af2c/image.png)  
onMove 메소드도 구현해주려고 한다  

IndexSet이랑 Int를 받는 메소드를 파면 됨  

![](https://velog.velcdn.com/images/woojusm/post/4653072a-7e5f-4d9d-be43-1002d440eed4/image.png)
![](https://velog.velcdn.com/images/woojusm/post/8ea86b44-34f0-4015-88a8-2fa14f676607/image.png)  

이제 Edit 버튼을 누르게 되면 수정이 가능해짐!  
🤔(근데 지금 롱프레스로도 리스트를 움직이는 게 가능한데 이렇게 움직이면 버그가 발생함 나중에 수정 필요)

지금처럼 delete하고 onMove하는 기능들은 ViewModel에서 관리하면 좋을 거 같다  

새로운 ListViewModel.swift 생성!  

![](https://velog.velcdn.com/images/woojusm/post/455a0b9e-ad0d-4015-8ad2-eaf9c8b0ab28/image.png)
하나씩 이식해주자  

먼저 모델을 옮겨줄 건데 class에선 @State를 쓸 수 없다
@Published를 붙여줘야됨  

![](https://velog.velcdn.com/images/woojusm/post/ccc90793-80db-4778-95ab-615cca2266c0/image.png)

그리고 getItems라는 append 메소드를 작성해서 기존의 빈배열에서 init될 때 실행되게 해줌  
여기에 전의 listView의 삭제, 무브 메소드들 이식하고  
이걸 EnvironmentObject로 만들자  

![](https://velog.velcdn.com/images/woojusm/post/a20014f6-62ac-4214-8d5b-9bc34be58666/image.png)


TodoListApp파일로 와서 @StateObeject로 listViewModel을 새로 만들어줬다  
그럼 이렇게 해주려면 ListViewModel에서 ObservableObject를 채택해야겠죠  

![](https://velog.velcdn.com/images/woojusm/post/2e987192-153d-40a1-96b5-329351a4f0ab/image.png)
그 후에 ListView에 꽂아줘도 되겠지만 다른 하위 뷰에서 언제든 접근 가능하게
.environmentObject로 넘겨줌!!  

![](https://velog.velcdn.com/images/woojusm/post/795ccb5e-556a-4e5f-93c1-c810fcdb7e84/image.png)
그리고 ListView에서 @EnvironmentObject로 뷰모델을 선언해주면 끝!

![](https://velog.velcdn.com/images/woojusm/post/70e0b11c-6521-42fb-b1c2-8191ff62ddc4/image.png)  
그리고 수정해주면 되는데 여기까지 수정했을 때 프리뷰가 크래쉬남  
지금 EnvironmentObject가 MainApp이 실행될 때 추가되고 있어서  
프리뷰에도 따로 추가해줘야함  

![](https://velog.velcdn.com/images/woojusm/post/40f0d69f-0f5d-4ea7-b538-c33f082b15e1/image.png)  
요렇게!  

## AddView 기능 추가

Save 눌렀을 때 텍스트 필드에 있는 내용들 저장할 수 있게 해주자  

![](https://velog.velcdn.com/images/woojusm/post/841f4a46-5f58-439a-bab9-a3a7bd794dd8/image.png)

save 되는 로직은 뷰모델에 넣어주면 되겠죠!  

![](https://velog.velcdn.com/images/woojusm/post/5a511e81-e78d-4721-8d60-7973b2964cd3/image.png)
요렇게!  

그리고 save를 누르면 자동으로 전의 뷰로 돌아가게해주고 싶다  
다시 Environment를 사용해서 dismiss 액션을 만들어줌  
![](https://velog.velcdn.com/images/woojusm/post/29c5bb6b-1ad1-4dc2-8836-1f0b49f22444/image.png)
![](https://velog.velcdn.com/images/woojusm/post/53b36f83-f1de-4927-9fbe-1f83427e9bb1/image.png)  


그리고 방어로직을 작성해줘야할 거 같다  

![](https://velog.velcdn.com/images/woojusm/post/50b14768-f4ac-49c1-80a7-24c4359bd888/image.png)

텍스트필드의 텍스트를 체크하는 메소드를 작성하고 이 값이 참일 때만 로직이 실행되게 해줌  

제대로 입력을 안했을 땐 alert을 띄워줘야할 거 같다  

![](https://velog.velcdn.com/images/woojusm/post/5c41e14d-d040-450a-a247-d7ac48ede964/image.png)

두가지 프로퍼티래퍼로 감싸진 프로퍼티 선언하고  
.alert(isPresented: ) 메소드를 뷰 어디에서든 넣어주면 됨  

![](https://velog.velcdn.com/images/woojusm/post/441e08eb-8ced-4b94-94cf-bf705ef706ca/image.png)

![](https://velog.velcdn.com/images/woojusm/post/e432f2f0-23f0-41d2-92f7-fa66be40467d/image.png)


![](https://velog.velcdn.com/images/woojusm/post/ade87911-8e35-4d87-856b-cccf59721c70/image.png)  
근데 이렇게 구현하는 방식이 예전 방식이라 
>🤔 새로운 방법 찾아보기  



## 체크마크 구현  

ListView로 돌아와서  

![](https://velog.velcdn.com/images/woojusm/post/89481049-00ce-402b-bdcb-c163246b1e30/image.png)  
탭이 될때 원하는 로직인 체크마크가 켜지는 로직을 구현해야함  
-> ViewModel에서 만들어주면 되겠죠!  

![](https://velog.velcdn.com/images/woojusm/post/32a54628-2691-466c-bc94-f48922791df4/image.png)  

updateItem이라는 메소드를 만들어주는데 현재 파라미터로 ItemModel을 받고 있지만
어떤 item이 선택된 건지 index가 필요함  

메소드를 통해 들어온 item과 listViewModel의 items 어레이 중에 id가 같은  
이 조건을 첫번째로 만족하는 인덱스를 index라고 표현하거  

![](https://velog.velcdn.com/images/woojusm/post/5813686a-1cda-4a75-91fa-89621bca0482/image.png)
축약하면 이렇게 표현 가능함  

![](https://velog.velcdn.com/images/woojusm/post/c9e2e45d-bf96-4af7-94f7-bebe86f4e430/image.png)

들어온 index를 가지고 새로이 isCompleted를 체크해줌  
그런데 이렇게 하면 새로 초기화하면 또 문제가 생김 ItemModel의 id가 매번 새로 생성되게 됨


![](https://velog.velcdn.com/images/woojusm/post/a27501db-bd23-4f0d-aa3e-06f55a4d13cc/image.png)

🤔 id 새로 안생기게 init에서 처리 해줬음 그리고 모델 내부에 updateCompletion이라는 메소드를 하나 생성해줌  

> 이렇게 해준 이유는 안정성을 위해서!!  
Struct내의 프로퍼티들을 var로 바꿔서 구현해 줄 수도 있지만 그렇게 사용하면 예기치 못한 에러를 발생 시킬 수도 있음  모델은 Immutable으로 사용하는 게 좋다!  


![](https://velog.velcdn.com/images/woojusm/post/aef102e8-cdd9-4bb3-82c3-bc0617d83ec8/image.png)  
List뷰로 돌아와서 updateItem 해주면!
![](https://velog.velcdn.com/images/woojusm/post/619ab8d6-f45c-4caf-a63a-0000bb643ae6/image.png)

체크마크 구현 완료  

이렇게 CRUD 구현 성공!!  

___
## Save and persist data with UserDefaults

@AppStorage를 지금 사용하지 않는 이유는 ListViewModel이 class여서!  
@AppStorage는 struct내에서 사용하기 좋음  

UserDefaults를 사용하려면 지금의 ItemModel을 Json으로 변환하고 저장해야함  
그러려면 ItemModel은 Codable 해야겠죠  

![](https://velog.velcdn.com/images/woojusm/post/d600ad17-4590-40a1-b823-8385a88f48a2/image.png)

listViewModel에서 ItemModel을 Encode 하고 UserDefaults에 저장한다.  
이 때 key는 전역 상수로 선언해줌  

![](https://velog.velcdn.com/images/woojusm/post/ae250589-782a-42a5-89f2-da6d520d25c4/image.png)  

그리고 현재의 로직들이 실행될 때 전부 saveItems가 실행되어야함  
함수 내부에 바로 작성할 수도 있겠지만 다른 방법을 사용해보자  

![](https://velog.velcdn.com/images/woojusm/post/324e2ba5-392d-4c29-b125-5970896cfe65/image.png)  
프로퍼티 옵저버로 items가 변경될 때마다 saveItems가 되게 해줌  

![](https://velog.velcdn.com/images/woojusm/post/a50cd4dd-017f-4aab-92d3-ad89d801e52e/image.png)

기존의 getItems는 수정이 필요하다  
샘플데이터 말고 진짜 데이터가 필요함  

![](https://velog.velcdn.com/images/woojusm/post/8df9d6eb-c847-4a5b-98cb-a88d09442d7a/image.png)  
guard문을 사용해서 decoding하는데 여러개의 guard문은 중첩해서 표현할 수도 있다  
![](https://velog.velcdn.com/images/woojusm/post/555b3dcf-78a1-462d-97b9-7afe927ff52b/image.png)
이렇게!  

![](https://velog.velcdn.com/images/woojusm/post/1ff04503-9a16-416b-b32e-f44eb9413127/image.png)  
그리고 지금의 items array에 추가해주면 load 되겠죠!!  

___
## User Experience & Animations

현재 리스트에 아무 item도 없다면 앱이 아무것도 실행되고 있지 않은 것처럼 보임  
유저가 알 수 있게 noti도 주고 animation도 추가해보자  

![](https://velog.velcdn.com/images/woojusm/post/f26240b5-9020-4359-a55e-e5c4f4fc5167/image.png)
list의 item이 비어 있다면 하나의 뷰를 띄우고 그게 아니라면
기존의 list를 띄울 수 있게 해줌  

![](https://velog.velcdn.com/images/woojusm/post/88442abf-8343-4099-bd73-3f3297424b98/image.png)
NoItemsView라는 새로운 뷰를 만들어줬다  
ScrollView로 만든 이유는 
![](https://velog.velcdn.com/images/woojusm/post/e3a52eea-4d72-46eb-a1cb-257d641f1863/image.png)  
maxHeight이 적용되어 있어서 이 뷰를 가져오게 될 때 항상 상단으로 밀어줄라고 넣어줌  

그리고 혹시 모르니 스크롤뷰 최대로 키워줌  
![](https://velog.velcdn.com/images/woojusm/post/aee0fe7a-cf26-4dd0-a9e8-76cc3b9b2527/image.png)
![](https://velog.velcdn.com/images/woojusm/post/9c8729b6-8078-4688-89d9-bd8984d8be50/image.png)

Text들 추가해주고,
프리뷰에 NavigationView도 추가해줌  
실제로는 NavigationView 안에 존재할거니까 추가해준거  

![](https://velog.velcdn.com/images/woojusm/post/e67c2995-1caa-45a8-851d-ff363f5507a2/image.png)
![](https://velog.velcdn.com/images/woojusm/post/7c868a99-67ed-4590-9882-0b266afbcfc6/image.png)


NavigationLink를 추가해서 버튼을 누르면 AddView로 갈 수 있게 해줌  

___
## 애니메이션 추가

![](https://velog.velcdn.com/images/woojusm/post/55d300a1-b009-4983-abbb-0e6b7e8c1d8e/image.png)

![](https://velog.velcdn.com/images/woojusm/post/49ebc915-9a33-4eba-b5da-74deb1806e65/image.png)

![](https://velog.velcdn.com/images/woojusm/post/5a3db137-531b-456a-a396-7450108477d3/image.png)  

여기서 guard 문은 animate 로직이 두번 실행되지 않게 하기 위해서 추가해줌  
onAppear에서 실행되니까 이 뷰가 뜰 때마다 애니메이션이 새로 추가되는 걸 피하기 위해서  

![](https://velog.velcdn.com/images/woojusm/post/7d00a1aa-ce3c-49f2-be47-0baf3ee011dd/image.png)
![](https://velog.velcdn.com/images/woojusm/post/310f1239-32fb-4a5c-85a4-f5b97b183297/image.png)

Animation이 계속해서 반복되게 해주고  

![](https://velog.velcdn.com/images/woojusm/post/66197a3f-18ad-4ef5-9d35-4e384fa9c986/image.png)
추가로 여러가지 효과들을 적용해주면!! cool 한 이펙트를 만들었다  

그리고 AccentColor를 커스텀하는 것도 가능한데  

![](https://velog.velcdn.com/images/woojusm/post/db88200a-b18f-4f86-9142-3c01df5df277/image.png)
여기에 새로운 ColorSet 추가해주고  
![](https://velog.velcdn.com/images/woojusm/post/3da9e8bd-1ad4-47fc-a484-0ab43ce415e5/image.png)
![](https://velog.velcdn.com/images/woojusm/post/61387ba6-7d57-4889-821f-4e64120ca6b5/image.png)

변수로 생성해주면!  

![](https://velog.velcdn.com/images/woojusm/post/b36c95b6-9a14-4d21-8b7e-d33a9b298618/image.png)  

요렇게도 가능함!  
colorLiteral말고 이렇게 사용해줘야할 듯  


![](https://velog.velcdn.com/images/woojusm/post/536237d7-2f4d-4879-ba9e-b299149c24d1/image.png)
그리고 트랜지션 추가해줬음  
> 🤔 트랜지션이 지금 양쪽으로 먹히고 있음.  
Add되어 질때랑 delete될때 둘 다 트랜지션되는중...
어떻게 하면 한쪽만 줄 수 있을까?


![](https://velog.velcdn.com/images/woojusm/post/f7bc437d-63aa-4a0e-bd09-26a7e3a90fd0/image.gif)

## FocusState

Add 뷰로 가게 되었을 때 키보드가 뜨게 하고 싶음  

![](https://velog.velcdn.com/images/woojusm/post/59b1db76-100f-4e45-855a-8938966e38f8/image.png)
![](https://velog.velcdn.com/images/woojusm/post/130811f7-8181-446c-89b2-cc01667a8291/image.png)
![](https://velog.velcdn.com/images/woojusm/post/ba47f518-540f-4df6-9894-a1508b9908cf/image.png)  
FocusState 프로퍼티래퍼로 Bool 선언하고
텍스트필드에 바인딩해준 다음에
.onAppear에서 true로 값 바꿔주면 됨!  


___

## Adapt SwiftUI for iPad, Landscape and Darkmode

![](https://velog.velcdn.com/images/woojusm/post/1601971f-53e5-4c4a-8af9-5278f7089cb1/image.png)
accentColor에 dark 추가해서 다크모드용 색상을 지정 가능함  

![](https://velog.velcdn.com/images/woojusm/post/0e944099-ec5c-4063-94f8-aaaf514fae46/image.png)

maxWidth 적당히 조절해서 가로모드일 때 사이즈 조절 가능  

iPad에서 잘 되나 보자  

![](https://velog.velcdn.com/images/woojusm/post/842ea36b-2ba4-4337-82b0-e38312ab4e94/image.png)

?!!

이상하게 나오고 있음  
지금처럼 NavigationView는 iPad에서 다른 스타일로 표시되서 그럼!   

![](https://velog.velcdn.com/images/woojusm/post/fee054fa-2ae3-4d92-928d-8eba7a424e5f/image.png)  
mainApp파일에서 navigationViewStyle을 스택으로 바꿔주면 해결 가능

>🤔 이렇게 해주면 해결은 가능한데 지금의 표현은 언젠가 사라질 표현임..   
대체 표현 찾아보기

![](https://velog.velcdn.com/images/woojusm/post/8f47ca88-f40b-4bfc-8b56-d107288fb32a/image.png)  

___

## App Icon & Launch Screen
![](https://velog.velcdn.com/images/woojusm/post/23f21492-96bb-4955-b521-04ba254eb8b8/image.png)

런치 스크린 구현 방식이 바뀜  
info 에서 기존에 있는 LaunchScreen 한번 지우고  
+ 로 추가해주면 새로운 LaunchScreen이 생기는데 여기에
Image나 BackgroundColor정도의 간단한 것들만 넣을 수 있음  

![](https://velog.velcdn.com/images/woojusm/post/2a8a2f73-e81a-4917-9484-e6903e0fbc3e/image.png)


임시로 AppIcon 넣어서 테스트 해봤는데 잘 나옴  
근데 SwiftUI AppIcon 사이즈가 1024*1024 라서  
launchScreen 용 Image는 따로 넣어줘야 할 거 같다  

___


## Deployment Target
을 다운 시켜보다가 깨달음을 얻음  

꼭 최신문법으로 스크립트 작성하는 게 좋은 건 아니라는 거!!

FocusState나 dismiss 같은 것들은 14.0으로 낮추면 새로 코드를 짜줘야함...


![](https://velog.velcdn.com/images/woojusm/post/f25491b1-184f-4954-98c5-44729a9d1bb6/image.png)

옷 근데 #available 같은 것들을 사용해서 뭔가 해결할 수 있긴 한가본데

🤔 나중에 알아보자  

