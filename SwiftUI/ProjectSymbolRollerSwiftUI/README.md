# SwiftUI SymbolRoller

## UI구성

![](https://velog.velcdn.com/images/woojusm/post/146409f6-0583-40c6-a2cf-b126003193af/image.png)

필요한 이미지 이름들이될 String들을 symbols 배열로 선언  
image들이 선택되면 바뀔예정이라 @State로 imageName을 선언해준다  
선택된 이미지에 대한 상태를 가지고 있는 진짜 데이터!  
![](https://velog.velcdn.com/images/woojusm/post/9401446f-c7db-4797-9095-086ca871f504/image.png)
버튼안에 담기는 내용도 마찬가지로 만들 수 있다.
HStack으로 묶고 image 뷰 하나, Vstack으로 텍스트 두개를 구성하면 저런 모양이 된다  


![](https://velog.velcdn.com/images/woojusm/post/31e3bb38-a80b-4f02-8e49-0e874efc0aa1/image.png)
지금 보면 .foregroundColor로 색을 변경해줬는데  
공통으로 표현될 친구들은 다 같이 묶어서 표현 가능!  

![](https://velog.velcdn.com/images/woojusm/post/71c27bf5-00c1-4274-9a12-81e2c52e3ec2/image.png)
요렇게!!  

![](https://velog.velcdn.com/images/woojusm/post/9059911d-4297-4867-87d2-363dddbb081c/image.png)
버튼이 클릭될때 새로운 ImageName을 넣어주게 되면 ui가 변경된다!  

이대로 실행하면 잘 바뀌긴 하는데 ui위치들이 image크기에 따라서 계속해서 움직인다  
고정해보자  
![](https://velog.velcdn.com/images/woojusm/post/56815709-055f-4918-938a-76cff27f1329/image.png)  
이미지 상하로 Spacer()를 넣어줬다!  

