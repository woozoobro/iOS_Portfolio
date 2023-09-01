import Foundation
import PlaygroundSupport

///// Playground에서 Concurrency 지원 가능하게 해주는 코드
///// 보통은 Playground 최상위 코드가 끝나면서 실행이 종료되기 마련인데
///// 지금처럼 세팅할 경우 Thread와 Callback까지도 실행될 시간이 주어지게 됨!
//PlaygroundPage.current.needsIndefiniteExecution = true
//
//class CustomThread {
//    func createThread() {
//        let thread: Thread = Thread(target: self, selector: #selector(threadSelector), object: nil)
//
//        thread.start()
//    }
//
//    @objc func threadSelector() {
//        print("커스텀 스레드 동작 중")
//    }
//}
//
//let customThread = CustomThread()
//customThread.createThread()

var counter = 0

DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    for i in 1...3 {
        counter = i
        print("\(counter)")
    }
}

for i in 4...6 {
    counter = i
    print("\(counter)")
}

DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    counter = 9
    print(counter)
}
