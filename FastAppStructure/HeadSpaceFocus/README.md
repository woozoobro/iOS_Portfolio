# HeadSpaceFocus (DiffableDataSource)


![](https://velog.velcdn.com/images/woojusm/post/3f0c74d2-47df-4cb7-bb8f-b585ec7bfe10/image.gif)

## DiffableDataSource
사용해서 크기가 제각각인 CollectionViewCell을 표현해보자

layout 함수에서 .estimated로 사이즈 변경가능한 셀 보여줄 수 있음  
콘텐츠에 따라서 변경 가능하다! 느낌
```swift
    private func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
```
height를 estimated로 설정해주면 크기가 자유롭게 변한다

compositionalLayout의 사이즈를 생각할 땐 그룹 사이즈 먼저 생각해보고!  
다음에 그룹 사이즈에 맞춰지는 아이템의 사이즈를 고려해보자
___
![](https://velog.velcdn.com/images/woojusm/post/1ab936f7-4c0a-42c0-a3be-7252dad8562f/image.png)

Cell 파일의 Configure 메소드에서 image의 렌더링 모드를 변경해줄 수 있다.
```swift
thumbnailImageView.image = UIImage(systemName: item.imageName)?.withRenderingMode(.alwaysOriginal)
```

그리고 셀의 백그라운드도 콘텐트뷰 속성에 접근해서 변경 가능!  
이 때 실행되는 주기는 awakeFromNib 메소드에서 호출해야 자연스러움  
```swift
override func awakeFromNib() {
    super.awakeFromNib()
    contentView.backgroundColor = UIColor.systemIndigo
    contentView.layer.cornerRadius = 10
}
```
다시 FocusVC로 돌아와서

![](https://velog.velcdn.com/images/woojusm/post/5e1fe659-5af6-4683-8978-e70bd1ddaf88/image.png)
콘텐트 인셋이랑 그룹간 스페이싱을 줬다!

___

## 버튼 이벤트!


버튼 누르면 추천항목만 뜨고, 다시 한 번 누르면 원래대로 돌아오게 만들자.  
버튼 IBOutlet과 IBAction 추가!! (버튼 코너둥글기도 뷰디드로드에서 설정해줌)

curated 라는 Bool타입의 전역변수를 만들고 토글 되게 해보자
![](https://velog.velcdn.com/images/woojusm/post/5e4831dc-93a4-416a-91e6-b873522c19d7/image.png)

![](https://velog.velcdn.com/images/woojusm/post/13728415-994b-415a-9b88-ca70bb6493c1/image.png)

버튼 눌렀을 때 데이터가 업뎃 되어야 하는데
items로 설정했던 전역변수 모델을 다른 데이터로 바꿔치기해준다
그리고 바뀐 데이터가 담긴 snapshot을 만들고 dataSource에 다시 적용해줬다.


