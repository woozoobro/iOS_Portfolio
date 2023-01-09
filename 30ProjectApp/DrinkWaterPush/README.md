# 물 마시기 알람앱!  
* Local Notification
* 푸시 알림  
* UserDefaults

![](https://velog.velcdn.com/images/woojusm/post/7d4292f7-f4f5-4465-9d52-e245f22c6863/image.gif)
![](https://velog.velcdn.com/images/woojusm/post/1659c250-66c5-42a6-9fba-792eec79deda/image.gif)


## Local Notification

사용자의 관심을 끄는 방법 중 하나  
UNNotificationRequest를 작성해야한다  
* identifier
* UNMutableNotificationContent (소리 내용 스트링)
* Trigger (어떤 조건에서 띄워줄 것인지)  
  * UNCalendarNotificationTrigger
  * UNTimeIntervalNotificationTrigger
  * UNLocationNotificationTrigger

편지를 보내는 방법이랑 비슷하다고 생각하자  

## UI구성

![](https://velog.velcdn.com/images/woojusm/post/876629f0-6e78-4206-b365-fb5d9f66ebf7/image.png)
새로운 네비게이션 컨트롤러를 넣어주자  
테이블 뷰의 스타일은 Grouped로!  
![](https://velog.velcdn.com/images/woojusm/post/bbc28108-f01a-4122-a794-671251d8b3e1/image.png)
테이블뷰의 cell을 구성해보자  
xib 파일도 함께 작성!  
![](https://velog.velcdn.com/images/woojusm/post/1ade7e9e-6f2d-423b-ab2d-ea1000abfe7a/image.png)

이제 테이블뷰에 Cell만 등록하면 될 것 같다  
![](https://velog.velcdn.com/images/woojusm/post/403089a6-18ea-4e16-aeaa-5fcad118ff86/image.png)

nib파일 셀 등록 완료! 
![](https://velog.velcdn.com/images/woojusm/post/d405fbaf-0689-449b-a2b5-08ed16109f11/image.png)
모델이 될 Alert 객체를 구성해줬다  
id는 고유한 id가 될 UUID()
🤔 UUID가 뭐지?
time 과 meridiem 같은 경우엔 date를 string으로 변환하는 과정을 한번 거쳐줌  

![](https://velog.velcdn.com/images/woojusm/post/ffb7b7e7-b161-4ea2-a71b-3988b233e7e7/image.png)  

extension으로 tableView관련 메소드들을 정의해준다  
지금처럼 따로 delegate를 선언하지 않고 바로 오버라이드가 가능한 건 현재 
viewController자체를 TableViewController를 상속하게 해줬기 때문  
🤔 뷰디드로드에서 nib을 등록하는 과정이 꼭 필요한 걸까?

cell의 ui업뎃하는 코드들은 cell파일 내에 있으면 좋을 것 같다  
![](https://velog.velcdn.com/images/woojusm/post/1d0d2e2c-2c9f-47f0-8838-6399af472f63/image.png)
configure라는 메소드로 빼줌  
![](https://velog.velcdn.com/images/woojusm/post/be360db7-83ab-42a4-9bd2-91e5d034bc92/image.png)
테이블뷰의 row들의 height을 설정해주고, editing이 가능하게 설정해줬다!  
![](https://velog.velcdn.com/images/woojusm/post/bcb965ee-69ea-421e-84c8-41fa3e4f30de/image.png)
더하기 눌렀을 때 띄워줄 뷰를 생성하고  

![](https://velog.velcdn.com/images/woojusm/post/f3e5e9b7-9ce0-4b84-ba31-9d5cd5cb9681/image.png)
새로운 뷰컨트롤러 만들고 time을 표시해줄 datePicker를 생성해준다  
![](https://velog.velcdn.com/images/woojusm/post/ac114dde-5083-413c-87d4-f60b37a29b03/image.png)
datePicker에서 선택된 date는 클로져형태로 전달해주려고 한다  

이제 Add선택했을 때 AddAlertVC가 띄워지게 해주자  

![](https://velog.velcdn.com/images/woojusm/post/352aee29-677f-456f-b980-600da7301c63/image.png)
지금 처럼 스토리보드가 하나밖에 없을 때는 따로 스토리보드 명시 안해줘도 되는 거 같음  
![](https://velog.velcdn.com/images/woojusm/post/0974c286-1c52-4cea-b826-d0c5b30b261d/image.png)

userDefaults를 사용해서 alert을 저장해보자  
![](https://velog.velcdn.com/images/woojusm/post/a356581d-1b2d-4843-9215-2076e1910add/image.png)
"alerts"라는 key의 data 를 만들고, PropertyListDecoder를 이용해 [Alert]의 형태로 나올 수 있게 디코딩해준다 (이렇게 하는 이유는 UserDefaults는 굉장히 제한된 타입만 이해할 수 있어서)  
![](https://velog.velcdn.com/images/woojusm/post/954c767e-5856-409b-959f-534f36f9da06/image.png)
addAlerVC가 인스턴스 되었을 때 addAlerVC 내부에 선언한 클로져의 행동을
date를 받아서 newAlert을 생성하고, AlertList는 userDefaults에서 읽어오는데,  
newAlert을 append하고 sort 해준다  
그리고 AlertListVC에 선언된 alerts에 alertList를 넣어주고,  
UserDefaults에 값을 set해주는데 이때 PropertyListEncoder를 이용해 인코딩하고 key 값엔 alerts를 가져온 다음에 tableView를 reload 해준다!  

## 삭제 구현과 스위치 값 저장하기

![](https://velog.velcdn.com/images/woojusm/post/26588157-d8c4-4535-88b5-a9845fbc7041/image.png)
선택된 열을 삭제하고, UserDefaults의 값을 재설정한 다음 tableView를 reload해줬다  
![](https://velog.velcdn.com/images/woojusm/post/04c16287-dd09-4992-80d3-665486e5a538/image.png)
셀의 alertSwitch의 tag값을 indexPath.row로 맞춰주고
(이 행동 자체는 다른 뷰에선 indexPath를 선언하지 않는 이상 어떤 셀인지 모르니까, 구분 가능한 번호를 매길 수 있는 tag라는 번호를 부여하는 거임. 결국 indexPath.row랑 똑같음)

이렇게 보니까 Cell .xib파일 같이 만들어서 하는 작업이 번잡해보인다.  
옛날 방식 같음  

## Contents 설정하기  
![](https://velog.velcdn.com/images/woojusm/post/665ac0d3-d5ba-4e62-8ede-6af9cb799e59/image.png)
AppDelegate에 NotificationCenter를 import해준다  
![](https://velog.velcdn.com/images/woojusm/post/d59b2d9f-75b3-462d-83c6-9d987b64ed8d/image.png)
그리고 delegate를 추가해주고  
![](https://velog.velcdn.com/images/woojusm/post/7b665c35-68fa-4bd3-9749-a7cdc0b12da5/image.png)

extension으로 두가지 메소드를 추가한다  

이제 사용자의 허락을 구하는 코드가 필요하다  
![](https://velog.velcdn.com/images/woojusm/post/fcba274f-4989-44ef-bb02-70103f5eb086/image.png)
UserNotifications를 import하고 user에게 request 할 수 있는 코드를 작성!  

현재 노티를 관리해줘야할 곳이 알람을 추가해주는 곳, switch껐다 키는 곳이다  
extension으로 메소드를 하나 파서 범용적으로 사용해보자  
![](https://velog.velcdn.com/images/woojusm/post/bf52b0d8-b47e-4288-90d8-dd30c3a8260a/image.png)
content.badge의 경우 앱의 아이콘을 디스플레이하는 프로퍼티인데 badge가 0이 될경우 알람이 사라지게 된다  
![](https://velog.velcdn.com/images/woojusm/post/255ddbfc-5d70-4d0c-9d82-cbed7c3d4757/image.png)
SceneDelegate에서 scene이 활성화 상태일 때 0으로 바꿔주는 로직 작성!  

## Trigger 설정하기  
![](https://velog.velcdn.com/images/woojusm/post/ecdd99a0-fc04-4674-80a9-42346b3d5c92/image.png)
UNCalendarNotificationTrigger로 matching되는 date를 설정이 가능한데 현재 시간이랑 분만 필요하니까 componenet를 구성해서 전달하고, repeats는 스위치의 켜진 상태에 따라 바뀔테니까 aler.isOn을 넘겨주면 끝!  

## Request 설정하기

![](https://velog.velcdn.com/images/woojusm/post/244269d7-81c5-457c-b884-73f1400499c9/image.png)  
![](https://velog.velcdn.com/images/woojusm/post/50e72464-3e02-414d-8006-86b244295ba2/image.png)  
![](https://velog.velcdn.com/images/woojusm/post/86c4ffb3-147b-4e95-943c-b8b9b93917c9/image.png)
![](https://velog.velcdn.com/images/woojusm/post/a5315750-6120-4673-afc4-674190ede254/image.png)
![](https://velog.velcdn.com/images/woojusm/post/18a38057-ab24-47e7-ac2a-cb27e3173f68/image.png)

셀을 삭제할때 알림도 삭제해야함  
![](https://velog.velcdn.com/images/woojusm/post/d362afc0-bea7-480a-9de2-a87d598a52ed/image.png)
![](https://velog.velcdn.com/images/woojusm/post/f5605e1f-6035-4d31-9ced-a990518d3352/image.png)


 


