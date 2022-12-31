# MVVM 리팩토링_2
## 폴더 정리부터  
![](https://velog.velcdn.com/images/woojusm/post/ed77d8df-3551-49ab-a56f-5b708d0590bb/image.png)

## 데이터 옮기기
![](https://velog.velcdn.com/images/woojusm/post/22718cb8-58ff-44d9-abb2-57a0bac2cb91/image.png)

코멘트 아웃되어 있는 부분 뷰모델로 옮겨주자

그리고 network 리퀘스트 해주는 부분(Resource와 load 부분)도 따로 메소드로 파주면 될 거 같다  
![](https://velog.velcdn.com/images/woojusm/post/01fef78f-0609-4589-8f0c-753b311b0c14/image.png)
그리고 로직들도 다 옮겨주자  
![](https://velog.velcdn.com/images/woojusm/post/e7ad73ef-8835-43d1-b640-0ddd4ffb932b/image.png)  

보면 네트워크가 필요한 걸 알 수 있음  
SearchViewController에서 빼와주면 좋겠죠  

`let network = NetworkService(configuration: .default)`  
![](https://velog.velcdn.com/images/woojusm/post/5e6bfe30-5786-4366-bab5-afd38d0c920e/image.png)
init될 때 받을 수 있게 해주고  

그럼 viewModel만 init 해주면 끝  
![](https://velog.velcdn.com/images/woojusm/post/6ac11a2f-2cc7-4960-b361-12b101cb6203/image.png)

## 조금 더 개선해보자 
![](https://velog.velcdn.com/images/woojusm/post/9d8aa645-d3f8-4566-864b-6162e156d95c/image.png)

지금 업데이트 될 때 들어가는 데이터 조차도 viewModel. 으로 들어가면 좋을 거 같다  
![](https://velog.velcdn.com/images/woojusm/post/d55b5911-2313-427a-b8f2-ee4607ac116c/image.png)

요런 형태로!  

![](https://velog.velcdn.com/images/woojusm/post/58c9892d-4b78-49b3-9654-0e7b536bebbb/image.png)  
![](https://velog.velcdn.com/images/woojusm/post/c707358c-c97b-4df0-be8d-de74018c25c5/image.png)
요부분을 바꿔줘야할 거 같다  

여러번 반복해서 구조화하는 걸 연습해보자  

