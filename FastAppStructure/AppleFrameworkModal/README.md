# Apple Framework ( Modal )

![](https://velog.velcdn.com/images/woojusm/post/15e85fd5-e1d3-416a-8db9-d53680016c75/image.gif)



## 아이템을 누르면 상세뷰가 나오게!!

한 스토리보드 안에 여러개의 스토리보드를 두다 보면 협업 시에  
충돌 발생 가능성이 있다.  

새로운 스토리보드를 만들어보자  
뷰 컨트롤러도 연결!  

CollectionView의 Delegate  
didSelectItemAt에서 이제 새로운 뷰를 띄워보자  

```swift
extension FrameworkListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = list[indexPath.item]        
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FrameworkDetailViewController") as! FrameworkDetailViewController
        present(vc, animated: true)        
    }
}

```
새로 만들어준 storyboard 를 넣어주고,
instantiateViewController로 새로운 vc도 만들어준다!  
강제 캐스팅도 했음!!  
마무리로 present 메소드를 호출하면 새로운 뷰 띄우기 성공!!  

FrameworkDetailVC에 필요한 요소들 마련해주고 초기 AppleFramework 모델은  
Unknown의 형태로 선언한다 -> 이전VC에서 데이터를 받아서 넘겨주자  


![](https://velog.velcdn.com/images/woojusm/post/2ebc8e83-b1a6-4892-81b2-82f019ac2c14/image.png)


![](https://velog.velcdn.com/images/woojusm/post/eb0da3b6-c770-40de-b434-971c76bcbe74/image.png)
현재는 pageSheet 형태인데 필요하다면  
modalPresentationStyle = .fullScreen으로 변경 가능  
___

## Safari 뷰컨트롤러로 띄워보자

```swift
import SafariServices
```

프레임워크 추가


![](https://velog.velcdn.com/images/woojusm/post/9581c449-15a8-440c-86c0-079673d0dc9a/image.png)
`present(safari, animated: true)`   
작성하게되면 safariVC가 이제 띄워진다!!
