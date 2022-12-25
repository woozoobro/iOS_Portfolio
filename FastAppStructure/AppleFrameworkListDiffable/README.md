# DiffableDatasource

** Presentation, Data, Layout**
`diffable datasource`
  * presentation 
`snapshot`
  * Data
  
`compositional Layout`
* layout

![](https://velog.velcdn.com/images/woojusm/post/d3ffa754-a06b-492b-9a7b-86a5b24ae04c/image.png)

이걸 이해하려면 알아야되는 개념들이 여럿 있다! 선언할 때 필요한 개념들.
Generic 꺽쇠 타입에 대해서 알아야하고,
Hashable이 어떤 의미인지 알아야한다.

___
## Generic

타입 상관없이 받겠다는 거



---
## Hashable
Hashing 가능하게 해주는 프로토콜
구분 가능하다!
각각의 객체들이 구분자를 해싱을 통해 만들 수 있는데
탐색이 좀 더 유리해진다!

---

# 다시 DiffableDataSource로 돌아와서

```swift
enum Section { case main }
typealias Item = AppleFramework
var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
```
전역변수로 dataSource를 선언해준다.

UICollectionViewDiffableDataSource는 두 가지의 Generic 타입을 가지는데
Section과 Item을 넣어줄거다! 이 두가지 타입은 Hashable이란 프로토콜을 준수해야함.

Section은 enum으로 선언해주고! Item은 우리가 넣어줄 data인데 여기선 AppleFramework 모델이 되겠다! typalias로 Item이라는 이름이 사용 가능하도록 해준다!

그.리.고.

이제 뷰가 로드 되었을 때 dataSource를 작성해줘보자  

```swift
dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else { return nil }
    cell.configure(item)
    return cell
})

var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
snapshot.appendSections([.main])
snapshot.appendItems(list, toSection: .main)
dataSource.apply(snapshot)
```
점점 손에 익는다.
snapshot도 만들어줬는데 스냅샷은 말그대로 스냅샷임
사진 찍는 느낌으로 필요한 요소들 준비해두는거! 찰칵!!

그리고 collectionView의 layout도 만들어줘야한다. 뷰디드로드 안에 레이아웃을 적용시켜주고  
실제 레이아웃을 뱉어내는 함수는 밖에서 준비한다.
``` swift
override func viewDidLoad() {
    collectionView.collectionViewLayout = layout()
}

private func layout() -> UICollectionViewCompositionalLayout() {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalWidth(1))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.46))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 3)
    let section = NSCollectionLayoutSection(group: group)
    section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 16, bottom: 16, trailing: 0)
    let layout = UICollectionViewCompositionalLayout(section: section)
    return layout
}
```

처음엔 어렵기만 했지만
차근차근 작성하다보니 어떤 뉘앙스인지 알것 같다.

## UICollectionViewCompositionalLayout
![](https://velog.velcdn.com/images/woojusm/post/75511e62-06f4-478e-8a51-ed1d92a0a33c/image.png)

Flexible한 콜렉션뷰 레이아웃임.
작성은 아래에서부터 위로 조금씩 올라오면 된다

필요한 요소들이 자동완성이 되기 때문에!!
제일 마지막 결과물인 UICollectionViewCompositionalLayout이 리턴되게 해주자

이 때 NSCollectionLayout을 사용해 그룹 사이즈나 아이템 사이즈를 결정해주게 되는데
.fractional이라는 말은 분수의 형태임
그룹의 사이즈를 정하고 싶다 -> collectionView의 사이즈의 얼마만큼을 쓸건지 분수로 표현!  
아이템의 사이즈를 정하고 싶다 -> 그룹의 사이즈에서 얼마만큼 쓸건지 분수로 표현!!  

끝입니다
![](https://velog.velcdn.com/images/woojusm/post/60937c7c-68f7-424c-a987-5fa2be720d99/image.png)  
(결과물은 똑같음)

___
## 정리
* 기존에 쓰던 DataSource보다 이점은 데이터의 변화를 바로바로 알아챌 수 있다는거!
(Hashable이란 프로토콜을 준수하므로 탐색 속도가 빠르다!)
* 원래라면 reloadData()로 새로 고침해줬어야했는데 안해도 되고 / 
사용자의 ux 경험도 개선 가능하다! diffableDatasource는 자연스러운 애니메이션이 스르륵 들어감
