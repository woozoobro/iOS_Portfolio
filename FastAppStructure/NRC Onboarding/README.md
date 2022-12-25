# 페이징 뷰 구성해보기

![](https://velog.velcdn.com/images/woojusm/post/4589c6f5-3019-4dd9-9d58-a4d843bcea2c/image.gif)


## UI구성

이미지 뷰 먼저 백그라운드로 넣어주고  

페이지컨트롤 넣고 버튼도 넣고 콜렉션뷰도 넣음
![](https://velog.velcdn.com/images/woojusm/post/b929edcc-eeff-4e51-9dc3-ab910f0a31d1/image.png)

---

## 페이징 방향 바꿔주기

![](https://velog.velcdn.com/images/woojusm/post/c1741c38-7612-4e1d-a27b-4be083966976/image.png)
인스펙터에서 바꿀 수 있다! Scroll Direction 바꿔줬음   

그리고 페이징도 enable 시켜주기!!

콜렉션뷰는 최소 아이템 간의 간격이 디폴트로 10이 설정되어 있음  
인스펙터에서 바꿔줘도 되지만 여태까지 해왔던 것처럼  
delegateFlowLayout에서 코드 작성해주자!!  

```swift
extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {        
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}
```
CGFloat에서 0 이랑 .zero는 같은 의미
___

## 페이징 컨트롤 업데이트!
먼저 pageControl IBOutlet연결해주기
pageControl.numberOfPages 로 페이지 몇개 할 건지 설정

### 콜렉션뷰는 사실 스크롤뷰의 속성을 가지고 있다. 이걸 이용해보자

UIScrollViewDelegate 를 채택!

```swift
extension OnboardingViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
    }
}
```
스크롤뷰가 스크롤 될 때 좌표를 출력해볼 수 있음
이 좌표의 x값을 콜렉션뷰 bounds의 width로 나누면 페이징 되는 페이지를 가지고 올 수 있게된다  

```swift
extension OnboardingViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let scrollPage = Int(scrollView.contentOffset.x / self.collectionView.bounds.width)
        pageControl.currentPage = scrollPage
    }
}
```
이 스크롤이 호출되는 시점만 가속이 끝났을 때  
-> 페이지컨트롤의 현재페이지를 업데이트 해주면 끝!!
