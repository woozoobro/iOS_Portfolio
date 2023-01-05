# To-Do list 만들기

![](https://velog.velcdn.com/images/woojusm/post/2fcb3c4a-a441-45e7-b821-19f2c9aa15db/image.gif)



설정앱 같은 것들이 테이블뷰이다!  
근데 사실 테이블뷰로 구현하는 걸 콜렉션뷰로도 가능해서  
🤔 어떤 경우에 테이블뷰를 사용하는 건지 궁금증이 생긴다  

## UI 구성하기

Navigation Controller를 임베드  
이번엔 BarbuttonItem을 코드로 만들지 않고 스토리보드로 구현해보자  

테이블뷰 셀 선택하고 인스펙터에서 Style설정이 가능하다  
크게 추가할 건 없어서 Basic으로 선택!  

![](https://velog.velcdn.com/images/woojusm/post/25543b1f-c538-459b-ad25-779c64e6133a/image.png)  

우측 BarbuttonItem이 프레스될 때 Alert창이 나오게 만들어주자  
![](https://velog.velcdn.com/images/woojusm/post/94f8ffa5-34fe-49c0-90be-b800b25692eb/image.png)
___
### UIAlertController 클래스
![](https://velog.velcdn.com/images/woojusm/post/5cdcd72e-b93f-44c2-8f24-5977ddb7bad5/image.png)

preferredStyle 프로퍼티에 .actionSheet 이랑 .alert이 있는데 액션시트는 밑에서 버튼 또롱 올라오는 느낌 .alert이 일반적으로 쓰이는 거!  
___

UIAlertAction을 생성해서 registerButton이라고 네이밍해주자  
여기서 버튼의 타이틀, 스타일, action은 어떤 걸 할 지 설정 가능!  

마찬가지로 cancelButton도 추가! 
🤔 handler는 따로 없을 거 같은데 nil로 설정해줘야할지 아니면 생략가능할 지 궁금하다  
(실행해봤을 때 괜찮은 걸로 봐서는 생략도 가능한 듯)  
![](https://velog.velcdn.com/images/woojusm/post/77aba16c-4d4f-49b2-ae7f-4f764e7c1ad0/image.png)
다음에 alert에 액션 버튼들을 추가해주고, present 메소드를 사용해서 띄워주자!  
present 메소드의 프로퍼티가 UIViewController타입이 들어가는데  
UIAlertController가 UIViewController를 상속하고 있기 때문에 넣어주기 가능!!  

메모 추가해줘야하니까 alert에 .addTextField 메소드 작성해준다  

![](https://velog.velcdn.com/images/woojusm/post/127a03b4-0b05-47f1-8470-4f82e42e2b65/image.png)  

addTextField 메소드는 configurationHandler 라는 프로퍼티를 가지고 있다.
UITextField 를 받아서 처리해줄 수 있는 클로져!!  
![](https://velog.velcdn.com/images/woojusm/post/340ae1b1-5856-42d3-9d09-a248fbcf6f4b/image.png)  
등록버튼을 누르게되면 textFields에 담긴 텍스트가 등록되게 구현하고 싶다  
___
### 새롭게 알게 된 사실!
alert에 추가되는 textFields는 배열의 형태이다!!  
그래서 저렇게 몇번째 텍스트 필드를 가지고 올건지 정해줘야 text 속성에 접근이 가능!!  
___
![](https://velog.velcdn.com/images/woojusm/post/08af4b3b-734e-465a-9abe-4f00be9a36ff/image.png)

실행하고 등록눌렀을 때 optional타입으로 textField에 담긴 내용이 프린트 되는걸 확인했다  

이제 텍스트 필드의 내용을 담아줄 모델을 구성해주자  

![](https://velog.velcdn.com/images/woojusm/post/6f561a77-4adb-42f7-8cad-ddb33da9418f/image.png)  
체크리스트도 추가할 거기 때문에 done이라는 Bool도 선언!  


다시 VC로 돌아와서 tasks라는 Task 타입의 빈 배열을 선언했다!  
![](https://velog.velcdn.com/images/woojusm/post/848a7517-77fe-4c11-97c4-abd44b3f77cb/image.png)  

![](https://velog.velcdn.com/images/woojusm/post/585c2f74-f169-44d6-b692-e30ba7bf25d4/image.png)  
그리고 클로져의 선언부에 [weak self]를 추가해줬는데  
종종 나오는 거지만 조금 아리송하다  

## [weak self]

클로져는 클래스처럼 참조타입이다! 그래서 본문의 내용을 캡쳐할 때 강한 순환 참조가 발생할 수도 있는데  
(서로가 서로를 참조하게 되서 메모리에서 할당 해제가 되지 않는 경우, 메모리 누수가발생!!)  
[weak self]로 캡쳐목록을 정의해서 약하게 참조할게~ 해주는 느낌인 것 같다  
___

 ![](https://velog.velcdn.com/images/woojusm/post/73b9b93b-bc58-4340-b658-71e4ad5553ec/image.png)  
텍스트 필드에 담긴 텍스트가 옵셔널이기 때문에 가드로 바인딩 해주고 
Task타입에 타이틀 값넘기고! tasks 배열에 append 해주었다.  
이제 tasks를 바탕으로 테이블뷰를 그려주면 될 것 같다  
___
## 테이블뷰 구성하기

tableView.dataSource와 tableView.delegate이 필요하다  
프로토콜 채택해주자!!  
![](https://velog.velcdn.com/images/woojusm/post/e643e1bb-34b8-4240-a872-4b333158e54a/image.png)  
collectionView에서 cell 구성할 때와 비슷하게 해주다 순간 막혔다..
cell의 Identifier가 필요할 거라 생각했는데 그럼 Cell의 설정을 어디서 해주지?!
![](https://velog.velcdn.com/images/woojusm/post/80016582-cab1-4bfa-86e5-dd6f1ae417ff/image.png)  
똑같다!!  

다만 이번에 다른점은 따로 Cell파일까지 만들어주지 않아도 된다는 거! 

___
## DequeReusableCell

[dequeue에 대해 정리 잘되어 있음!](https://sihyungyou.github.io/iOS-dequeueReusableCell/)  
___
![](https://velog.velcdn.com/images/woojusm/post/aef93721-e0bf-4140-bd47-798134124a85/image.png)  
이 부분에서 계속 피가나서 뭐가 문제인지 한참을 고민했는데
캐스팅을 해줄 필요가 없었다..! ( Cell파일을 따로 안만들었으니까 당연한거 )
그리고... guard 도 필요가 없었다... (tableView에선 dequeue메소드 사용했을 때 반환 값이 옵셔널이 아니다!  
![](https://velog.velcdn.com/images/woojusm/post/d2aa2d71-5942-4117-bf32-2a9890d7bc66/image.png)
cell의 텍스트label에  값을 넣어주려고 했는데 이 방법이 없어질 수도 있다는 애플의 설명  

![](https://velog.velcdn.com/images/woojusm/post/ebb1c80a-29fd-40ac-8f59-eebf3266a4dc/image.png)

tasks의 indexPath.row를 통해서 안에 담긴 아이템들을 이야기할 task를 선언!
그리고 이제 tapAddButton을 했을 때 tableView.reloadData 해주면됨!  
이렇게 보면 Combine을 빨리 습득해야할 것 같다는 생각이 든다  
rx나 Combine 사용하지 않는다면 저런 reload를 ui업뎃할 때마다 작성해줘야할 것 같다  
___
## UserDefaults를 이용한 데이터 저장하기

### UserDefaults란?
기본적으로 제공되는 DB를 사용할 수 있는 인터페이스이고, Key-Value 형태로 저장하는 인터페이스!

근데 요런 용도로는 잘 사용하지 않는게 좋음.  
UserDefaults는 싱글톤 패턴으로 설계되어 앱 전체에서 단 하나의 인스턴스만 존재한다!  
이 안에 저장되는 데이터가 방대해지게 되면 필요할 때마다 계속 로드하게 되니까
간단한 정보들만 저장하는 용도로 사용하는게 좋다!  

![](https://velog.velcdn.com/images/woojusm/post/73b1a51e-f265-4704-a1fb-0c7d2a1d8416/image.png) 

tasks에 map 해서 String : Any 타입인 data 딕셔너리를 구성해주고
userdefaults에 set 메소드로 저장시켰다!  
![](https://velog.velcdn.com/images/woojusm/post/4bca0d25-175f-4bac-9fbb-eb5a1fbe1acb/image.png)  
load해주는 메소드도 작성한다!  
userDefaults 의 object 메소드를 통해서 아까 저장해준 배열을 가지고오는게 가능한데  
이때 반환되는 타입이 Any타입이라 타입캐스팅을 통해서 아까 지정해준 배열의 형태를 지정해주고  
캐스팅이 옵셔널이기 때문에 가드문으로 바인딩 해준다  
![](https://velog.velcdn.com/images/woojusm/post/a2bcccf4-80e0-410f-9c62-dba0639f70d6/image.png)
그리고 저장된 data 배열을 compactMap을 사용해서 다시 title 과 done의 형태로 넣어줄 수 있게 만들어줌  

![](https://velog.velcdn.com/images/woojusm/post/3e639324-018b-455d-a725-a7fab98e889c/image.png)

tasks 에 프로퍼티옵저버를 추가해서 값이 변경될 때 saveTasks 메소드가 실행되게 해주었다  
🤔 그런데 이러면 load하는 과정에서도 saveTasks가 호출되는 거 아닌가?

viewDidLoad에서 loadTasks() 해주고 실행하면~
앱을 껐다 켜도 데이터가 불러와지는 걸 볼 수 있다  

## 체크마크 추가해보기

tableView의 Cell이 선택되었을 때 뭔가 하고 싶다 -> delegate패턴 사용하면 되죠  

![](https://velog.velcdn.com/images/woojusm/post/26791305-e5b7-46c4-92b1-90b7d598b499/image.png)  
셀이 선택되면 done프로퍼티를 토글 시켜주고 
현재 바뀐 tasks배열을 원래의 task에다 넣어준다  
그리고 선택된 셀만 업뎃 해주면 되는데 tableView.reloadRows를 사용해서 구현해준다  
![](https://velog.velcdn.com/images/woojusm/post/9df44cb4-b18d-4de3-8642-5988a8e6144c/image.png)
그리고 cell의 엑세서리타입을 task.done 의 값에 따라 바뀌게 해주면 끝~! 

## 데이터 삭제와 셀 순서변경하기  
![](https://velog.velcdn.com/images/woojusm/post/8af9448d-b91a-4d5d-a19e-ad4378c5d459/image.png)  
editButton의 IBOutlet을 만든다. 이때 storage는 Strong으로!
🤔 왜 weak가 아니라 Strong으로 해줄까?  
(weak상태이면 다른 버튼으로 바꾸려고 할 때 바꿀 수가 없게 메모리에서 해제가 되버려서)  

![](https://velog.velcdn.com/images/woojusm/post/c7fc9b36-2d47-4404-8a39-54c0b23917ff/image.png)
doneButton을 코드로 작성해보자  
![](https://velog.velcdn.com/images/woojusm/post/ac9de355-c369-4469-9f11-05b568baf48a/image.png)
![](https://velog.velcdn.com/images/woojusm/post/2079f89c-5ac6-4124-99a2-a317d8265a64/image.png)  


![](https://velog.velcdn.com/images/woojusm/post/73c0f894-3ccf-4053-9747-c31f04e7070a/image.png)

editButton이 눌러졌을 때 doneButton으로 바뀌고, Editing모드로 바뀌게 해주었다  
![](https://velog.velcdn.com/images/woojusm/post/ed54772d-4bd3-4875-b3ff-693045533522/image.png)

![](https://velog.velcdn.com/images/woojusm/post/c37a4846-60c6-4b81-b4f5-bec8b9061c62/image.png)

TableViewdataSource 프로토콜의 메소드 중 commit 메소드를 사용하면  
선택된 행의 삭제가 가능하다 ( Editing 중일 때 ) 
tasks에서 선택된 배열을 삭제해주고, tableView의 Row도 삭제해주면 끝!  
그리고 tasks가 비어있다면 doneButtonTap 메소드가 호출되게 해주었다!  
___
### 셀 순서 변경하기

![](https://velog.velcdn.com/images/woojusm/post/9a17ca30-8eb5-4488-9d04-6ba0a5fa1402/image.png) 
요 두가지 메소드를 작성하면 가능해진다  
sourceIndexPath는 선택된 셀을, destinationIndexPath는 바꾸고자 하는 위치를 의미한다  

