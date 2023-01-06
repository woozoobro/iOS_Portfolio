# 일기 앱 만들기
- UITabBarController
- UICollectionView
- NotificationCenter

## UI 구성

탭바와 네기베이션을 임베드 해준다  
![](https://velog.velcdn.com/images/woojusm/post/8f8c978b-ff7e-411a-b783-39a90a7c3fda/image.png)  
네비게이션 컨트롤러에서 탭바 아이템 설정 ( 탭바는 네비게이션 쪽으로 흐르고 있다 )
아래에 있는 쪽은 선택되지 않았을 때 이미지 설정  
![](https://velog.velcdn.com/images/woojusm/post/9277b5eb-5f83-4bd5-b396-42e61e96b53a/image.png)
그리고 지금 Label 텍스트는 hugging을 250으로 늘어날 수 있게,
아래의 날짜 텍스트는 Resistance 를 751로 높여서 위의 글자가 늘어나도 사라지지 않게  
설정해주었다  
![](https://velog.velcdn.com/images/woojusm/post/2df9e98e-2955-477f-b679-30753d669d7b/image.png)
![](https://velog.velcdn.com/images/woojusm/post/51b85567-f075-48a9-96ef-86b6c3817e9f/image.png)  
위에는 텍스트필드, 아래는 텍스트뷰  
내용이 많을 때는 텍스트뷰를 쓴다!  

그럼 지금 총 네개의 화면을 만들었다  
일기들이 보여지는 콜렉션뷰, 더하기 버튼누르면 일기들을 작성할 수 있는 뷰
즐겨찾기 탭의 콜렉션뷰, 그리고 상세 화면 뷰까지!!  
IBOutlet과 Action 추가해주자  

WrtieDiaryView에서 텍스트뷰의 보더가 없는데 이거 코드로 만들 수 있다  
![](https://velog.velcdn.com/images/woojusm/post/ebd0df38-055c-4926-ab0f-91c1c161a65b/image.png)  
날짜가 선택되었을 때 datePicker로 바뀌게 만들어주자 
![](https://velog.velcdn.com/images/woojusm/post/4766ff72-a892-43e6-8497-143ecf9d1edb/image.png)

DateFormatter를 이용하여 date를 String으로 바꾼다  
여기서 (EEEEE)는 요일 첫글자만 나오게 해주는 설정  
![](https://velog.velcdn.com/images/woojusm/post/d350b509-94ed-4813-9d37-70f3ac8230db/image.png)  
![](https://velog.velcdn.com/images/woojusm/post/e2b03d57-20c1-4f35-b33a-a1696de91751/image.png)  
touchesBegan이 될 때 텍스트 에디팅이 끝나게 해줬다!  
이러면 화면 터치했을 때 텍스트 편집이 끝나게됨  

제목이랑 내용, 날짜가 전부 입력되지 않았을 때 등록이 비활성화되게 해주자  
viewDidLoad에서 isEnabled = false로 설정!  


![](https://velog.velcdn.com/images/woojusm/post/b3dc123c-b1dd-4845-8de1-82cb93671eb6/image.png)  
전부 비어있지 않다면 활성화되게 하는 로직 작성!  

텍스트뷰 같은 경우엔 UITextViewDelegate을 채택해서  
textViewDidChange 메소드에서 방금 작성한 로직이 호출되게 하면 된다  
그럼 다른 경우엔?  

addTarget 메소드로 셀렉터 메소드가 호출 되게 해주면 된다.

![](https://velog.velcdn.com/images/woojusm/post/1caecea4-8c7d-4f03-8b22-ee5b67522bf9/image.png)  
![](https://velog.velcdn.com/images/woojusm/post/7d9c937e-8f47-4267-a670-c1f50cbeb792/image.png)

지금 한 가지 문제점은 dateTextField 같은 경우  
데이트 피커로 텍스트를 전달 받고 있어서 (editingChanged가 아니라서)addTarget이 안먹히게됨  
![](https://velog.velcdn.com/images/woojusm/post/33adcddb-9028-4809-88e2-d5a432aeff57/image.png)  
datePicker 벨류 바뀌는 메소드에 action만 .editingChanged로 변경될 수 있게 해주면 된다!!  
## 모델

![](https://velog.velcdn.com/images/woojusm/post/062d289c-bd5b-427f-927c-c72ec5800fa5/image.png)
Diary 모델을 구성해주자  

WriteDiaryVC에서 일기가 작성된 다이어리 객체를 MainVC에 넘겨주고 싶다  
프로토콜 작성해보자  
![](https://velog.velcdn.com/images/woojusm/post/5fe4e3c1-bf7a-45c9-bd33-838366ae67b1/image.png)
![](https://velog.velcdn.com/images/woojusm/post/a9ff8892-d8fa-443d-91f3-4f1e59fc5123/image.png)  
 

![](https://velog.velcdn.com/images/woojusm/post/a656e8f1-c583-43f2-b802-d0b1bd2096f4/image.png)  
🤔 date는 왜 diaryDate에 담긴 Date타입을 가져와야할까?
(스트링으로 바뀐 거 가져와도됨!, 다만 다음 뷰에서 어떻게 띄울지 유동적으로 정할거면 다시 formatter 메소드 사용하는 게 좋은 것 같다)  

guard 문으로 현재 텍스트필드들에 담긴 텍스트 들을 diary에 담고,
delegate 메소드로 diary를 넘겨준다.  
그 후에 navigationController로 전 화면이 나오게 해줌  

다시 메인VC로 와서 prepare 메소드를 오버라이드 해준다  
![](https://velog.velcdn.com/images/woojusm/post/ec0d3496-b32e-4acb-bfd0-9db12c9c5b1b/image.png)  


세그로 넘어오니까 prepare 메소드 사용해주고, segue의 목적지가 WriteDiaryVC일 때 delegate을 나 자신으로 설정해줌  

이 다음은 CollectionView 세팅해주는 메소드 구현!  
![](https://velog.velcdn.com/images/woojusm/post/ab8ebf3b-8114-4624-ae5e-51d1567c6e27/image.png)  
![](https://velog.velcdn.com/images/woojusm/post/fe58fe32-32c4-486b-b1c9-30e754e44e69/image.png)  

그리고 extension 구현해줬음! 
근데 이렇게 보니까 Cell 파일 내에 configure(diary) 같은 메소드가 있었으면 더 좋았을 것 같다  
![](https://velog.velcdn.com/images/woojusm/post/a09f1385-2f4f-4ba8-8335-ad0a40b1be93/image.png)  
그리고 reload 자체를 delegate 의 메소드가 호출될 때로 설정하면
일기가 추가될 때마다 콜렉션뷰가 리로드 되겠죠!  
![](https://velog.velcdn.com/images/woojusm/post/73bb731f-c95d-413e-a7a5-f65bc62f387f/image.png)  

등록했을 때 잘 나오는 거 확인!  

## UserDefaults 사용해서 data 저장하기

realm이나 coreData를 사용하는 게 맞지만 작은 규모니까 그냥 UserDefaults로 구현하자  
![](https://velog.velcdn.com/images/woojusm/post/611c83e6-f5f6-4288-a496-45e63774076b/image.png)  

saveDiaryList 메소드를 작성! 
diary 모델의 각 요소들에 키 값을 매핑해주고,
set을 이용해서 저장 시켜 줬다! 
그리고 프로퍼티옵저버를 이용해서 didSet될 때마다 saveDiaryList가 호출되게 해줌!!  
![](https://velog.velcdn.com/images/woojusm/post/5c7d6616-dd2e-41e8-9c3c-1da70b06ee17/image.png)
로드 메소드를 뷰가 로드될 때 추가해주면  
이제 저장이 되는 걸 확인할 수 있다!  

sort를 사용해서 최신순으로 정렬해주면 좋을 거 같다  
![](https://velog.velcdn.com/images/woojusm/post/17ecb42b-eee0-436e-9cad-59c783938096/image.png)  

reload 되는 delegate 메소드 내에서도 정렬 시켜줘야겠죠  
```swift
diaryList = diaryList.sorted(by: {
    $.date.compare($1.date) == .orderedDescending
})
```
sort는 이렇게도 가능하다!  

## 셀 테두리 만들어주기  
![](https://velog.velcdn.com/images/woojusm/post/56ce30d2-8baa-4815-8398-cdb86895d59a/image.png)

required init은 view가 xib나 스토리보드에서 생성이 될때 이 생성자를 통해서 객체가 생성된다
근데 awakeFromNib 사용 하면 되는 거 아닌가?  
![](https://velog.velcdn.com/images/woojusm/post/7cba2e20-23d2-443e-a688-35be98a04d85/image.png)
awkae 써도 되네요  

## 일기 수정하는 뷰로 push  
![](https://velog.velcdn.com/images/woojusm/post/2a031a3f-9b49-4324-8161-1beadefa71a5/image.png)

일기장 리스트를 전달받을 프로퍼티가 필요하다  

![](https://velog.velcdn.com/images/woojusm/post/29640947-586c-46e8-b054-e3725eee3ab7/image.png)

![](https://velog.velcdn.com/images/woojusm/post/429dced4-71da-4fbb-8268-c2172c0b4e86/image.png)
그리고 vc를 인스턴시에잍하고 push로 띄워주면 끝!

## 일기장 삭제하기  

![](https://velog.velcdn.com/images/woojusm/post/b2d96141-78b1-47b0-8391-7c5749734aca/image.png)


![](https://velog.velcdn.com/images/woojusm/post/c7973042-749d-4746-bd44-b724f41014ef/image.png)

delegate 작성하고 delete버튼이 눌리면 delegate 메소드가 실행되게 해주었다.( indexPath도 받고)  
![](https://velog.velcdn.com/images/woojusm/post/7046c12b-2602-41b5-a2ab-bb2ce9db1311/image.png)
오케이! 잘 삭제된다  
___
## 일기 수정하기

![](https://velog.velcdn.com/images/woojusm/post/0aaf3a3c-07e6-40d0-b717-05780fa51543/image.png)

수정버튼을 누르면 WriteDiaryVC로 push되게 해줬다  
![](https://velog.velcdn.com/images/woojusm/post/6fae2aa0-5349-4b36-a419-2414c2926dfa/image.png)
열거형 생성!  
![](https://velog.velcdn.com/images/woojusm/post/f9738267-c7fb-4485-b616-cebb3f7d3248/image.png)
edit Button이 눌렸을 때 eidt으로 바뀐 열거형 값을 전달해준다  
![](https://velog.velcdn.com/images/woojusm/post/f7881e77-130e-497a-a4a8-b084b1640f9f/image.png)

enum 값에 따른 switch 문 작성해주면 끝! 
이제 실제 데이터도 업데이트 되게 해보자  
___
## NotificationCenter
등록된 이벤트가 발생하면 해당 이벤트에 대한 행동을 실행하는 거  
![](https://velog.velcdn.com/images/woojusm/post/8e1744e9-96fc-4545-9a0c-0ff4c620e85e/image.png)
![](https://velog.velcdn.com/images/woojusm/post/c7a68481-b17d-4cec-951b-bc92e68045f2/image.png)
보면 뭔가 콤바인이랑 비슷한 느낌이라는 걸 알 수 있다  

