## Navigation App

![](https://velog.velcdn.com/images/woojusm/post/c55db1c7-1be9-4be9-aff9-8a98ca7ef4fd/image.gif)


## 섹션 2개! 아이템 두줄!!

```swift
let breathingList: [QuickFocus] = QuickFocus.breathing
let walkingList: [QuickFocus] = QuickFocus.walking
```
섹션 2개 쓸거니까 두개 Item 배열 다 필요!!


![](https://velog.velcdn.com/images/woojusm/post/e7455eec-f8d3-475c-9ffe-1a26d08e1e28/image.png)  

섹션에서 CaseIterable 프로토콜 채택하면 모든 case 가져오는 게 가능해진다  

![](https://velog.velcdn.com/images/woojusm/post/8bc5381c-98a6-410a-8710-59de88c3d120/image.png)  
섹션의 타이틀은 섹션 내부에 title이라는 computed property를 통해  
switch 구문으로 구현하자  

___

![](https://velog.velcdn.com/images/woojusm/post/90ff59d6-fe90-4f85-ba43-00d7bbc568dd/image.png)

snapshot을 적용해줄 건데  
두개의 섹션에 들어갈 아이템들 또한 지정해준다!  

![](https://velog.velcdn.com/images/woojusm/post/38d76d3e-b7a3-4cfc-8112-3d0070df3553/image.png)  
layout은 이렇게 구성해줬다
이러면 두개의 섹션이 같은 레이아웃으로 들어간다

--> 추후에 서로 다른 섹션 레이아웃도 한 번 구현해보자.  
___

입력 이벤트를 받아줄 VC에서 UICollectionViewDelegate로  
새로운VC를 present 해보자  

```swift
extension FocusViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.item]
        
        let sb = UIStoryboard(name: "QuickFocus", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "QuickFocusListViewController") as! QuickFocusListViewController
        present(vc, animated: true)
    }
}
```
## 레이아웃 디테일

![](https://velog.velcdn.com/images/woojusm/post/69e1b0bd-b325-4d1f-b5f0-3c708e94d896/image.png)  

섹션 헤더와 패딩들을 추가해보자  
추가하고 싶은 패딩들이 있다면 항상 더 상위에서 접근하자!  
group이라면 section에서 item이라면 group에서!  

```swift
section.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 20, bottom: 30, trailing: 20)
section.interGroupSpacing = 20
```
```swift
group.interItemSpacing = .fixed(10)
```

### 섹션 헤더!!

스토리보드에서 Collection Reusable View로 헤더를 넣어줄 수 있다!  
cell 만드는 방식이랑 비슷하게 디자인 하면 됨  

그럼 헤더뷰의 custom class도 만들어줘야겠네!  

![](https://velog.velcdn.com/images/woojusm/post/da087439-5e65-41f2-b424-b6d41a583345/image.png)  
스토리보드에서 클래스 연결, 재사용 아이디도 설정해주고  
```swift
class QuickFocusHeaderView: UICollectionReusableView {        
    @IBOutlet weak var titleLabel: UILabel!
    func configure(_ title: String) {
        titleLabel.text = title
    }
}

```

다시 QuickFocusListVC로 돌아와서  

![](https://velog.velcdn.com/images/woojusm/post/c718f914-afdb-4059-be32-ba71c867d448/image.png)  

dataSource에 supplementaryViewProvider를 클로져로 리턴해준다  
cell 디큐할 때랑 비슷한데 요번엔 indexPath로 넘겨지는 게 item이 아니라 Section이다!
indexPath에선 section에도 접근 가능하다는 걸 알게됨  

이제 헤더 추가까지는 완료했다  
하지만 헤더에 대한 레이아웃도 만들어줘야 띄울 수 있음  


![](https://velog.velcdn.com/images/woojusm/post/3239127f-25fd-417b-9505-f85ae3f9b993/image.png)  
레이아웃 메소드에서 header 레이아웃을 구성하고 section에 추가해줬다!  
신기하게 느껴지는 건 boudarySupplementaryItems에서 받는 값이 [header] 배열이라는 거!!  

___

## Navigation Controller  

네비게이션 컨트롤러를 처음의 vc에 임베드해줬다.  
그런데 네비게이션 컨트롤러 쓰려면 present 메소드가 아니라 다른 메소드로 띄워줘야함!!  

```swift
navigationController?.pushViewController(vc, animated: true)
```

처음의 VC에서 다음 VC로 데이터 넘기기?  
![](https://velog.velcdn.com/images/woojusm/post/a1baeff5-c593-4926-bfb3-138c64d2d788/image.png)

![](https://velog.velcdn.com/images/woojusm/post/68fd3baa-127d-45bf-ba7d-aaa2d27b2279/image.png)

네비게이션 아이템의 버튼 색상은 스토리보드에서 틴트컬러 (navigation 꺼) 변경해주면 됨  



