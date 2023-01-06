# 날씨 앱 만들기
- Current Weather API
- URLSession

![](https://velog.velcdn.com/images/woojusm/post/a5bbec19-4b3f-40b1-912f-97a808525635/image.gif)  


## 웹 통신과 Protocol
- 인터넷 상에서의 통신을 말한다.
* 많은 정보들을 주고 받기에 인터넷에는 엄격한 규약이 존재한다.  
-> 이 것을 Protocol이라고 부른다  

### HTTP 
Hyper Text를 전송하기 위한 프로토콜  

### URLSession
특정한 URL을 이용하여 데이터를 다운로드하고 업로드하기 위한 API

*  URLSessionConfiguration
공유세션 (Shared Session) 싱글톤이고 URLSession.shared()로 호출
기본 세션 (Default Session) URLSession(configuration: .default)  
임시 세션 (Ephemeral Session) URLSession(configuration: .ephemeral)  
백그라운드 세션(Background Session) URlSession(configuration: .background)  

- URLSessionTask  

* URLSession Life Cycle
1. Session Configuration 을 결정하고, Session을 생성
2. 통신할 URL과 Request 객체를 설정
3. 사용할 Task를 결정하고 그에 맞는 Completion Handler나 Delegate 메소드들을 작성
4. 해당 Task를 실행
5. Task완료 후 Completion Handler 클로저가 호출이 됨  

___

## OpenweatherAPI 사용하기

Openweathermap.org에 들어가서 로그인하고 api key를 준비한다

Current weather data를 가지고 올 거다  

![](https://velog.velcdn.com/images/woojusm/post/43a5ea5d-cbfb-4eae-abb2-8bf6ed75d57b/image.png)  


___

## UI구성

![](https://velog.velcdn.com/images/woojusm/post/2ff39770-4dfb-48a0-acc3-bbbbfd6aae57/image.png)  
이렇게 구성해주고 Hidden 체크! (날씨 검색되기 전엔 뜨지 않게)  
![](https://velog.velcdn.com/images/woojusm/post/772f15bf-a795-4789-aac9-d61313bd059d/image.png)
아웃렛과 액션 추가해주고  

데이터들 담을 WeatherModel을 하나 만들어주자  
JSON에서 현재 구조체로 변환될 수 있게 Codable 채택해주고  
![](https://velog.velcdn.com/images/woojusm/post/42082c53-5bc5-43c8-a4a0-d3f588243457/image.png)  
필요한 요소들을 담을 수 있는 프로퍼티를 준비한다  

![](https://velog.velcdn.com/images/woojusm/post/8b77d6cc-f048-41eb-9e38-26e57934893c/image.png)

프로퍼티 이름이 Json의 프로퍼티와 일치해야하지만 enum CodingKeys로 Codingkey를 매핑 해주는 방법도 있다!  
___
![](https://velog.velcdn.com/images/woojusm/post/b0588f7b-2d84-4f0f-a8b3-7c3b0d49d5d9/image.png)

현재 날씨를 가져오는 urlSession 메소드를 준비했다  

![](https://velog.velcdn.com/images/woojusm/post/94164f34-69e9-4094-aaee-8f802cca9afb/image.png)  
오케이! 잘 작동한다  
![](https://velog.velcdn.com/images/woojusm/post/c65d8fac-8d11-4b62-aee9-3115c5d2022a/image.png)
그리고 UI업데이트 하는 메소드 작성하고, decode 된 후에 DispatchQueue.main.async로 메인 스레드에서 실행되게 해주면 완성!  

## 에러 처리

![](https://velog.velcdn.com/images/woojusm/post/be8c2660-910c-49f0-a020-f433276e6f26/image.png)
![](https://velog.velcdn.com/images/woojusm/post/c725f278-9bde-46dc-8b62-6caf59fa0bfb/image.png)
어떤 순서가 맞는지 헷갈린다
response 먼저 처리해줘야하려나?  

에러 메시지는 잘 뜨고 있는 걸 확인! 
alert으로 에러 메시지를 띄워주자  
![](https://velog.velcdn.com/images/woojusm/post/7fdff775-c8b5-4473-b04f-35133a86083e/image.png)  
에러메시지를 띄울 alert도 마찬가지로 메인스레드에서 동작해야하므로  
DispatchQueue.main.asyn를 사용!  
![](https://velog.velcdn.com/images/woojusm/post/19401a78-19ac-4a8b-82fd-e53a33669071/image.png)  

