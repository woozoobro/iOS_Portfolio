# MVVM 리팩토링 해보기_1

## 폴더 구조 정리부터!
![](https://velog.velcdn.com/images/woojusm/post/09a26bb4-df8e-4e97-82b1-79e1399ed53c/image.png)

모델과 뷰를 나눠줬다  
이제 뷰에 있는 친구들은 모델을 가지고 있으면 안된다!!  
![](https://velog.velcdn.com/images/woojusm/post/1ad2c374-815c-48c2-ad0b-7b4c2408b3ec/image.png)
새로운 뷰모델 클래스?! 를 만들어줌  
![](https://velog.velcdn.com/images/woojusm/post/ef4f7bba-c3be-48ef-bc7b-e1d1715a7e24/image.png)
하나씩 이식해가자  
![](https://velog.velcdn.com/images/woojusm/post/f3baf2ad-21a6-43d8-84c7-4b71057225bf/image.png)
init 될때 items에 담을 수 있게 만들어줌  
![](https://velog.velcdn.com/images/woojusm/post/56cf5fed-9bc7-44fc-bdef-91b4295dbf4c/image.png)  
viewModel에 옮겨보자  

![](https://velog.velcdn.com/images/woojusm/post/5bfc9749-ddb9-4e4c-81ab-89a906c3c7f6/image.png)  
`var viewModel: FrameworkListViewModel!` 만들어주고  
뷰디드로드에서 static으로 선언된 아이템을 넘겨준다  

![](https://velog.velcdn.com/images/woojusm/post/b5ffc1ca-e1c1-4cec-81e2-03500b69dce5/image.png)    
![](https://velog.velcdn.com/images/woojusm/post/3fcb865d-3673-402a-9222-8a884ee30549/image.png)

___
## DetailViewController 리팩토링  
![](https://velog.velcdn.com/images/woojusm/post/ab629ef3-a59f-40e1-a8fd-736a757ddae2/image.png)  

FramworkDetailVC가 가지고 있던 모델들을 가지고 온다!!  
여기선 framework로 선언되었던 퍼블리셔들 옮겨주자  

그리고나면 input 이벤트에 필요한 함수들 선언해주고  
bind에서 처리되는 것도 viewModel에 들어있는 애들이 처리될 수 있게 해주면 끝!  


