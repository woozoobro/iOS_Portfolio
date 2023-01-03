# TossBenefit


![](https://velog.velcdn.com/images/woojusm/post/9f9572fd-3117-4603-8042-7788eb25fda2/image.gif)

## UI 구성

* 사용자는 포인트를 볼 수 있다.
* 사용자는 오늘의 혜택을 볼 수 있다.
* 사용자는 나머지 혜택 리스트를 볼 수 있다.
* 사용자는 포인트 셀을 눌렀을 때, 포인트 상세뷰로 넘어간다
* 사용자는 혜택관련 셀을 눌렀을 때, 혜택 상세뷰로 넘어간다

![](https://velog.velcdn.com/images/woojusm/post/28fb4c1c-a25c-4616-9453-c3594262bbea/image.png)
모델부터 만들어주자  
타입인스턴스로 생성해줬다!  
![](https://velog.velcdn.com/images/woojusm/post/daee1206-cb0d-422e-a7db-25d18299e9bc/image.png)  
MyPoint도 만들었음!  


![](https://velog.velcdn.com/images/woojusm/post/40aa940d-c67d-4a8e-bf57-3cd566f0ec8e/image.png)
세가지 종류의 셀이 들어갈거임! 그럼 셀도 3개 만들면 된다  

![](https://velog.velcdn.com/images/woojusm/post/d6f161ea-7117-4d4f-9757-d1ce5cf40792/image.png)
typealias로 모델의 타입을 넣고 싶은데 지금 모델이 여러개다  
이럴 때는 Hashable 자체를 넣게되면 Hashable을 준수하는 애들은 다 들어가게 됨  

![](https://velog.velcdn.com/images/woojusm/post/20afdd61-ff62-42f0-96c8-163ecd2a102f/image.png)
근데 이러면 또 피가 나게 된다  
프로토콜 자체로는 못들어온다고 얘기하는 에러  

AnyHashable로 바꿔주면 문제해결!  
![](https://velog.velcdn.com/images/woojusm/post/afe95547-4f0c-4bd2-a503-0089fb940c02/image.png)

```swift
    var todaySectionItems: [AnyHashable] = [포인트, 오늘의 혜택]
    var otherSectionItems: [AnyHashable] = [혜택 나머지 리스트]
```
요런식의 섹션아이템들이 필요하다  
![](https://velog.velcdn.com/images/woojusm/post/3b9171f9-1807-426c-9ca8-3169f28471ad/image.png)
요런 식으로!  
todaySectionItems 안에 있는 요거 두개 또 묶어서 표현 가능할 거 같음  
-> 새로운 모델 만들어보자  
![](https://velog.velcdn.com/images/woojusm/post/2a32b262-32f4-4cd2-bebc-f3af96e41911/image.png)
![](https://velog.velcdn.com/images/woojusm/post/766b084a-4905-4793-a747-d92123e0e751/image.png)  
이렇게!!  
그 다음은 섹션을 만들고 각 섹션의 셀들을 만들어주자  

![](https://velog.velcdn.com/images/woojusm/post/bd642fc2-3a52-48e1-a930-c113c0d2b212/image.png)
indexPath의 section을 쓰고 싶은데 그러려면 enum으로 선언한 섹션이 Int타입이 되어야 한다  
![](https://velog.velcdn.com/images/woojusm/post/c1b5c3e6-e002-4906-8197-351de0315b94/image.png)  
요렇게!!  
이러면 today의 rawValue가 0 , others는 rawValue가 1 이 되겠지  
![](https://velog.velcdn.com/images/woojusm/post/3dd9654b-0845-4755-87d9-9f78415f33b5/image.png)
![](https://velog.velcdn.com/images/woojusm/post/fb667e17-bfa7-48ec-aa83-3683d85662ad/image.png)
저런 configureCell 메소드가 필요할 거 같다  
![](https://velog.velcdn.com/images/woojusm/post/4398a5a0-36e9-434c-b361-447be882561e/image.png)
section과 아이템을 받고, collectionView도 넣을 수 있는!!  
(디큐해야해서 collectionView도 필요함, indexPath도 필요함)


![](https://velog.velcdn.com/images/woojusm/post/7d2aaed7-d9e1-4148-a16a-c675364185f7/image.png)  
오케이!!  
![](https://velog.velcdn.com/images/woojusm/post/acbfc339-46c4-41bc-a285-879a478ace5f/image.png)
cell마다 configure메소드 작성해줬음!! (물론 셀파일 내부에도 작성해주고!!)  

![](https://velog.velcdn.com/images/woojusm/post/cc832734-46c1-4777-8f4d-62dd8e2a55b1/image.png)


![](https://velog.velcdn.com/images/woojusm/post/a7c9e080-e280-4245-be15-db20fe064ceb/image.png)
layout 메소드 작성  

![](https://velog.velcdn.com/images/woojusm/post/29c7e919-c6e4-40cb-923c-767e3e07eabf/image.png)
셀들이 선택되면 다음뷰 띄워줘야하니까 UICollectionViewDelegate 작성!!  


![](https://velog.velcdn.com/images/woojusm/post/cfb7d4f5-7ab7-409f-b744-704be80ba3e5/image.png)  
UI그려주고 configure메소드 내용 작성!  
IBOutlet연결해준 거 업뎃 해주는 걸로  

![](https://velog.velcdn.com/images/woojusm/post/ca7bb67e-53df-4b48-ac0b-210a3dbad96a/image.png)

다른 셀도 마찬가지로 해주고!  

![](https://velog.velcdn.com/images/woojusm/post/0370a3e6-9ac9-4279-b5d1-f35fd467eb81/image.png)

데이터 꽂아주기 완료!!  

___
## 상세뷰 넘어가기  

![](https://velog.velcdn.com/images/woojusm/post/ee4425c8-d709-42b7-9705-467a16cdc2df/image.png)

먼저 포인트를 누르게되면 넘어가게 될 뷰를 준비  

![](https://velog.velcdn.com/images/woojusm/post/e40910ec-df16-4ac1-8e68-71860f5ac8b8/image.png)
dataSource의 아이템들이 여러개 넘어오는데 이 때 선택한 아이템의 인덱스패스로
특정 지어질 때!  
if let 을 통해서 benefit item이 넘어올 때랑 point item이 넘어올 때를 나눠줌  

![](https://velog.velcdn.com/images/woojusm/post/ffb06fb8-6b9d-404d-b265-966f3c9727d8/image.png)  
BenefitVC에서 navigation Push 해주면 뜬다!!  

___
## 코드로 UI그려보기  
```swift
import UIKit

final class BenefitGuideView: UIView {
    
    lazy var icon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var title: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(icon)
        addSubview(title)
        
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            icon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            icon.widthAnchor.constraint(equalToConstant: 30),
            icon.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 20),
            title.centerYAnchor.constraint(equalTo: icon.centerYAnchor),
        ])
    }
}
```
___
![](https://velog.velcdn.com/images/woojusm/post/7d8321e6-3a6a-4a0b-bffe-e9f6af355dee/image.png)
뷰를 추가해주는데 넣을 친구 StackView IBOutlet이 필요하다는 걸 처음 암!  


# 추가 필요
