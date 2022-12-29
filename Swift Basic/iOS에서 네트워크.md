# iOS에서 네트워킹 하기

## Intro
* 앞에서 정리한 HTTP 방식으로 네트워크 할 수 있다
* iOS 네트워크 작업을 도와주는 것이 `URLSession`이다

## URLSession
* `URLSession`을 이용해서 서버와 소통
  * `URLSessionConfiguration`
    * `.default`
      * 디스크를 이용한 정보 저장을 하는 configuration
      * 그냥 브라우저 띄울 때
    * `.ephemeral`
      * default 랑 비슷한데, 몇가지 정보들을 저장하지 않음 ( 쿠키, 인증서 등)
      * 브라우저 시크릿 모드라고 생각하면 쉽다
    * `.background`
      * 네트워크를 통해 파일 다운로드 받을 때
      * 앱이 백그라운드에서 돌때도, 다운로드 시켜줄 수 있다
  * `URLSession`
    * configuration을 보고, 세션을 생성
  * URLSessionTask
    * dataTask
    * uploadTask
    * downloadTask
### URLSession 구조도

![](https://velog.velcdn.com/images/woojusm/post/cf8c92d4-1f71-478a-8a78-342dc4c21b4e/image.png) 

## Codable
* swift 객체를 외부 데이터 형태(주로 JSON)로 인코딩, 디코딩 가능하게 해주는 타입
* 네트워크 응답형태로 JSON이 거의 표준으로 사용
* Codable을 이용하면, JSON과 swift 객체간 전환이 매우 쉬움

## URLSession + Combine
* `URLSessionDataTask`에 대해서 publisher 제공
  * 따라서, 비동기 응답에 대한 작업이 더 수월하다
  

### 참고

- [https://developer.apple.com/documentation/foundation/archives_and_serialization/using_json_with_custom_types](https://developer.apple.com/documentation/foundation/archives_and_serialization/using_json_with_custom_types)
- [https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)
- [https://developer.apple.com/documentation/swift/codable](https://developer.apple.com/documentation/swift/codable)
- [https://developer.apple.com/documentation/foundation/urlsession/processing_url_session_data_task_results_with_combine](https://developer.apple.com/documentation/foundation/urlsession/processing_url_session_data_task_results_with_combine)
