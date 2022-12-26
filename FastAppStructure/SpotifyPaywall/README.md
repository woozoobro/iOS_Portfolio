# SpotifyPaywall


## UI 구성

UIColor를 배열로 만들어줬다
```swift
let colors: [UIColor] = [.systemPurple, .systemOrange, .systemPink, .systemRed]
```
다른 특이점은 없다!

## dataSource과 snapshot

전역으로 설정할 때 항상 강제해제 해주나...?!
snpashot에서 appendItems 할 때 toSection 지정 안해주면   
알아서 마지막 섹션에 아이템들 추가된다!

layout 설정할 때 `그룹 사이즈`는 기본 비율 (1)이
디스플레이 될 아이폰의 너비와 높이라고 생각하기!

### cell의 BackgroundColor 설정 해줬다!!
```swift
//전역 상수
let colors: [UIColor] = [.systemPurple, .systemOrange, .systemPink, .systemRed]

// 뷰디드로드 내의 셀 선언 시에 
cell.configure(item)
cell.backgroundColor = self.colors[indexPath.item]
```



## horizontalGroup을 만들었는데 스크롤은 수직으로 된다?!


layout 메소드에서 section의 ScrollBehavior를 설정할 수 있다!
```swift
section.orthogonalScrollingBehavior = .continuous
```

![](https://velog.velcdn.com/images/woojusm/post/49f6d03a-5bab-4070-a068-7b5a9ddb1de6/image.png)

페이징 느낌으로도 바꾸려면 .groupPaging 으로 설정해주면 된다  
.groupPagingCentered로 하게되면 가운데 자동으로 맞춰진다!  
섹션의 interGroupSpacing을 설정해서 그룹간 간격을 넣어주고


## cell 디자인 디테일 
cell파일에서 awakeFromNib으로 둥글기 설정해줬다  
주의할 건 awakeFromNib 메소드 종류가 두개라서  
class가 붙지 않는 메소드로 작성해줘야 한다는거!!

```swift
override func awakeFromNib() {
    super.awakeFromNib()
    self.layer.cornerRadius = 16
}
```
엇 근데 왜 이번엔 contentView로 접근이 안될까?!
self로 cell 자체에다 프로퍼티 값을 조절해줬다.

# Cell에 대해서 

1. UIView class는 backgroundColor라는 프로퍼티를 가지고 있다.

2. UITableViewCell / UICollectionViewCell은 UIView를 상속받고 있다.

3. UITableViewCell / UICollectionViewCell은 backgroundColor프로퍼티에 접근이 가능하다.

4. UITableViewCell / UICollectionViewCell은 contentView라는 프로퍼티를 가지고 있다.
___
## pageControl 업데이트

`section.visibleItemsInvalidationHandler`  
에서 좌표 정보들을 가져올 수 있다!  


```swift
section.visibleItemsInvalidationHandler = { item, offset, env in
    let index = Int((offset.x / env.container.contentSize.width).rounded(.up))
    self.pageControl.currentPage = index
}
```
pageControl.numberOfPages도 맞춰주고!

collectionView가 현재 버티컬로도 스크롤이 되는 것만 막아주면 끝!
```swift
collectionView.alwaysBounceVertical = false
```



![](https://velog.velcdn.com/images/woojusm/post/3a8f559c-9f9e-49cb-b605-02aaf6e697f8/image.png)

제일 앞에 있는 게 contentView 이고!!  
그 뒤가 Cell  
cell의 뒤가 background 이다!!!  




