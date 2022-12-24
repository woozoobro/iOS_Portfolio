# KaKaotalk ChatList

## 카톡 채팅 리스트뷰를 똑같이 만들어보자
채팅 리스트 화면 캡쳐해서 아이콘이랑 광고 바 정도만 이미지 따옴!

![](https://velog.velcdn.com/images/woojusm/post/65947fb2-212b-4e06-aa54-4ae3eb2831bf/image.gif)


---
### 💡 새롭게 알게 된 사실
1. 콜렉션뷰는 상위에 다른 뷰로 감싸져 있게 되면 IBOutlet이 먹통이 되는 것 같다.
버티컬 스택뷰로 광고 이미지랑 레이아웃 자동으로 맞추려 했지만 실패...
다시 스택뷰 밖으로 꺼내오고 나니 제대로 작동한다!!

2. UICollectionViewDelegateFlowLayout 구현 시 estimatedSize는 none으로 해줘야 레이아웃을 원하는 만큼 설정할 수 있다!

3. CollectionViewCell 파일에서 awakeFromNib 메소드를 통해 사전 설정이 가능하다! 이번에 설정한 건 이미지 뷰의 둥글기 layer.cornerRadius 였다!

4. 카톡 채팅 리스트를 보다보면 채팅이 긴 경우 ...으로 채팅이 잘리는 경우가 있다!
오토 레이아웃을 잡다보면 이 부분에서 문제가 발생하게 됨!
Content Hugging Priority와 Content Compression Ressistance Priority로 누가 줄어들고 누가 늘어날지 사전에 설정이 가능함!  

5. 날짜 표시 형식 변경해보는 거!

```swift
//현재 chatModel에 저장된 날짜는
// "2022-12-23" 요 형식이다 
// 이걸 Date로 바꾸고 다시 String으로 변환하면 원하는 형식으로 출력 가능!

func formattedDateString(dateString: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    
    if let date = formatter.date(from: dateString) {
        formatter.dateFormat = "M월 d일"
        return formatter.string(from: date)
    } else {
        return ""
    }
}

```

6. 오름차순 해보는거!

챗모델 리스트를 sort함수로 다시 정렬해주면 된다!
```swift
var chatList: [ChatModel] = ChatList.list

//view가 로드 될때
chatList = chatList.sort { $0.date > $1.date }
```
클로져 축약형으로 간단하게 바꿔버림
원래는 이거임
```swift
chatList.sort(by: { date1, date2 in
    return date1.date > date2.date
})
```

7. 시뮬레이터 실행중에 종종 맥북의 와이파이가 끊기는 현상 발생!
시뮬레이터는 자주 꺼주는 걸로...
