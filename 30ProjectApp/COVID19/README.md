# 코로나 현황판 앱

![](https://velog.velcdn.com/images/woojusm/post/eb61829f-73dd-4482-975a-62b1306cbb4c/image.gif)


* Alamofire: Swift기반의 HTTP 네트워킹 라이브러리  

URLSession 대신 Alamofire를 사용하는 이유  
코드의 간소화, 가독성 측면에서 도움을 주고 여러 기능을 직접 구축하지 않아도 쉽게 사용할 수 있다!  

## 코로나 API
![](https://velog.velcdn.com/images/woojusm/post/db675a79-4a1f-4cd7-8575-17621915dbaa/image.png)

![](https://velog.velcdn.com/images/woojusm/post/2c74c7f0-7568-4ac5-abd8-d9423bb07dcd/image.png)

## 그래프 차트 라이브러리 
코코아팟을 설치하자  

![](https://velog.velcdn.com/images/woojusm/post/c268eb30-e73a-4f95-bce0-3894ed6e3fed/image.png)
![](https://velog.velcdn.com/images/woojusm/post/ab6cfd5e-b407-4ec5-90d5-832dd900f450/image.png)
Xcode 업뎃하고나서 pod init할 때 오류가 생겼다..
삭제하고 재설치도 해봤지만 지금 당장 해결 가능한 방법은 Xcode 프로젝트 포맷을 13.0으로 낮춰주는 거  
![](https://velog.velcdn.com/images/woojusm/post/de621aea-66ba-410b-9e2c-974d4071ed3e/image.png)
pod 파일 수정해주고 터미털에서 install  

차트 라이브러리 팟 추가해주자! 

이제 흰색 workspace로 작업해야한다  

___
## UI 구성하기

네비게이션 컨트롤러 임베드 해줬다  
빈 UIView에 PieChartView 클래스 설정해줌
![](https://velog.velcdn.com/images/woojusm/post/e49b8a20-8b52-40f9-bc96-3c331a2547cb/image.png)

스태틱 테이블 뷰를 사용해서 차트를 선택하면 데이터가 나올 예정.  
![](https://velog.velcdn.com/images/woojusm/post/1392b2ed-c063-4e6c-aff3-765ba3bc3119/image.png)
cocoa 클래스로 테이블뷰 컨트롤러를 만들어줬다  
이렇게 생성시 필요한 메소드랑 delegate 메소드가 주석처리 되어있거나 이미 구현이 되어있는데  
지금은 스태틱 테이블 뷰를 사용할 거라서 다 지워줬다  
![](https://velog.velcdn.com/images/woojusm/post/000221e7-08de-4f0d-8525-5b47b4096eb5/image.png)

그리고 스태틱 셀로 바꿔주기!  
테이블 뷰 섹션에 들어가서 rows 7개로 설정 해줬다  
![](https://velog.velcdn.com/images/woojusm/post/146dca03-15e9-47ac-b9b9-f620bdaf369c/image.png)  

이렇게 구현하는 건 따로 DataSource를 작성하지 않고 바로 셀을 IBOutlet연결해서 값 넘겨주는 간단한 방법으로 구현 가능  
![](https://velog.velcdn.com/images/woojusm/post/e3baef6b-5eb5-452f-a7e2-5bfb579cdadc/image.png)  

## Model

![](https://velog.velcdn.com/images/woojusm/post/609583a9-7d76-4214-b92a-0b66a403f61e/image.png)
![](https://velog.velcdn.com/images/woojusm/post/a2ed04f4-f79a-403d-801e-27fe7d69bc72/image.png)

json 데이터를 참고해서 모델을 만들어 줬다  

다시 메인 VC로 넘어와서 Alamofire 임포트 해주고 패치 메소드 작성  
![](https://velog.velcdn.com/images/woojusm/post/ad163178-bb0e-49f4-a588-3b17483447b9/image.png)


![](https://velog.velcdn.com/images/woojusm/post/038c716f-179a-4ef3-bec5-34127c20e07f/image.png)

![](https://velog.velcdn.com/images/woojusm/post/183ad0fb-b75f-48d4-8baf-a003c89b6ff2/image.png)  

result는 enum 케이스로 성공할때와, 실패할 때를 표현한다  

## 파이차트 표시


![](https://velog.velcdn.com/images/woojusm/post/3e39cd91-7fa9-41fc-a2dd-301ebe2be55e/image.png)

![](https://velog.velcdn.com/images/woojusm/post/45b1d1b9-b212-4c95-8576-2509315fbaad/image.png)

ui 업뎃해주는 메소드 작성하고
CovidModel 패치 메소드에서 result 타입이 success 일 때 업뎃 해준다!  
![](https://velog.velcdn.com/images/woojusm/post/c8e3478d-80b1-452e-91e1-c6cfacace46f/image.png)

json이 변환 되서 온 모델이 통으로 되어 있어서
CovidModel의 배열로 각각 나눠준다  

![](https://velog.velcdn.com/images/woojusm/post/b93839c4-b2a9-438e-a870-5b1f7e092fc1/image.png)

차트 뷰에 데이터를 추가하고 싶은데
지금 PieChartDateEntry에 넘겨주는 값이 Double이 아니라 String 타입이라 변환이 필요할 거 같다  
![](https://velog.velcdn.com/images/woojusm/post/205308b3-297a-4173-979c-eb9e99ad5353/image.png)  

![](https://velog.velcdn.com/images/woojusm/post/1519de00-ae71-4622-8294-031ef868f7de/image.png)
그리고 이 메소드를 result 가 success일때 호출 해주면 됨!  
![](https://velog.velcdn.com/images/woojusm/post/2f15beef-8369-4965-bb13-0da59a596391/image.png)

차트 관리하는 메소드 새로 파주고!  

🤔 지금 그래프가 잘 나오는데 뷰 사이즈에 맞춰서 글자가 잘리는 현상이 발생..!
밸류를 아웃사이드로 설정하면 어쩔 수 없는 것 같다. 지금은 방법을 못찾겠다...

___
## 차트 누르면 디테일뷰로 이동하기

 ![](https://velog.velcdn.com/images/woojusm/post/a47955cc-b1fb-40e4-9203-628c70ccf0b0/image.png)
detail뷰에 데이터를 옮겨줄 준비를 했다  
![](https://velog.velcdn.com/images/woojusm/post/17549a79-3feb-4e63-bdc0-c3b6d32cf77c/image.png)
delegate 채택해주고 covidModel을 차트의 entry 데이터에서 가져올 수 있게 했다!  

## 로딩 구현하기! 

![](https://velog.velcdn.com/images/woojusm/post/9d8491c7-2e15-46bf-889a-34d2cbec2a0f/image.png)
indication View 추가해주고 레이블이랑 차트 isHidden 체크!
![](https://velog.velcdn.com/images/woojusm/post/1b73d52c-3a39-43a9-982f-031c00d9cc17/image.png)  
지금은 임시로 로드 되는 느낌을 주려고 1초뒤에 큐를 실행하게 해뒀다  
indicationView.start와 stop애니메이팅 되는 시점만 맞춰주면 구현 완료!!  

