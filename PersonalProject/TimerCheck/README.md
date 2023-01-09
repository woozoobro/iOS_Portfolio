# 타이머 만들기

## UI 구성

우선은 Label과 버튼으로 이루어진 간단한 구성!!  
@추후에는 UIImage도 추가하고, 시간의 흐름을 나타낼 수 있는 디자인을 주도록 하자  
![](https://velog.velcdn.com/images/woojusm/post/788d9603-5ba6-4e43-9284-8490a849064a/image.png)

![](https://velog.velcdn.com/images/woojusm/post/4f850ce6-757e-4609-b81c-52ef09d1866b/image.png)  
시간 경과를 담아둘 초 를 secondsPassed 로 선언해주고
Timer 클래스를 옵셔널로 선언해줬다!  
___
여기서 잠깐!  
swift에서는 `Timer`와 `DispatchSourceTimer` 타이머를 만들 수 있는 두개의 클래스가 있다. 이 둘은 몇가지 차이점이 있는데  
* `Timer`는 고수준, 객체지향의 Foundation framework 중 하나.
사용하기 쉽고 편리하면서, task를 특정한 시간이나 시간 간격마다 수행할 수 있다.
대부분의 경우 이 `Timer`클래스를 사용하자!! 
* `DispatchSourceTimer`는 저수준의 Dispatch framework 이다.
`DispatchSource`클래스를 베이스로 하고, 더 많은 컨트롤이 가능하지만 `Timer`보다는 복잡함!  
___
시작 버튼이 눌리면 timer에 스케쥴 타이머를 넣어주고 
클로져에서 원하는 로직이 실행되게 해줬다  
timer.invalidate은 버튼을 두번 누르게되면 타이머가 여러개 생성되서  
임시로 invalidate시킨 후에 다시 timer를 생성해주는 걸로...  

### Timer 클래스는 background Thread에서 동작한다  
따라서 UI update와 관련된 task를 수행하려면 메인 스레드에서 동작하게 해야함.
DispatchQueue.main.async { } 부분이 되겠죠

___
## time 시 분 초 표시하기!!

![](https://velog.velcdn.com/images/woojusm/post/56bdfd4b-6fd8-4422-9adb-2f6592d642d8/image.png)
뭔가.. 하드코딩인 거 같은 느낌...
어떻게 하면 더 깔끔하게 작성이 가능할까?
현재 작성한건 시, 분, 초를 전역변수로 선언하고 초가 60이 된다면 분이 += 1  
분이 60이 된다면 시가 += 1 로 해줬다  
콤바인으로 수정하면 뭔가 더 깔끔해질 거 같기도..  나중에 해보자


## ~~LongPressGesture 추가~~

![](https://velog.velcdn.com/images/woojusm/post/fbd7cca7-4792-4197-85bb-f947cbc6cae7/image.png)

button에다 longPressGesture를 추가해줬다  
그리고 timeStart를 메소드로 빼서 objc func에 넣어줌  

근데 넣었다가 빼줌...
먼가 직관적이지가 않은 것 같아서  

## 애니메이션 추가

CAAnimation을 이용해서 ui들에 animation을 넣어볼까 고민을 하다가  
나중에 캐릭터 애니메이션을 넣어줄 걸 고려해서 그냥 로티 추가하는 걸로 결정했다  

![](https://velog.velcdn.com/images/woojusm/post/d0e543dc-19dc-406b-8de3-43ec8833c0bb/image.png)  

![](https://velog.velcdn.com/images/woojusm/post/5aeeab0e-c643-437f-b982-9dbbef2d2261/image.png)
오케이! 추가 완료  

## 일시정지와 멈춤!
```swift
    enum TimeStatus {
        case start
        case pause
        case end
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        switch timeStatus {
        case .end:
            timeStatus = .start
            animationView.play()
            timeStart()
        case .start:
            timeStatus = .pause
            timer.invalidate()
            animationView.stop()
        case .pause:
            timeStatus = .start
            timeStart()
            animationView.play()
        }
    }
```
TimeStatus enum을 만들고 startButton이 눌렸을 때 timeStatus에 따라서 분기 처리를 해줬음 button의 타이틀도 바꿔주면 좋을 거 같다 

그런데 막상 버튼의 타이틀을 변경하니 글씨크기가 바뀌는 현상이 발생..!
![](https://velog.velcdn.com/images/woojusm/post/2905a29e-70bd-4cd3-b40d-4954e59a094c/image.gif)
![](https://velog.velcdn.com/images/woojusm/post/d4b6a2fb-0095-458c-b210-4d6cc8278ce2/image.png)  
방법을 찾았다..!!

AttributedTitle로 NSString을 넣어줌..

[애플질문참고](https://developer.apple.com/forums/thread/699812)

메소드로 따로빼줬다

![](https://velog.velcdn.com/images/woojusm/post/a4d4b672-2445-4f02-ba35-b160dcf45acb/image.png)
나중에 디자인할 때 font만 임포트해주면 되겠다!!  

## 다시 롱프레스 추가 🤣

롱프레스 추가해서 꾹누르면 종료가 되게 만들어줬다!

![](https://velog.velcdn.com/images/woojusm/post/60bca677-9d20-47ea-8773-667abee8e6cc/image.gif)
움하하하하~
오늘은 여기까지!
___


