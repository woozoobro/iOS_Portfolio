# Combine 프로젝트 


## 기존 프로젝트를 Combine으로 바꿔보자


// CollectionView Presentation, Layout 설정 해주는 것
// CollectionView Data 그리는 데 필요한 데이터 설정 해주는 것

configureCollectionView 메소드를 하나 새로 파서  
presentation과 layout 설정을 묶어주자

![](https://velog.velcdn.com/images/woojusm/post/33e9f4ad-c62d-42cd-8070-7138476cbd68/image.png)

snapshot 적용하는 것도 메소드로 빼주기!  
applySectionItems로 빼줬는데 이 메소드는 프로퍼티가 필요함!  
(들어오는 프로퍼티에 따라 바뀌게 될 거니까)

![](https://velog.velcdn.com/images/woojusm/post/ee86f280-6b0d-4182-aceb-cc4d8f579d14/image.png)

이제 bind()로 인풋과 아웃풋을 묶어줘보자  
인풋 이벤트는 아이템이 선택되었을 때가 되겠다  
didSelect 퍼블리셔를 만들어보자 (PassthroughSubject로)

![](https://velog.velcdn.com/images/woojusm/post/953fd0aa-4dfe-46bd-a2e5-7c50c7e52cef/image.png)
요렇게 Combine 준비 살짝쿵 해주고

이제 bind()에 인풋 이벤트를 넣어보자  
값이 들어오게 되면 -> sink 메소드에 있는 로직이 실행될거
주의 할건 클로져라 self 써줘야하고 [unowned self] 도 사용해야함 

```swift
 private func bind() {
        //input
        didSelect
            .receive(on: RunLoop.main)
            .sink {[unowned self] framework in
            let sb = UIStoryboard(name: "Detail", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "FrameworkDetailViewController") as! FrameworkDetailViewController
            vc.framework = framework
            self.present(vc, animated: true)
        }.store(in: &subscriptions)
        
        //output
        
    }
```

그러고 bind의 아웃풋 부분도 마저 작성해주면~!
아웃풋에는 snapshot 구성하는 부분이 들어올거다.  
applySectionItems로 빼놓은 메소드를 실행할 건데  
이때 흘러가는 데이터 흐름이 [AppleFramework]가 되어야 하니까  
기존에 있던 `let list: [AppleFramework] = AppleFramework.list`를  
Published로 선언하자  
```swift
 private func bind() {
        //input
        didSelect
            .receive(on: RunLoop.main)
            .sink {[unowned self] framework in
            let sb = UIStoryboard(name: "Detail", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "FrameworkDetailViewController") as! FrameworkDetailViewController
            vc.framework = framework
            self.present(vc, animated: true)
        }.store(in: &subscriptions)
        
        //output
        $list
            .receive(on: RunLoop.main)
            .sink { [unowned self] items in
                self.applySectionItems(items)
            }.store(in: &subscriptions)
    }
```

여기서 한단계 더 가볼 수 있는데  
지금 Published로 선언한 퍼블리셔를 CurrentValueSubject로 바꿀 수 있을 것 같다  

`let items = CurrentValueSubject<[AppleFramework], Never>(AppleFramework.list)`

요렇게 바꿔주면 된다!  
___
## DetailViewController Combine으로

마찬가지로 input과 output을 함께 담아낼 bind() 메소드를 만들어주자

여기서 input은 learnMoreTapped 이니까  
```swift
// Combine
    let learnMoreTapped = PassthroughSubject<AppleFramework, Never>()
    var subscriptions = Set<AnyCancellable>()
    @Published var framework: AppleFramework = AppleFramework(name: "Unknown", imageName: "", urlString: "", description: "")
```

```swift
    private func bind() {
        //input
        learnMoreTapped
            .receive(on: RunLoop.main)
            .compactMap { URL(string: $0.urlString) }
            .sink { [unowned self] url in
                let safari = SFSafariViewController(url: url)
                safari.modalPresentationStyle = .popover
                self.present(safari, animated: true)
            }.store(in: &subscriptions)
        
        //output
        $framework
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
                self.imageView.image = UIImage(named: framework.imageName)
                self.titleLabel.text = framework.name
                self.descriptionLabel.text = framework.description
            }.store(in: &subscriptions)
    }
```
지금 Published로 framework를 내보냈는데
이것도 CurrentValueSubject로 바꿔보자  

그리고 앞의 원래 VC에서 framework 넘겨주는 것도 바꿔줘야함  
근데 CurrentValueSubject라 .send로 넘겨주면 끝!  

