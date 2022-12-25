# iOS에서 앱내 하단 탭바 이해하기

## 💡 필수 구현 스킬중 하나

- 사용하시는 대부분의 유명한 앱에는 하단에 탭바가 있다.  
- iOS 앱을 처음 개발할때, 탭바구조를 자주 가져간다.  


## 💡 TabBarController 언제 사용해야 할까?

- 앱에서 더 많은 뷰를 보여주고 싶은 욕구  
    - 예) 부동산으로 치면, 정해진 면적에 아파트 올리는것(탭바 사용) vs. 전원 주택 올리는것 (탭바 미사용)  
- 따라서 슈퍼앱의 기본 조건 TabBarController 임  
    - 예) 부동산으로 치면, 각 탭별로 101동, 102동, 103동  

## 💡어떻게 구현하나요?

- 그럼 어떻게 iOS 에서는 탭바를 구현하나요?
- `UITabbarController` 를 이용함
- `UITabbarController` 은 여러 뷰컨트롤러들을 세팅할수 있음
    - `setViewControllers()` 메소드를 이용해서 코드로 설정가능
    - `viewControllers` 프로퍼티로 확인 가능
- `selectedIndex` 를 통해서 어떤 뷰컨트롤러를 선택되었는지 확인가능
- 각 Tab Bar Item 는 `UITabBarItem`으로 구성됨
    - 각 뷰컨트롤러에서 `image`, `title` 프로퍼티 설정해줌

## 💡 UITabBarController 구현하기

- 코드, 스토리보드 둘다 구현 가능
- 결론적으로, `UITabBarController`  를 구조 만들때는  `viewControllers` 구성만 잘 해주면됨 💪


# 참조

- [https://developer.apple.com/documentation/uikit/uitabbarcontroller](https://developer.apple.com/documentation/uikit/uitabbarcontroller)
---

# Insta SearchView
![](https://velog.velcdn.com/images/woojusm/post/216e1978-f62c-4acc-96df-c90566f63bc9/image.gif)


## UICollectionView Again
콜렉션뷰 필요한 요소들 작성

그런데 콜렉션뷰 레이아웃이 제대로 안 나옴
![](https://velog.velcdn.com/images/woojusm/post/f71f559f-86ac-4451-9cc5-cfcc55b73995/image.png)

![](https://velog.velcdn.com/images/woojusm/post/d7047f6b-7297-4cad-bef9-2d3dbdde2778/image.png)
원했던 건 아이템들 간의 스페이싱이 1이었는데  
인터페이스 상에 최소 스페이싱이 10으로 설정 되어 있었음!
코드로 수정하자

![](https://velog.velcdn.com/images/woojusm/post/23192ee4-064e-40a8-895b-cf3e3168ddd4/image.png)

```swift
extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interItemSpacing: CGFloat = 1
        
        let width: CGFloat = (collectionView.bounds.width - interItemSpacing * 2) / 3
        let height = width
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
```

---
## TabBarController

스토리보드에서 임베드로 탭바컨트롤 넣어줌  

뷰컨트롤러 추가하고 탭바컨트롤에서 우클 드래그로 이은 다음에  
viewControllers연결하면 연동됨!


![](https://velog.velcdn.com/images/woojusm/post/ae1422a8-e409-4db2-84d1-bb9f628a220b/image.png)
바 아이템 수정 가능

그리고 이미지의 틴트 값은 탭바컨트롤러에서 바꿔준다! (Image Tint)

___
## Navigation Controller(Search)

네비게이션 컨트롤을 임베드 해서 구현한다  
이때 임베드해준 컨트롤러는 처음 만든 SearchVC
그리고 SearchVC에서 뷰가 로드 되었을 때

```swift
self.navigationItem.title = "Search"
let searchController = UISearchController(searchResultsController: nil)
searchController.hidesNavigationBarDuringPresentation = false
searchController.searchBar.placeholder = "Search"
searchController.searchResultsUpdater = self
self.navigationItem.searchController = searchController
```
네비게이션 타이틀 정해주고  
hidesNavigationBar 가 트루이면 Search 타이핑하려고 할 때  
네비게이션바가 사라진다! false면 반대겠죠!!
서치바 placeholder 설정해주고  
서치 리절트 업데이터 자신으로 설정하면  
-> UISearchResultsUpdating 프로토콜 채택해줘야함
마무리로 navigationItem의 서치컨트롤러를 방금 만든 애로 넣어주면 끝!
![](https://velog.velcdn.com/images/woojusm/post/f8fadb07-dc46-45ec-8e5e-683d4a2c8275/image.png)




___

### 탭바에서 UILabel을 다른 컨트롤러로 복사해서 넘길 때 autoLayout이 안잡히는 현상?

![](https://velog.velcdn.com/images/woojusm/post/e4f99558-fc52-47ee-83d4-54cad05c39c0/image.png)
복붙시 Layout 항목에 Autoresizing Mask로 변경되서 그럼!
Inferred로 변경해주면 된다

___
## 홈 탭 인스타처럼 만들어보기

오토레이아웃 설정하고 기본 UI준비
필요한 코코아 터치클래스 만들어주고!

HomeCell 클래스에서 
```swift
override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImage.image = nil
    }
```
재사용할 때 이미지 초기화 해주는 거 작성했어용
super.prepareForReuse() 작성하는 거 잊지말기!

### awakeFromNib() vs prepareForReuse()

닙에서 처음 깨어날 때 vs 재사용하기 전에
의 차이다.

고정적인 디자인들 같은 거  
예를들면 이미지의 코너래디우스?! 이런건 awakeFromNib으로  
나머지는 prepareForReuse로!

---

마무리로 이미지뷰에 스토리보드에서 aspectFill로 변경하면 끝!
