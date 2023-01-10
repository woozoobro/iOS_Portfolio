# 넷플릭스 스타일 영화 추천 앱

* UICollectionView
  * Data / Layout
* UICollectionViewFlowLayout
  * Grid,line-based layout 구현
  * 레이아웃 정보를 동적으로 Custom
* UICollectionViewCompositionalLayout
  * 중첩된 레이아웃 구성하기에 유리!  
* 스토리보드 없이 코드로만 ui 구성해보기
* Snapkit

```swift
let view = UIView()
let square = UIView()

...
square.backgroundColor = .blue
square.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
view.addSubview(square)
square.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
square.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
```
하지만 snapkit을 이용한다면?
```swift
import SnapKit

view.addSubview(square)
square.snp.makeConstraints {
    $0.width.height.equalTo(100)
    $0.center.equalToSuperview()    
}
```
___
## UI 구성

![](https://velog.velcdn.com/images/woojusm/post/fe2b4eca-13ca-49af-bb4e-12546465a258/image.png)
코드만으로 구성할거기 때문에 지워준다  

![](https://velog.velcdn.com/images/woojusm/post/849230ca-a90a-4198-8962-0d5685e0c502/image.png)
마찬가지로 지워준다!  

![](https://velog.velcdn.com/images/woojusm/post/4aa5fe31-40de-480f-af57-b6900fb3af16/image.png)
타겟에 info 에서 storyboard 붙은 애들은 다 지워줘야함 
(총 네개정도 프로퍼티 지운듯. info.plist에서 하나 info에서 2개? Build Settings에서 1개)

![](https://velog.velcdn.com/images/woojusm/post/636b409f-c5dd-4476-aa86-21a1b5f8d8d0/image.png)
HomeVC를 만들고  
![](https://velog.velcdn.com/images/woojusm/post/899ad64f-0913-466d-83e1-39e6ff0b0219/image.png)  
선택영역 지워주고  
```swift
        guard let windowScene = scene as? UIWindowScene else { return }
        self.window = UIWindow(windowScene: windowScene)
        
        let layout = UICollectionViewFlowLayout()
        let homeViewController = HomeViewController(collectionViewLayout: layout)
        let rootNavigationController = UINavigationController(rootViewController: homeViewController)
        
        self.window?.rootViewController = rootNavigationController
        self.window?.makeKeyAndVisible()
```


![](https://velog.velcdn.com/images/woojusm/post/e3a32ceb-042d-4c05-9ad3-5a538e03cbaa/image.png)  
홈VC를 메인으로 구성해줬다  

![](https://velog.velcdn.com/images/woojusm/post/0188ba25-4844-4a4b-be21-70a48f33483b/image.png)

[스냅킷 추가](https://github.com/SnapKit/SnapKit)  

근데 갑자기 에러가 뜨면서 빌드가 안되기 시작  
![](https://velog.velcdn.com/images/woojusm/post/ec3758e8-74f1-483e-97f2-d8aabb8e971f/image.png)  
![](https://velog.velcdn.com/images/woojusm/post/b2501dd7-6d58-441a-9222-2c5ffe822510/image.png)  
폴더 들어가서 Derived Data를 삭제했지만 해결이 안됨🥲  
다시 프로젝트 준비하고 snapkit은 하나만 설치하고,  
storyboard 로 뷰 준비해주는 프로퍼티들 다 지우니까 해결됨!  
___

사전에 테이블구조를 만들어둔
Content.plist를 가지고 왔다  

![](https://velog.velcdn.com/images/woojusm/post/d3f38caf-1cb5-4712-8bdd-abdc52058382/image.png)
Item 0 ~ 5 를 섹션으로
contentItem의 내용들은 item으로 보자  

![](https://velog.velcdn.com/images/woojusm/post/cfa98092-11ba-4f52-ad21-f2ff0de870fe/image.png)

Content.plist를 참고해서 Content 구조체를 선언해줬다  
섹션 같은 경우 enum으로 선언하면 나중에 구분하기 좋음  

그리고 Item의 내용 같은 경우 imageName을 받아서 바로 UIImage로 뿌려주는 것도 좋다!  
(computedProperty)

홈뷰로 돌아와서  

방금 작성한 Content구조체를 배열로 가지는 변수를 선언하고,
메소드로 이 Content배열을 뱉어주는 함수 작성!  
![](https://velog.velcdn.com/images/woojusm/post/bd2a94cc-b387-40c9-b2e5-ed9021b85553/image.png)

이 메소드를 살펴보면 Content.plist의 패스를 선언하고,
data의 형태로 Filemanager로 받은 다음에 이 data를
decoding을 통해서 원하는 형태로 가져오는 걸 볼 수 있다!  

![](https://velog.velcdn.com/images/woojusm/post/977ff805-a7f1-4627-881a-9bbaaf0ab34a/image.png)

viewDidLoad에서 contents를 메소드를 통해서 가지고 와주고  
이제 extension으로 delegate 작성해주자  
![](https://velog.velcdn.com/images/woojusm/post/8510c23f-8238-4d93-a9f4-ca98f1ad401a/image.png)
UICollectionVC를 상속받고 있기 때문에 따로 collectionView.delegate = self 는 필요가 없다  
바로 메소드 작성 가능

현재 작성한 메소드는 Section의 아이템이 몇개일지 설정해주는 메소드!!  
![](https://velog.velcdn.com/images/woojusm/post/0cdbf5f9-d6e5-4b31-a9a6-3184f8d070d5/image.png)
섹션이 몇개일지, 섹션이 선택되면 무엇을 할 것인지, 그리고 셀은 어떤 데이터로 구성될 것인지 작성했다  
새로운 Cell 파일을 만들어보자  
![](https://velog.velcdn.com/images/woojusm/post/788e06df-e54a-4b65-a4b5-c17770b3447d/image.png)  

갑자기 왜 contentView 하는 의문이 들 수 있음  
Cell을 드로잉하는 것에 있어서 기본이 되는 contentView라는 기본 객체가 있다  
contentView를 슈퍼뷰로 보고 이 위에 조금씩 올려야 된다  

![](https://velog.velcdn.com/images/woojusm/post/c5d2703c-a421-4037-847e-a57bd82932e1/image.png)
imageView의 content모드를 설정하고,
contentview에 imageView를 추가해준다  
그리고 imageView에 snapkit으로 constraints를 추가함  

![](https://velog.velcdn.com/images/woojusm/post/f20e0051-07b5-41bc-b6cc-18d4aeeae6b6/image.png)  
그리고 이렇게 만든 cell을 홈뷰의 뷰디드로드에 등록해줬다  


![](https://velog.velcdn.com/images/woojusm/post/96e2ca12-f4ed-44b1-be7d-5de8239b0036/image.png)  
collectionView의 Cell을 섹션별로 구분해줬다  
이 때 받게되는 cell의 데이터는 indexPath.section을 통해서 sectionType별로 접근하고,  
접근한 section에 따라서 다시 안에 들어있는 contentItem을 indexPath.row를 통해 구분해 주고  
cell의 이미지뷰를 해당 데이터의 이미지로 설정!  
이제 섹션별로 헤더(타이틀같은 느낌)을 추가해주자  
![](https://velog.velcdn.com/images/woojusm/post/280b08f5-5f5d-4fd5-a136-b86969190420/image.png)  
새로운 헤더가 될 class를 선언하고 UICollectionReusableView를 상속받게 해줬다  
헤더가 되려면 반드시 해당 클래스를 상속받아야함!  

![](https://velog.velcdn.com/images/woojusm/post/093db695-5fd0-451f-9f76-0f5017be5007/image.png)  

header로 그려질 UILabel을 구성해주고 SNAPKIT을 사용해서 constraints를 구성해줬다  
이제 이 헤더를 collectionView에서 등록해주자  
```swift
collectionView.register(ContentCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ContentCollectionViewHeader")
```
이번엔 forCell이 아니라 forSupplementaryView로!  
![](https://velog.velcdn.com/images/woojusm/post/edc3fd41-32e2-4855-a019-9f7fb0df9902/image.png)  
extension으로 헤더를 넣어주는 메소드 작성!  
![](https://velog.velcdn.com/images/woojusm/post/45150a80-8f97-45f7-a888-0ef6b35b5997/image.png)
___
## 배너 구현하기
잠시 미리보기를 하기 위해서 SwiftUI import해보자  

![](https://velog.velcdn.com/images/woojusm/post/a2ff323b-fecb-4143-b7b7-95a617c5b0fa/image.png)
이렇게하면 SwiftUI개발할 때 처럼 바로 프리뷰가 가능!  
요렇게 UIKit 노스토리보드로 가능하구나!!  

![](https://velog.velcdn.com/images/woojusm/post/239aff89-ecca-4350-b002-71ee05b38450/image.png)
render as 오리지널로 설정!  

레이아웃 컴포지셔널로 구성해보자  
![](https://velog.velcdn.com/images/woojusm/post/8f9ad051-bfd6-47de-88dc-8955c170157b/image.png)
이렇게 구성해줬는데 여태까지 diffable이랑 같이 활용했던 거랑 쪼끔 다른 느낌이다  

___
🤔 반환형태는 다른데 들어가는 값들은 똑같다.. 뭐가 다른 걸까?
![](https://velog.velcdn.com/images/woojusm/post/2161b421-9ac0-4451-ae8f-c0ba2dce745d/image.png)
___

이 레이아웃을 클로져를 이용해서 섹션 별로 다르게 메소드를 하나 파주자  
![](https://velog.velcdn.com/images/woojusm/post/5017b1a3-28da-4ec4-9ac7-66eb0cc49f77/image.png)  
![](https://velog.velcdn.com/images/woojusm/post/547ecdc0-37f1-499c-a766-6d452fa61f99/image.png)  

그런데 지금 layout에 만들었던 헤더가 빠져있었다 추가해주자  

![](https://velog.velcdn.com/images/woojusm/post/ed9d6c25-7675-4282-9158-900875726deb/image.png)  

![](https://velog.velcdn.com/images/woojusm/post/3a735f2e-e6b3-4e0b-b2bc-1229c3c98f08/image.png)

![](https://velog.velcdn.com/images/woojusm/post/99e59be7-b240-4909-bb2b-98dc3edbfbb3/image.png)
임시로 섹션을 collectionView만 오게 해주고  

수치 이상한 것 같아서 수정!

![](https://velog.velcdn.com/images/woojusm/post/1b84b31f-f705-46ca-8c2e-0a03b6b46dae/image.png)


___
배너 구현하다가 너무 옛날 방식인 것 같다는 느낌이 들어서 패스

diffable이랑 스냅샷 마스터할때 차라리 직접 구현해보자  
