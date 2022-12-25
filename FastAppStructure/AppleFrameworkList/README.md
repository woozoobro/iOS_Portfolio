# AppleFramework List

![](https://velog.velcdn.com/images/woojusm/post/875dacfa-6cc6-4daa-b1d7-379e7fdf75b3/image.gif)


## UICollectionViewDelegateFlowLayout
![](https://velog.velcdn.com/images/woojusm/post/b0ad8303-233f-4442-8a1b-9c347c3d91a0/image.png)

그리드 내의 아이템에 대한 사이즈와 레이아웃을 담당하는 프로토콜!

```swift
extension FrameworkListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interItemSpacing: CGFloat = 10
        let padding: CGFloat = 16
        let width = (collectionView.bounds.width - interItemSpacing * 2 - padding * 2) / 3
        let height = width * 1.5
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
```
![](https://velog.velcdn.com/images/woojusm/post/65ba27b4-8295-4ce5-9455-dd8e479e80b1/image.png)
![](https://velog.velcdn.com/images/woojusm/post/25510d67-5940-48f8-a9f9-49c3e1a165f2/image.png)

# !주의 할 것!
```swift
if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
```
지금처럼 코드나 인터페이스빌더에서 estimatedItemSize none으로 설정해줘야
원하는 방향대로 레이아웃 수정 가능

---
## 구현하면서 생겼던 이슈


![](https://velog.velcdn.com/images/woojusm/post/e049fb3d-cd40-4ccf-a811-111b11ade6d7/image.png)

콜렉션뷰 기초적인 베이스들 다 만들고 시뮬 돌릴라니까 계속 에러가 떴다...  

![](https://velog.velcdn.com/images/woojusm/post/3088915d-c766-46b5-a985-8af18fcbd4fb/image.png)  

콜렉션뷰 셀의 모듈이 설정 되어 있지 않다면 내부의 IBOutlet을 읽을 수 없다는 걸 알게 됨
___
## 네비게이션 컨트롤러

![](https://velog.velcdn.com/images/woojusm/post/cf979b2c-56a3-46ab-84da-1b409b828acf/image.png)

네비게이션 컨트롤러는 개미지옥 탈출하기 위해서 많이 쓰이는데
이번에는 상단에 타이틀 넣어주려고 임베드 했다! 뷰 로드 될때

```swift
navigationController?.navigationBar.topItem?.title = "안녕 디지몬"
```
요렇게 타이틀 추가 가능!  

___

### 레이아웃 디테일들


```swift
collectionView.contentInset = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
```
콘텐트인셋으로 패딩을 줄 수가 있다.

![](https://velog.velcdn.com/images/woojusm/post/09ee617f-80e2-40c0-b5df-3640fb7c717d/image.png)


## 셀들이 선택되었을 때 이벤트

```swift
extension FrameworkListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = list[indexPath.item]
        print(">>> \(framework.name)")
    }
}
```
UICollectionViewDelegate 프로토콜 채택!디드셀렉트아템엣~!


### 4줄로 만드니까 글자 짤릴때

delegate flow layout에서 아이템당 수치만 잘 조절하면 몇줄이든 만들 수 있다.
4줄로 만들었을 때 앱 제목이 안보이는 현상이 발생!


![](https://velog.velcdn.com/images/woojusm/post/33adf071-6ba6-4d53-bcb8-a54d926bca55/image.png)  

셀이 깨어날 때 폰트 조정해줬다.
