
![](https://velog.velcdn.com/images/woojusm/post/0b21aff6-2b7b-43ff-b331-87913b8dbe99/image.gif)


___
## SPM으로 패키지 설치

[깃헙링크](https://github.com/adamrushy/OpenAISwift)


[API Key 생성](https://platform.openai.com/account/api-keys)

API 키를 생성해준다  

## 뷰모델 만들기

import OpenAISwift 한 담에
ViewModel 구성해줌  

이때 setup메소드에서 authToken에 생성한 api Key 넣어주면 된다!!  

![](https://velog.velcdn.com/images/woojusm/post/55f6a2ff-3152-4b40-8c62-e875a01ea994/image.png)

그리고 send 메소드 작성해준다!  
![](https://velog.velcdn.com/images/woojusm/post/9982d6c0-4327-44c3-a362-f18436bd1a83/image.png)  


뷰를 이제 구성해봅시다  

![](https://velog.velcdn.com/images/woojusm/post/1c4a7125-f2ed-4423-9ebe-6a7e1dea5561/image.png)  
models는 chatgpt와 내가 응답하는 텍스트들이 될거고  

.onAppear일 때 viewModel의 setup 메소드를 호출해줌  

![](https://velog.velcdn.com/images/woojusm/post/4e6c221b-c6a9-47c6-a55d-6c83ece6d3bd/image.png)  
그리고 Button의 Send 액션을 따로 빼서 구성해주는데  
보통 textField 체크할 때 !text.isEmpty 써줬잖음  
스페이스바로 띄우는 것까지 체크해주는 게 
`!text.trimmingCharacters(in: .whitespaces).isEmpty` 이다!!

> 🤔 지식이 늘었군

![](https://velog.velcdn.com/images/woojusm/post/7480459c-c001-4efb-b77a-253df96b5164/image.png)  


끝입니다! ㅋㅋㅋ

되게 간단하다


