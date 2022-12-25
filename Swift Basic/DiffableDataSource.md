# DiffableDataSource Compositional Layout 개념

## 콜렉션뷰는 필수, 그리고 점점 복잡해지는 디자인들..

### [Data 이슈]
* 기존 구현은 간단하고 유연하다
* 보통 Controller가 데이터를 받아와서, UI에게 변경을 알림
* 점점 복잡한 구현이 생기면서, 기존 방식 사용시 이슈가 생길 때가 있음
* Controller, UI가 들고 있는 데이터 사이에 일치하지 않을 때가 있음
  * 앱에서는 어느 것이 더 맞는 데이터인지 판단하기 어려움

## Single Source of Truth Data의 필요성 증가
* 기존의 구현 방식에서 어떤 데이터(Controller, UI가 각각 데이터를 들고 있음)가 참인지 알기 어려웠다.
* 따라서, 근본적인 문제 해결 방식은 참인 데이터를 한개만 두도록 함
  * -> Single Source of Truth
* 그렇게 제안된 방법이 Diffable Datasource

## Snapshot의 도입
* 한가지 참인 데이터를 관리하는 객체
* IndexPath 쓰지 않고
* 섹션 및 아이템에 대해서 Unique ID를 사용함
  * Unique + Hashable
```swift
// 아이템 구현 예시
struct MyModel: Hashable {
    let identifier = UUID()
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    static func == (lhs: MyModel, rhs: MyModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
```
## Compositional Layout의 등장

![](https://velog.velcdn.com/images/woojusm/post/8e2d0a4d-8f73-4427-b027-152d3c0f5ce0/image.png)

`코드 예시`
```swift
let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), 
                                heightDimension: .absolute(44.0))
let item = NSCollectionLayoutItem(layoutSize: size)
let group = NsCollectionalLayoutGroup.horizontal(layoutSize: size, subItems: [Item])

let section = NSCollectionalLayoutSection(group: group)
let layout = UICollectionViewCompositionalLayout(section: section)
```
# 요약
* 기존 `UICollectionView`에서 Data, Presentation 구현 방법은 에러가 생길 수 있다.

  * As is : `UICollctionViewDataSource`
  * To be : `UICollectionViewDiffableDataSource`
* 기존 `UICollectionView`에서 layout 구현 관련해서 복잡한 구현시, 난이도가 갑자기 올라감
  * As is : `UICollectionViewFlowLayout`
  * To be : `UICollectionViewCompositionalLayout`

# 참고

- [https://developer.apple.com/videos/play/wwdc2019/220/](https://developer.apple.com/videos/play/wwdc2019/220/)
- [https://developer.apple.com/videos/play/wwdc2019/215/](https://developer.apple.com/videos/play/wwdc2019/215/)
