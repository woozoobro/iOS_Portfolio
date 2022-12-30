# Github Profile Search

![](https://velog.velcdn.com/images/woojusm/post/07a8eff6-76f8-45bb-971d-ebdc6dd6cdec/image.gif)


## UserProfile 모델 만들기

![](https://velog.velcdn.com/images/woojusm/post/987e44ea-1b4e-4545-8174-d7ed2c4fc0a9/image.png)
decodable 준수하지 않앗다고 자꾸 에러 뜬다...
* CodingKey에서 오타가 있었다...
___
   
   `private(set) var user: UserProfile?` 이거 무슨 뜻일지...
```
    // setupUI
    // userprofile
    // bind
    // search control
    // network
```
해야하는 일들 목록. 이거를 구현해줘야겠다  

먼저 imageView 둥글게 만들어줄 건데  
![](https://velog.velcdn.com/images/woojusm/post/780ebd63-1116-48ff-b7b3-d6fbdae58088/image.png)
이미지 뷰 사이즈가 160 * 160이라서 똥그랗게 만드려면 코너를 반만큼 해주면 된다  

bind() 메소드를 만들어줄 건데 유저가 업데이트 되면 ui가 변경되게끔 해줘야한다  

`@Published private(set) var user: UserProfile?` 로 만들어줬다  
`var subscriptions = Set<AnyCancellable>()` 섭스크립션도 만들어주고  

$user로 접근해서 런루프 메인에 올리고 .sink .store 해준다  


![](https://velog.velcdn.com/images/woojusm/post/d6f2e8b3-850b-4a8c-ae96-9b7478c72e4d/image.png)
sink에서 update 해주면 되니까 또 새로운 update 메소드를 팠음!  

이제 서치컨트롤 코드로 넣어주자  
```swift
private func embedSearchControl() {
        self.navigationItem.title = "Search"
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "woozoobro"
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
    }
```
서치results 업데이터와 delegate은 프로토콜이 필요하겠죠    
![](https://velog.velcdn.com/images/woojusm/post/2659fd06-a307-4c98-b043-09c914ee289b/image.png)

### updateUI 해보자
```swift
private func update(_ user: UserProfile?) {
        guard let user = user else {
            self.nameLabel.text = "n/a"
            self.loginLabel.text = "n/a"
            self.followerLabel.text = "n/a"
            self.followingLabel.text = "n/a"
            self.thumbnail.image = UIImage(systemName: "network")
            return
        }
        self.nameLabel.text = user.name
        self.loginLabel.text = user.login
        self.followerLabel.text = "follower: \(user.followers)"
        self.followingLabel.text = "following: \(user.following)"
        self.thumbnail.image = nil // avatar url
    }
```
avatarUrl 로 이미지 세팅해줄거라 우선은 nil로 설정해두자  

___
## SearchButton이 눌렸을 때 네트워크 요청  

![](https://velog.velcdn.com/images/woojusm/post/280a60e2-a92f-4d29-9681-c255ed23d703/image.png)


base 와 path로 나눠 봤다!  
params와 header는 이번에 필요없지만 query 하는 거 대비해서 준비해둠  

```swift
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("button clicked: \(searchBar.text)")
        
        guard let keyword = searchBar.text, !keyword.isEmpty else { return }
          
        let base = "https://api.github.com/"
        let path = "users/\(keyword)"
        let params: [String: String] = [:]
        let header: [String: String] = ["Content-Type":"application/json"]
        
        var urlComponents = URLComponents(string: base + path)!
        let queryItems = params.map { (key: String, value: String) in
            return URLQueryItem(name: key, value: value)
        }
        urlComponents.queryItems = queryItems
        
        var request = URLRequest(url: urlComponents.url!)
        header.forEach { (key: String, value: String) in
            request.addValue(value, forHTTPHeaderField: key)
        }
    }
}
```
urlComponents 로 url을 준비하고
queryItems도 준비하고  
request를 만들면 header도 추가해줄수 있음  
이제 dataTask를 추가해보자  

```swift
URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> Data in
                guard let response = result.response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
                    let response = result.response as? HTTPURLResponse
                    let statusCode = response?.statusCode ?? -1
                    throw NetworkError.responseError(statusCode: statusCode)
                }
                return result.data
            }
            .decode(type: UserProfile.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { completion in
                print("completion: \(completion)")
            } receiveValue: { user in
                self.user = user
            }.store(in: &subscriptions)
```
session을 만들고 dataTaskPublihser
.tryMap으로 생길수 있는 에러도 throw해줌
이 때 리턴은 result의 data 타입으로 맵하고
나온 건 decode 해줍니다
그러면 userProfile이 나올텐데 RunLoop.main에서 작업되게 해주고
sink 메소드로 completion과 받은 value를 다시 user에 넣어주면  
위에서 선언해뒀던 update 함수의 $user를 통해서 ui가 업뎃 되겠습니다  
___
## 에러 처리!  
![](https://velog.velcdn.com/images/woojusm/post/83dfc80c-7d73-4bf9-8fcd-c49cf4f389e6/image.png)
completion은 Result enum 타입이라
 switch case로 .failure 과 .finished 설정 가능  
 
## 이미지 url로 추가하기!

imgae url -> image  

### [Kingfisher](https://github.com/onevcat/Kingfisher) 사용하기~!  
![](https://velog.velcdn.com/images/woojusm/post/5875e94e-222e-46f2-b10b-4347286f1151/image.png)

Exact 버전으로 swiftPackage 설치 해줬음  

![](https://velog.velcdn.com/images/woojusm/post/e41bf9a4-a6b7-49ac-9721-288a2363cba7/image.png)

사용법은 쉽다  
___
## 리팩토링!

![](https://velog.velcdn.com/images/woojusm/post/d70bf63e-0e3a-4ccc-8522-9ae77559d608/image.png)
리소스랑 네트워크로 나눠서 바꿔보자  

네트워크 서비스를 먼저 가져오자  
```swift
enum NetworkError: Error {
    case invalidRequest
    case invalidResponse
    case responseError(statusCode: Int)
    case jsonDecodingError(error: Error)
}

final class NetworkService {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }
    
    func load<T>(_ resource: Resource<T>) -> AnyPublisher<T, Error> {
        guard let request = resource.urlRequest else {
            return .fail(NetworkError.invalidRequest)
        }
        
        return session
            .dataTaskPublisher(for: request)
            .tryMap { result -> Data in
                guard let response = result.response as? HTTPURLResponse,
                      (200..<300).contains(response.statusCode)
                else {
                    let response = result.response as? HTTPURLResponse
                    let statusCode = response?.statusCode ?? -1
                    throw NetworkError.responseError(statusCode: statusCode)
                }
                return result.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
```
NetworkService.swift 요렇게 선언해뒀다  
* .eraseToAnyPublisher() 어떤 의미일까?
___

![](https://velog.velcdn.com/images/woojusm/post/17c90d78-41e1-4606-8caa-61f57540324a/image.png)
Resource랑 NetworkService 구조 익히고 나면
이렇게 깔끔하게 네트워킹 구현이 가능해진다...!!  


