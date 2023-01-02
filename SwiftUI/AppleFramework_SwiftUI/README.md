# SwiftUI_그리드 구현하기

## UI 구성
swiftUI 파일로 FrameworkCell을 만들어준다  
![](https://velog.velcdn.com/images/woojusm/post/6ab40617-801f-4d67-a528-390cfc1d4813/image.png)

![](https://velog.velcdn.com/images/woojusm/post/23917224-0951-4d4d-8aaa-953dbf018931/image.png)

//.previewLayout(.fixed(width: 160, height: 250))
이거는 안먹힌다... 셀처럼 프리뷰되는걸 보고 싶은데  


### Grid 만들기
- UIKit : UICollectionView
  * Data, Presentation, Layout
- SwiftUI : LazyVGrid, LazyHGrid
  * Data, Presentation, Layout
  
  
![](https://velog.velcdn.com/images/woojusm/post/5bf65943-c8e4-419d-b08b-3a2a466473ce/image.png)  
레이아웃은 세개 들어가니까
GridItem(.flexible()) 3개 만들어줬고  
LazyVGrid로 콜렉션뷰를 그려줄 수 있음

스크롤이 안되니까 ScrollView 넣어주고!  
![](https://velog.velcdn.com/images/woojusm/post/0fa13e7d-6cfb-485e-8427-71b1a8d9ae5b/image.png)
네비게이션 뷰 추가, 네비게이션 타이틀 추가 하면 끝..!

## 그리드 구현시 GridItem을 이용한 레이아웃

```swift
let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
```

UIKit 사용할 땐 layout 구현이 엄청 길었는데 이렇게나 간단하게 구현이 가능하다  
`GridItem(.fixed(70))` 이나 `GridItem(.adaptive(minimum: 120))` 같은 것도 있다!  
