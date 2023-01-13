# [iOS App Dev Tutorials]

SwiftUI로 처음 프로젝트를 만들게 되면 두개의 구조체가 있다.
body 라는 프로퍼티를 가지는 '뷰'와 이 뷰를 캔버스로 프리뷰하게 해주는 구조체!
이렇게 두가지가 있음  

기본으로 있는 콘텐트뷰 리팩터 리네임 해서 이름 바꿔주고,  
아래에 있는 프리뷰도 마찬가지로 바꿔준다!
![](https://velog.velcdn.com/images/woojusm/post/04499330-6024-40f2-949b-c06e16bf0b49/image.png)  

ProgressView를 body 안에 선언해줌  
이 프로그레스뷰는 time이 얼마나 흘러가는지 나타내줄 예정임  

프로그레스 뷰를 커맨드 클릭해서 VStack에 임베드 해준다  
VStack안에 HStack을 넣고, 텍스트도 넣어줌!  
![](https://velog.velcdn.com/images/woojusm/post/4b588acb-4c2a-46a4-addb-24f80a54b2dc/image.png)  

![](https://velog.velcdn.com/images/woojusm/post/49ba8e48-2cdb-4745-ad78-60a6e02394f5/image.png)
각각의 Text들을 VStack에 임베드 해줌.
Text랑 Label 어떤 차이점이 있는지 헷갈렸는데 

![](https://velog.velcdn.com/images/woojusm/post/d908437c-5f08-432e-9f60-f5cfe93b2d46/image.png)
텍스트는 그냥 텍스트이고
![](https://velog.velcdn.com/images/woojusm/post/4512f152-3e25-4e31-ac19-210bdc758bdd/image.png)  
레이블은 이미지가 포함된 텍스트임  

이 VStack 두개 사이에 Spacer로 공간을 채워줄 수 있음

고럼 요렇게 보인다

![](https://velog.velcdn.com/images/woojusm/post/5edd30d3-6345-451a-b305-afe241f62af6/image.png)  

그리고 스택에 Alignment를 추가해줄 수 있음!  

![](https://velog.velcdn.com/images/woojusm/post/d1332404-32a7-44ca-879c-1cf6f3bbef04/image.png)  요렇게!!  

이렇게 설정해주면 default로 설정되어 있는 .center를 override함  
코드로 작성해줘도 되고, VStack 선택되어 있는 상태에서 Attribute inspector에서 설정을 줄 수도 있다.  

![](https://velog.velcdn.com/images/woojusm/post/dc4286b5-f568-447d-97bf-1be8c8f72b1e/image.png)
SwiftUI에선 modifier를 사용해 customize가 가능함. 여러개 중첩해서 쌓을 수도 있고!!  (근데 이렇게 사용할 경우엔 순서가 중요할 때가 종종 있음!)  

이제 밑에다가 Circle을 추가해보자  

![](https://velog.velcdn.com/images/woojusm/post/2cac1961-1d54-475d-b90d-206eafaf4e21/image.png)
호오 신기신기  
이 Circle 약간 에펙에서 쉐입레이어 설정할 때랑 비슷한 느낌임!!  
![](https://velog.velcdn.com/images/woojusm/post/5eced51d-7ab5-4878-b1bb-3f76a3454f83/image.png)  
그리고 버튼을 추가해줌  
action은 클로져 형태로 넣어줄 수 있음 그리고 Label이 들어가게 된다  
버튼이 트리거 되는 이벤트는 플랫폼별로 정해져 있음!  
맥은 클릭이고, 앱은 터치

![](https://velog.velcdn.com/images/woojusm/post/ff6a659a-a6ba-423b-86ef-6987246cc05e/image.png)

텍스트와 버튼 사이에 Spacer로 간격을 주고,  
전체를 감싸고 있는 VStack에 padding을 줬다  

SwiftUI가 되게 직관적이라서 조금의 swift 지식만 알고 있어도 금방 개발이 가능하다는 생각이 든다  
___

## Supplement accessibility data  
기본적으로 accessbility에 대한 접근이 SwiftUI에선 빌트인 되어 있다 (예를들면 VoiceOver 같은 것들) 
여기에 추가적으로 커스텀도 가능함!  

![](https://velog.velcdn.com/images/woojusm/post/c66cf7d4-280e-4b05-a81a-c285df745d51/image.png)  
accessibility에 대한 설정을 안해줬다면 기본으로 voiceOver를 실행했을 때 Label에 들어있는 이미지의 이름 string 까지 읽었을 텐데  
요렇게 childern들을 .ignore 시켜주고  
accessibilityLabel을 직접 지정해서 Time remaining이라고 읽혀질 수 있게 만드는 게 가능함!  
![](https://velog.velcdn.com/images/woojusm/post/0f40647b-9547-4966-a72e-96aba6fb2422/image.png)  
요렇게 Value도 추가가능함  
예를들자면 볼륨 조절하는 슬라이더가 있다고 했을 때 Label에 볼륨을 지정해주고  
볼륨의 값을 읽혀지게 하는 게 가능하다  

```swift
var body: some View {
    Button(action: {}) {
        Label("Skip song", systemImage: "forward")
    }
    .accessibilityLabel(Text("Skip song"))
}
```
요렇게 있다고 했을 때 VocieOver는 어떻게 읽힐까?!!

Skip song. Button 이라고 읽힘  
기본으로 설정을 안해주면 VoiceOver는 systemImage 스트링을 읽고,  
Button 같은 경우는 이미 있으니까 추가 안해줘도 읽어줌  
___

## Create a color theme
![](https://velog.velcdn.com/images/woojusm/post/97f082a4-3971-4cbc-afad-61f80417ea83/image.png)
칼라 테마 추가해주고

![](https://velog.velcdn.com/images/woojusm/post/607ac318-6e73-4971-99bf-49bbc7cc4019/image.png)
모델이란 그룹을 만들고 Theme이란 swift 파일을 추가했다  

![](https://velog.velcdn.com/images/woojusm/post/b8d40c11-21d2-462b-936a-8b2366b7a5e7/image.png)
enum 타입의 Theme을 만들고, rawValue 타입을 String으로 지정해줬다  
rawValue는 껍질을 벗겨봤을 때 뭐가나오냐!! 물어보는 거라고 생각하면 됨  

enum 자체는 나무이고, case는 나뭇가지들, rawValue랑 associated Value는 과일인데  
associated Value가 과일 껍질이라면 rawValue는 속알맹이!  

![](https://velog.velcdn.com/images/woojusm/post/54d3564a-5bf6-4142-95e4-fe56f0ae7682/image.png)  
enum은 변수에 담겨질수 있는데  
```swift
let colorPick: Theme
```
요런식으로 선언했으면 이 변수를 당장 사용하지는 못함. enum은 '값' 밸류 타입이기 때문에 initial value가 꼭 있어야함  

```swift
let colorPick: Theme = .buttercup
```
이렇게!!  
요렇게 설정이 되고나면 accentColor는 Color타입인데 switch를 타고 들어가서 .black이 설정되게 되겠죠?! 요런 플로우임 enum은  
![](https://velog.velcdn.com/images/woojusm/post/251d57f3-20df-48ea-bd8e-18c163643442/image.png)  
메인 칼라라는 컴퓨티드 프로퍼티 또한 만들었는데 이번엔 rawValue로 바로 만들어질 수 있게 해줌!  
___
## Create a daily scrum model

데일리 스크럼 모델을 만들어주자  
![](https://velog.velcdn.com/images/woojusm/post/2c5c58ef-e5f0-45fb-89e1-e5ed2fc76c21/image.png)  
그리고 샘플 데이터를 넣어준다!  

![](https://velog.velcdn.com/images/woojusm/post/b4e11f12-bb83-4a2f-bfa1-79ef8873b829/image.png)
목업 데이터를 준비해서 테스트할 때 쓸거 같음  

## Create the Card view

SwiftUI로 새로운 CardView를 만들어주자  

![](https://velog.velcdn.com/images/woojusm/post/5179f987-8a6c-4bc7-989b-fcd97bc4aa27/image.png)
아까 만든 모델을 constant로 선언해준다  

![](https://velog.velcdn.com/images/woojusm/post/94443d98-707e-440a-a133-e1e69436fff4/image.png)
프리뷰에다가 sampleData로 만들었던 데이터를 넣어준다!  

![](https://velog.velcdn.com/images/woojusm/post/7ad34465-473a-422b-984d-007559781d24/image.png)
그리고 프리뷰에 뷰를 조금 더 가시적으로 볼 수 있게 추가해줌  
![](https://velog.velcdn.com/images/woojusm/post/65603995-e711-4bcd-a1c1-2fabd6baa2ec/image.png)
그리고 요렇게 Label을 추가해줬음  
* Label과 Image는 살짝 다른 파라미터를 사용함!  
지금 같은 경우 SF symbol을 사용하니까 systemImage라는 파라미터가 들어갔음  
![](https://velog.velcdn.com/images/woojusm/post/4b393be6-8afc-4d40-a3a5-7f9a7ea0124c/image.png)
![](https://velog.velcdn.com/images/woojusm/post/7fca7b21-2ccc-489b-ba39-3759ca275d93/image.png)
그리고 Label에 패딩으로 trailing 20만큼 수치줌  ![](https://velog.velcdn.com/images/woojusm/post/b89fa4a8-3901-4a2f-af55-b3acf870025f/image.png)  
그리고 HStack 전부에 font를 .caption으로 먹여줌  
* Label에서 사용된 Label과 이미지들 SFSymbol은 font 크기와 두께에 맞춰서 스케일이 자동으로 맞춰짐  

![](https://velog.velcdn.com/images/woojusm/post/369eb8da-f7e4-4542-81d4-f958d399e442/image.png)
전체 VStack에 패딩을주고 foregroundColor를 맞춰줬다!  
scrum의 theme 에 따라 변하게 되는 accentColor로!  

## Label Style 커스텀


![](https://velog.velcdn.com/images/woojusm/post/bf999c51-afb2-4f40-9007-4f2a4d2d1558/image.png)  
새로운 TrailingIconLabelStyle이 될 struct를 선언하고  
LabelStyle프로토콜을 채택해준다  
Label Style 프로토콜은 내부에 항상 뷰로 그려질 수 있는 애가 존재해야 사용 가능한 듯  
![](https://velog.velcdn.com/images/woojusm/post/9107b188-eec2-4a49-8bc2-485bcfdc08ce/image.png)

![](https://velog.velcdn.com/images/woojusm/post/066f0a91-0c9c-4de4-aacd-29902c75d11c/image.png)  
configuration을 설정해주는데 이 파라미터는 LabelStyleConfiguration이다.
icon 뷰와 title뷰를 현재 나타낸 거!  

![](https://velog.velcdn.com/images/woojusm/post/c9e78fbb-8118-4396-a0b8-6595f2636ee6/image.png)  
그리고 extension을 추가했는데  
LabelStyle 프로토콜에 제약사항을 준거! TrailingIconLabelStyle일 때만 static으로 선언한 trailingIcon에 접근할 수 있게!  

`static var trailingIcon: Self { Self() }` 는 trailingIcon이
TrailingIconLabelStyle.trailingIcon으로 바로 접근할 수 있게 만들어준 shorthand  
레이블스타일을 채택하고 있는 애가 TrailingIconLabelStyle일 때 . 문법으로 trailingIcon에 인스턴스 생성 없이 바로 접근 가능함! 이렇게 나타낸거

Self는 타입의 이름을 반복해서 쓰는 대신에 현재 타입을 쓸 수 있도록 도와주는 키워드.  
클래스, 구조체, enum 등에서 Self를 사용하면 그 타입 자체를 가리킨다  

다시 카드뷰로 돌아와서 
![](https://velog.velcdn.com/images/woojusm/post/7dcfef68-a16e-428f-b401-36c008433982/image.png)  
원래는 패딩으로 되어 있던 자리에 .labelStyle(.trailingIcon)을 해주면
title과 icon의 위치가 Label 내에서 바뀌게됨!
___
## Make the card view accessible

제목이 되는 타이틀에 accessibility를 추가해준다!  

인원수랑 시간도 추가 해줌!
![](https://velog.velcdn.com/images/woojusm/post/39e8f1a5-d0ed-4632-b610-d3dbcbdd4b2a/image.png)  

___
## List 뷰 만들기

![](https://velog.velcdn.com/images/woojusm/post/1ba70f4a-cab3-413a-85b7-e2b9ef080866/image.png)
새로운 ScrumsView를 만들고 DialyScrum 배열을 상수로 선언해줌  

![](https://velog.velcdn.com/images/woojusm/post/33887908-de89-41a8-8e61-3e8b03727536/image.png)  
프리뷰에는 sample로 만들었던 데이터 넣어주고!  
![](https://velog.velcdn.com/images/woojusm/post/168d9d17-9e65-41db-af52-b1bb700f0464/image.png)
리스트 뷰를 먼저 구성해줌  
그리고 ForEach뷰를 추가해준다  
ForEach뷰는 콜렉션에 있는 각각의 아이템들을 식별가능한 방법이 필요함.
지금 같은 경우엔 샘플 데이터에 담긴 내용들이 다 다르니까 그냥 title의 경로를 인식 시켜줌  

![](https://velog.velcdn.com/images/woojusm/post/4cd27beb-3732-4cae-9245-bab73fac2ef1/image.png)

이제 아까 만든 CardView를 넣어주면?!

![](https://velog.velcdn.com/images/woojusm/post/f85e3473-da11-49da-927b-421fa42cddae/image.png)
요호우 진짜 간단하다  

![](https://velog.velcdn.com/images/woojusm/post/3b4f27c0-9d9d-46bb-bf60-5b3892630d3f/image.png)  
그리고 Row의 백그라운드 칼라를 넣어줌  
사실 뷰를 넣어주는 건데 칼라도 뷰라서 넣으면 색이 칠해지겠죠?

![](https://velog.velcdn.com/images/woojusm/post/ba19078c-9de1-4cf9-b2cc-3545f6e0e79f/image.png)  
Color 문서를 읽다보면 나온다  
___
## Make scrums identifiable

지금 만들어준 ForEach뷰에 하나라도 똑같은 데이터가 들어가게되면 종종 크래쉬 남  
타이머 만들다가 경험해봤죠  
그래서 각각의 데이터들이 유니크하다는 걸 알려줘야하는데  

![](https://velog.velcdn.com/images/woojusm/post/5c513d80-dcb6-41f5-a8e6-dd7fd760d762/image.png)

Identifiable 프로토콜을 모델에 채택하면된다  
이 프로토콜을 구현하기 위해선 id가 구조체 내에 선언되어 있어야함  

이렇게만 했을 때 아직 컴파일이 되질 않음!  
샘플data로 선언한 [DailyScrum] 에 id항목이 초기화되어 있지 않아서.  
그럼? 초기화 해주면 되겠죠  
![](https://velog.velcdn.com/images/woojusm/post/55bbd9ef-581e-4337-995c-2097bb4e45cb/image.png)
요렇게 init 안에 id: UUID = UUID() 를 넣어주면 생략이 가능해짐  

이제 ScrumsView에 있는 ForEach 뷰를 더 간단하게 표현이 가능해진다  
![](https://velog.velcdn.com/images/woojusm/post/72be8434-1a57-4448-b5b3-83d4a94b974c/image.png)

경로를 얘기해주기위해 사용했던 \.title을 지워도됨  
![](https://velog.velcdn.com/images/woojusm/post/9a812c36-6daa-439a-9a45-371324b2d20a/image.png)

![](https://velog.velcdn.com/images/woojusm/post/2f659ff4-2ae7-4104-9cae-f58fa9592593/image.png)

App파일로 와서 루트뷰를 ScrumsView로 설정해주면 처음 실행할 때 뜨는 뷰가 ScrumsView가 되게된다  
___
## Creating Navigation hierarchy  

![](https://velog.velcdn.com/images/woojusm/post/0bccb4b8-e884-4b0b-bdfe-7f64f56c715f/image.png)

App 파일에서 ScrumsView를 NavigationView에 임베드 해준다  
![](https://velog.velcdn.com/images/woojusm/post/fbb66c38-1327-468e-a564-a575d1d6a4c8/image.png)
ScrumsView에서도 프리뷰 될 때 NavigationView 넣어줌!  

![](https://velog.velcdn.com/images/woojusm/post/269b64c7-d16d-4c10-91c5-0efe032d9ae6/image.png)
ForEach뷰에서 NavigationLink를 넣어줬다!  
이렇게되면 각각의 뷰들을 터치했을 때 destination이 되는 뷰로 이동이 가능해진다  

![](https://velog.velcdn.com/images/woojusm/post/d01e10e6-3bbf-45a3-a29c-18b4bc527f50/image.png)
네비게이션링크 바깥으로 색이 칠해지게 해주고  
![](https://velog.velcdn.com/images/woojusm/post/732527f8-0185-4f01-ae99-486623025624/image.png)
리스트뷰에 navigationTitle을 추가했다  

버튼도 추가해주자  
![](https://velog.velcdn.com/images/woojusm/post/7ff37b2a-4988-4475-b41b-7d1a59f44083/image.png)  
![](https://velog.velcdn.com/images/woojusm/post/633b3dc3-0903-4c32-9bb4-a6d0272586eb/image.png)  
accessibilityLabel도 버튼에 추가해주고!  
이렇게 보니까 주석대신에 달아주는 느낌인 것 같기도 하다  
어떤 동작을 하는 애인지 알려주는 용도로  

___
## Create the detail View

새로운 DetailView를 만들어주자  
scrum 모델을 선언해주고  
프리뷰에도 샘플데이터 꽂아줌  

![](https://velog.velcdn.com/images/woojusm/post/5f12794c-fab6-48f9-bcc3-07bfff964732/image.png)

프리뷰 되는 곳에서 NavigationView로 감싸주고  

ScrumsView로 돌아와서 NavigationLink detination을 DetailView로 변경해줬다  
![](https://velog.velcdn.com/images/woojusm/post/ba5a5543-9687-4cde-9159-e2d835ea844b/image.png)

___
## Add visual components to the detail view  
디테일뷰로 돌아와서 body가 되는 뷰에 List를 추가해줬다  
![](https://velog.velcdn.com/images/woojusm/post/0fb63a3e-2b55-4f82-99a9-7224b67aa494/image.png)  
그리고 섹션도 추가해줌  
이렇게 뷰를 구성해나가다 보니 선언형 프레임워크가 어떤 뜻인지 감이 잡힌다  
여태까진 섹션을 주저리주저리 늘여놓고, 얘를 섹션으로 쓸거야! 명령해줬었는데  
지금은 섹.션. 끝인 느낌 ㅋㅋㅋ  
![](https://velog.velcdn.com/images/woojusm/post/53e4abd0-80f1-4d98-af17-155381c5e626/image.png)

섹션 안에 Label을 구성해주고, 폰트와 ForegroundColor를 설정했다  
![](https://velog.velcdn.com/images/woojusm/post/8ac1e722-2760-4ca0-97de-99a0c023aeaf/image.png)
HStack안에 레이블과 텍스트를 구성해줌  
SwiftUI를 구성할 때 제일 습득을 빠르게 하는 방법은 머리속으로 코드를 작성하면서 직접 그려보는 일인 것 같다  
프리뷰로 보는 게 아니라 머리로 그리면서 코드를 작성하면 속도도 빠를 듯  

![](https://velog.velcdn.com/images/woojusm/post/a78c0fd7-6773-49c6-9812-068ae07b6147/image.png)  
accessibility도 추가해줬음  
지금처럼 VoiceOver가 읽어주는 내용을 묶는 작업도 가능하다  
이렇게 하지 않았을 땐 ViceOver유저는 내용을 듣기 위해서 두 셀을 모두 터치했어야함  

![](https://velog.velcdn.com/images/woojusm/post/5e43c838-6988-4ab7-afd5-439abad237d0/image.png)
Theme 파일로 돌아와서, 새로운 변수를 선언해줬다  
rawValue의 스트링을 대문자화 할 수 있는 프로퍼티!  

![](https://velog.velcdn.com/images/woojusm/post/a9ab41b3-c9c0-4108-86a0-a5649122cecf/image.png)
![](https://velog.velcdn.com/images/woojusm/post/96d21df7-1d39-4187-8f66-6470e10cf8f4/image.png)  
텍스트 꾸며줌  

___

## Iterate through attendess

![](https://velog.velcdn.com/images/woojusm/post/19056297-5f89-41e9-89b6-a4fe3fc16819/image.png)
참석자들의 이름들이 같을 수 있다. 각각의 이름들이 유니크하게 만들어보자  
Attendee라는 새로운 구조체를 DailyScrum의 extension으로 작성해줌  
![](https://velog.velcdn.com/images/woojusm/post/3bd38490-d846-4582-a0d8-191212c82b7a/image.png)  
기존의 스트링 배열이었던 attendees를 방금 선언해준 구조체의 배열 형태로 업뎃해주고, init될 때 attendees 에 들어온 string배열을 Attendee의 name 프로퍼티에 매핑해주고, 이 배열을 다시 attendess 프로퍼티에 할당해준다  
이제 identifiable 해졌다!  
>💡init의 파라미터의 타입은 원래의 타입과 다를 경우도 있다는 걸 처음 알았다! init의 본질적인 역할을 생각해보면 object의 초기 세팅을 설정하는 거임. 지속적으로 같은 상태를 초기에 전달해주는 겨  

다시 디테일 뷰로 돌아와서 Attendees 섹션을 추가해주자  
![](https://velog.velcdn.com/images/woojusm/post/c0b5ec4e-0102-4de7-b0e2-9e73fa008149/image.png)
___
## Navigatie between screens

![](https://velog.velcdn.com/images/woojusm/post/c2c65f6e-130a-4f96-ba38-8b7413cbab51/image.png)
StartMeeting Label을 NavigationLink로 감싸주고, destination은 MeetingView()로 설정!  
NavigationLink로 감싸주면 label은 gesture recognizer로 감싸지게 된다  
그리고 navigationTitle을 scrum.title로 설정해줌  
신기한건 navigationTitle은 어떤 scope에서 작성해도 똑같이 타이틀이 나옴  

그리고 앱을 실행해보면! 

![](https://velog.velcdn.com/images/woojusm/post/7c2d1b21-6334-4ddd-870c-f15af19a41ef/image.gif)

# Managing data flow between views

### State
@State로 프로퍼티를 선언하게 되면 view와 함께 source of truth를 만들어주게 된다. 이 프로퍼티를 적용한 뷰들은 value들이 업데이트되면 ui도 같이 업데이트가 됨. 단하나의 진실!인 이 @State 프로퍼티를 만약에 다른 뷰의 계층에서 사용하고 싶다면?
### Binding
@Binding으로 감싼 프로퍼티는 현재 존재하는 sourceof truth를 공유해서 읽고 쓰기의 접근이 가능해짐
___
## Creating the edit view

DailyScrum의 extension으로 Data struct를 선언한다  
![](https://velog.velcdn.com/images/woojusm/post/d35bbefb-5814-4202-a8fc-06200d6dee98/image.png)
여기서 lengthInMinutes를 Double타입으로 선언한 이유는 slider를 사용할 계획이라서! 그리고 지금처럼 DailyScrum.Data로 접근가능하게 내부에 선언해서 Foundation Framework에 선언되어 있는 Data타입과 구분 가능하게 해줌  

![](https://velog.velcdn.com/images/woojusm/post/b563128e-db6e-4dfd-819b-1fb06aaa148d/image.png)
Data 구조체에 기본 값을 넣어서 초기화될 때 값 안넣어줘도 되게 만들고,  
data라는 computed property를 선언해줌!  
Data struct타입인데 이 Data에는 DailyScrum 모델에 있는 프로퍼티의 값들이 들어가게 된다!  
>💡 살짝씩 변형해서 모델을 사용해야할 경우에 지금처럼 내부에 Data라고 부른 struct를 만들고, computedProperty를 활용해서 새로운 모델로 사용가능하겠다!

## Add an edit view for scrum details

DetailEditView를 만들고 
아까 작성한 Data구조체를 @State로 감싸준다  
(여기서 private이 붙는 이유는 이 뷰 내에서만 접근이 가능하도록 해주기 위해서임, 안정성을 높이는 측면)  
![](https://velog.velcdn.com/images/woojusm/post/8e2b1016-c14c-4a88-8743-f56ed8283683/image.png)  

그리고 Form container안에 섹션을 만들어준다  
Form container는 다른 플랫폼에서도 랜더를 해서 폼을 맞춰줌  

![](https://velog.velcdn.com/images/woojusm/post/c7e369c3-5468-4616-9501-affb0dcc2301/image.png)  
그리고 텍스트필드를 만들어주는데 text의 내용은 $data.title로 전달될 거임  
$data.title?!  
![](https://velog.velcdn.com/images/woojusm/post/1b0784cc-f7e8-468f-85b6-9e7d8ab99262/image.png)
@State로 감싸진 단하나의 진실인 DailyScrum.Data()에 접근하고, 
텍스트 필드의 텍스트는 여기랑 연결이 될거다~ 바인딩해줌  
그럼 현재의 이 뷰는 data property를 관리하게 되겠죠  

![](https://velog.velcdn.com/images/woojusm/post/14473d0a-61ab-4443-b3e8-136e32efbbdf/image.png)

Slider를 추가해줬다.현재 Text는 보이지 않는데 이건 VoiceOver용으로 임의로 추가해둔거!  
![](https://velog.velcdn.com/images/woojusm/post/f73f754a-0114-46d4-ae82-fb9de2d09eeb/image.png)  
그리고 두번째에 있는 Text("\(Int(data.lengthInMinutes)) 부분은  
읽기 작업만 해서 $ 를 안붙여줬음!!  
$가 붙을 때는 쓰는 작업까지 할 경우에(유저가 상호작용을 할 경우에)!!!  

___
## Display attendees in the edit view  
새로운 섹션을 만들어주자  
섹션안에 ForEach 뷰를 구성하고  
내용이 될 항목은 data.attendees로!  

![](https://velog.velcdn.com/images/woojusm/post/e5c5d955-0ba2-4f9f-9240-277414ff5d51/image.png)
.onDelete modifier도 적용해줬다  

![](https://velog.velcdn.com/images/woojusm/post/25c6d71b-63a9-47ec-b88c-fc2a98213f68/image.png)  
새로운 single source of truth가 될 attendeeName을 선언해주고!  

![](https://velog.velcdn.com/images/woojusm/post/186a864f-fff2-47d7-9e4e-7172b6bb4c7c/image.png)
TextField를 구성해줌  
이때 입력되는 텍스트는 방금 선언했던 newAttendeeName과 바인딩!  
버튼도 추가해주자
![](https://velog.velcdn.com/images/woojusm/post/fb4229e5-98a4-420f-b4c6-e38b8329b8f5/image.png)  

![](https://velog.velcdn.com/images/woojusm/post/69ca8ed8-ec7f-4355-b95f-895b7465470b/image.png)  
버튼에 action을 추가해주는데  

DailyScrum.Attendee의 name 프로퍼티에 새로입력되는 newAttendeeName을 넣어주고 data에도 추가를 해줌!  

그리고 추가된 후에는 다시 초기화 해주는 걸로! 이렇게되면  
newAttendeeName이 비워질 경우에 TextField도 비워지게 되겠죠?
![](https://velog.velcdn.com/images/woojusm/post/ded47d54-f944-43a7-afd0-5d71b62e4806/image.png)

그렇게 텍스트필드가 비워져있다면 button을 비활성화해줌!!  
![](https://velog.velcdn.com/images/woojusm/post/d0dde3c5-0f86-41a0-9e1e-7f1eae1336ab/image.png)  


___
## Add accessibility modifiers

![](https://velog.velcdn.com/images/woojusm/post/eda04468-e751-4042-a5c3-3402d769250f/image.png)
![](https://velog.velcdn.com/images/woojusm/post/d31c1f88-774d-482e-8125-d6f39972a410/image.png)
![](https://velog.velcdn.com/images/woojusm/post/94c4366b-5d11-4f37-9848-31367b7a61eb/image.png)

___
## Present the edit view

디테일뷰로 돌아와서, @State 로 새로운 변수 선언한다!  
![](https://velog.velcdn.com/images/woojusm/post/88aa1680-4aee-4c76-9e6a-3765e0c8a9f9/image.png)

이 값에 따라서 화면이 뜨게 할 계획  
![](https://velog.velcdn.com/images/woojusm/post/bcac46a1-38f5-41e3-ba59-400d0512d9f2/image.png)

리스트뷰의 끝자락에 .sheet 애니베이션을 넣어줬다  

![](https://velog.velcdn.com/images/woojusm/post/a80e0db2-3b60-43b8-a868-bd32d9acd122/image.png)  

툴바를 추가하고, 버튼을 선언해서 이버튼이 탭되면
isPresenting 값이 변하게 되고, sheet 모달이 $isPresent 의 값을 바라보고 있으니까 DetailEditView가 뜨게 된다!!  

![](https://velog.velcdn.com/images/woojusm/post/a2e099e7-734d-489c-b939-8f622120392f/image.png)

DetailEditView에 NavigationView를 추가하고,  
조금 더 사용자가 새로운 뷰에 진입했을 때 명확하게 알 수 있도록!  
타이틀이랑 툴바 (캔슬버튼) 추가해줌~!  

마찬가지로 Done 버튼도 추가하고!
___
# Passing data with bindings

새로운 ThemeView를 만들어준다  
![](https://velog.velcdn.com/images/woojusm/post/2f12eb53-c735-4686-a901-b6a4dda28c93/image.png)
list의 cell을 같은 파일내에 물론 작성할 수도 있지만  
지금처럼 다른 파일로 작성하게 되면 재사용에 유리함!  
![](https://velog.velcdn.com/images/woojusm/post/61f4deee-b313-4c83-85f5-7bd51b3a9a9e/image.png)  

## Add a theme picker

![](https://velog.velcdn.com/images/woojusm/post/5247fc2d-7450-46d2-af3f-ff8556d7a5bf/image.png)
@Binding을 하게 되면 parentView에 현재 뷰로 값을 전달해주고,
child View에서 이뤄지는 변경사항들을 전달해줄 수 있음  

![](https://velog.velcdn.com/images/woojusm/post/67f7cd41-ff2c-4051-81b4-c3b1895643d2/image.png)
피커뷰 삽입!  

Theme 을 선언해줬던 파일로 돌아와서 CaseIterable과 Identifiable을 채택해줌!  
id는 name으로 구분가능하게 해주고  

![](https://velog.velcdn.com/images/woojusm/post/63bc1462-2821-46b8-935a-5291f0461ef7/image.png)
ForEach뷰로 Theme의 케이스들을 전부 넣어주고,  
![](https://velog.velcdn.com/images/woojusm/post/cda3ea7e-2327-41b9-a7fc-95bb1be35f04/image.png)
현재의 뷰가 다른뷰에서 값을 받아오고 이 값이 변경되는 걸 바로바로 UI업뎃 할 때 사용하는 게 @Binding  


___
## Pass the edit view a binding to data 
Picker View를 따로 구성해보자!  
먼저 ThemeView라는 새로운 SwiftUI파일을 작성하고,
![](https://velog.velcdn.com/images/woojusm/post/bb321f51-d273-493a-9fe1-8733e6d8c892/image.png)  

ThemePicker 라는 Picker View를 구성해준다  

![](https://velog.velcdn.com/images/woojusm/post/2490a035-c75e-4652-8c8d-bb6d3c9ebbc0/image.png)

이대로만 했을 땐 튜토리얼처럼 피커뷰가 구성이 안됨..
ios 16에서 바뀌었다고 하는데 튜토리얼 처럼 보여주려면 .pickerStyle(.navigationLink) 를 추가해줘야함  

근데 이렇게되면 Detail Edit View에서 Picker 기능이 작동하지 않는 현상이 발생!  
애플 포럼에 질문 올려놓고 우선 튜토리얼처럼 진행하기로 했다  

여기서 @Binding은 언젠가 @State의 값을 찾아서 옮겨질거고, 이 값이 변경되게 되면 UI도 업뎃 되게 해주려는 계획!  


![](https://velog.velcdn.com/images/woojusm/post/a3ee8c35-7c62-4244-a4d9-6cfcd7f764b5/image.png)
만든 피커뷰 DetailEditView에 넣어주고  
![](https://velog.velcdn.com/images/woojusm/post/cb1bb502-b423-4601-8b73-fc8e12fd9c79/image.png)
Detail Edit View에 있던 data property를 @State에서 @Binding으로 변경했다!  
![](https://velog.velcdn.com/images/woojusm/post/52c15402-0fe9-4251-a81b-07be4c6707e3/image.png)  
디테일뷰에다 @State로 data 프로퍼티를 구성해주고


![](https://velog.velcdn.com/images/woojusm/post/707ddf14-2401-4d07-8e4b-1f45ad128313/image.png)  
Edit Button이 눌려질 때 data에 scrum.data를 옮겨줌!  


![](https://velog.velcdn.com/images/woojusm/post/ab5c9bf4-1b3a-4209-ab2e-678f3ac794f4/image.png)  

그리고 DetailEditView를 띄워주는 쪽에서 $data로 값이 바인딩되게 해주고,

Done에선 scrum이 업데이트 될 수 있게 해줌

![](https://velog.velcdn.com/images/woojusm/post/ed539405-2fa7-4314-83c2-5c9597aa8623/image.png)  

![](https://velog.velcdn.com/images/woojusm/post/a6728044-2bdc-437d-842b-172c22e479ee/image.png)
DailyScrum Model에 있는 update 메소드! 꼭 구현해줘야함  
메소드를 보면 data를 받아서, DailyScrum의 프로퍼티들에 옮겨주고 있다!

그럼 데이터에 있던 값들이 본래의 scrum 으로 옮겨오게 되고, 
scrum 또한 Binding되어 있으니까 또 연결해주는 거네  

![](https://velog.velcdn.com/images/woojusm/post/6d1bf694-9a8b-4293-aee6-1baa135e8ad1/image.png)
ScrumsView에 있는 scrums 프로퍼티도 @Binding으로 바꿔주고,  
전달되는 값도 바인딩 될 수 있게 $ 붙여줌!  
___
## Pass a binding into the list view

![](https://velog.velcdn.com/images/woojusm/post/003e1079-329c-4f93-b941-264a1d4e824f/image.png)  

ScrumdingerApp 파일로 와서
@State ScrumsView의 Single source of truth가 될 친구를 선언했다!  
값도 binding되게 해주고!  

### 🤔What is the type of $book.identifier?

```swift
struct Book {
    var title: String
    var identifier: Int
}
@State private var book = Book(title: "The Adventures of Smudge", identifier: 19237)
```
$가 붙게되면 `Binding<Int>` 타입으로 변함! 같은 값이 전달되니까 Int인줄 알았는데 프로퍼티래퍼로 감싸지게되면 타입이 변한다!!
___

