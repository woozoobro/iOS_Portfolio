# Pomodoro Timer


![](https://velog.velcdn.com/images/woojusm/post/6cce7ca1-8274-4721-b533-666f720e8ad6/image.gif)

## UI구성하기

![](https://velog.velcdn.com/images/woojusm/post/f3576e76-5e4c-4879-b430-9453f0ac0740/image.png)


## 필요한 요소들 준비

IBOutlet과 IBAction을 연결하자  
그리고 duration 이라는 변수도 선언해줬다  
(시간 선택되면 몇초인지 담아둘 용도)  

![](https://velog.velcdn.com/images/woojusm/post/ad897eab-c76e-4f2a-a470-c147edc55f4c/image.png)

datePicker의 프로퍼티 countDownDuration은 현재 몇초로 설정이 되어 있는지 알려준다  
=> duration에 넣어주면 되겠죠  

![](https://velog.velcdn.com/images/woojusm/post/edbe0d80-15fb-493d-87a8-50274b3a0599/image.png)

휠을 돌리고 시작 버튼 누르면 해당 초를 가지고 올 수 있게됨  


Time Status 열거형으로 준비하자  
```swift
enum TimeStatus {
    case start
    case pause
    case end
}
//---
var timeStatus: TimeStatus = .end
```
![](https://velog.velcdn.com/images/woojusm/post/2e18b8df-6653-47bc-80bc-215cc3b60242/image.png)
그리고 시작 버튼이 눌리면 열거형의 값을 switch case로 바꿀 수 있게 해주었다  

![](https://velog.velcdn.com/images/woojusm/post/493eab6f-e015-4219-9fc5-870de17c9f63/image.png)
시작 버튼이 눌리면 label과 progressView를 숨길 수 있게 메소드하나 파주고  

![](https://velog.velcdn.com/images/woojusm/post/7d6389ac-f8f4-416a-bcd9-c213b9abca33/image.png)  

각각의 케이스에 맞는 값들을 넘겨줬다  


![](https://velog.velcdn.com/images/woojusm/post/616e140d-b5f8-4e79-8c17-5b0ce49c8939/image.png)
![](https://velog.velcdn.com/images/woojusm/post/a06028e5-88ee-48a8-bdf5-b23271bc1a62/image.png)

![](https://velog.velcdn.com/images/woojusm/post/7417a0b2-cb87-4ee8-b71d-338797a0a4be/image.png)  
버튼 상태에 맞는 상태들로 ui띄울 수 있게 해줌  

![](https://velog.velcdn.com/images/woojusm/post/77c53faf-ea49-428e-a859-a5dc3d0f22e3/image.png)
많이 하드코딩이다. 더 나은 구조는 없을까...

___

## 기능 구현하기

`var timer: DispatchSourceTimer?`를 전역변수로 선언하자  
![](https://velog.velcdn.com/images/woojusm/post/344aff7e-4b4f-4e70-82cc-b4d87f3a5d00/image.png)

타이머가 시작되는 로직을 메소드로 빼주었다  
timer가 닐이 아닐 경우 DispatchSourc의 타이머를 메인 스레드에서 실행될 수 있게 새로운 타이머를 만들어주고  
schedule로 지금부터 시작되고, 1초마다 반복이 되게  
그리고 실행되는 로직은 현재의 초가 1씩 감소하게끔!  
만약에 현재의 초가 0보다 작게 된다면 타이머가 종료되는 분기점도 만들어주고
resume을 통해서 타이머를 시작한다  


![](https://velog.velcdn.com/images/woojusm/post/4d390e64-fbfd-486f-8272-62bf2518e439/image.png)  
오케이!!  
![](https://velog.velcdn.com/images/woojusm/post/2ab6f800-e5d7-46a8-8fe5-0eef028d73c4/image.png)
타이머를 멈출 때 메소드 작성해줌  
![](https://velog.velcdn.com/images/woojusm/post/bb15c0f3-ee87-46a5-9a8b-1477592fd459/image.png)  
cancelButton누를 때 해야하던 것들도 stoptimer에 그냥 다 넣어줌  


근데 현재 상태에서 일시정지일 때 취소 (stopTimer) 하게 되면 수행되어야할 작업이
남은 상태에서 timer에 nil이 남는 거라서 처리해줘야겠다  

![](https://velog.velcdn.com/images/woojusm/post/d1f3936a-d072-4f79-b94b-3f487994981c/image.png)  
오케이!  

## 타임 레이블 표시하기

![](https://velog.velcdn.com/images/woojusm/post/80cd55d7-5a8d-4ffa-89dd-523630f2e284/image.png)
guard let self = self 로 스트롱 레퍼런스가 되도록 해줬다!
(찾아보자)

![](https://velog.velcdn.com/images/woojusm/post/ebf00583-4d46-498f-a122-d917acf7844a/image.png)

그리고 들어온 currentSeconds를
시분초로 나누어주는 로직 작성!  
String Format으로 2자리씩 나오게끔 해줬다  
![](https://velog.velcdn.com/images/woojusm/post/f9bd745f-fb49-4e12-955c-f0612499e539/image.png)  


![](https://velog.velcdn.com/images/woojusm/post/94460186-92ed-4c2a-85d1-465891032a6a/image.png)
프로그레스뷰도 업데이트 되게 현재의초를 duration으로 나눈 값이 
프로그레스뷰의 프로그레스에 할당되게 해줌  

## 알람 소리 구현!  
`import AudioService` 프레임웤 임포트 해주고

타이머가 종료 되는 부분에서
![](https://velog.velcdn.com/images/woojusm/post/5ff4480f-9d7a-439f-9ddf-4fd602fb2618/image.png)  
소리를 넣어주자  
소리들은 iphondev.wiki에서 볼 수 있음  
1005번으로 넣어줬다  

## UIView 애니메이션 해주자  

isHidden으로 선언해줬던 것들을 알파값 변경으로 크로스 디졸브 되게 해보자  
![](https://velog.velcdn.com/images/woojusm/post/e2fa8d73-89eb-4b3d-996c-368fac2b4dec/image.png)
기존에 있던 거 삭제해주고  
(메인스토리보드에서 isHidden 체크해제하고 알파로 바꿔줌) 

![](https://velog.velcdn.com/images/woojusm/post/3247c102-c0ec-411a-9b7c-7b831ae6b9c0/image.png)

UIView의 애니메이트 메소드를 사용해서 바꿔줬다!  

이미지뷰도 뱅글뱅글 돌아가게 설정해보자  
![](https://velog.velcdn.com/images/woojusm/post/37ea4ba8-f4fd-4bff-85dd-a380696642bb/image.png)  
이미지뷰 IBOutlet연결해주고 타이머가 시작되는 클로져 안에서
CGAffineTransform으로 180도 돌려지게 구현해줬다 (.pi)

![](https://velog.velcdn.com/images/woojusm/post/24c57cb6-37dd-4e8c-86e6-bc10fc533f07/image.png)
그리고 타이머가 멈추면 원래대로 돌아올 수 있게 해줌  
