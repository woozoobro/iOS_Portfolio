import Foundation

//print("🟢 🧵", Thread.current)
//DispatchQueue.main.async {
//    if Thread.isMainThread {
//        // 메인큐로 작업 예약할거고, 이 작업이 완료되기를 기다리지 않겠다
//        for _ in 0...1000 {print("🟢 메인 큐에 예약된 작업 실행") }
//    }
//}
//
//DispatchQueue.main.async {
//    if Thread.isMainThread {
//        // 메인큐로 작업 예약할거고, 이 작업이 완료되기를 기다리지 않겠다
//        for _ in 0...1000 {print("🟩 메인 큐에 예약된 작업 실행") }
//    }
//}
//
//print("🙋🏻 메인큐로 보내진 작업이랑 지금 현재 프린트랑 어떤게 먼저 실행될까...?")

//print("-------")
//
//print("🧵", Thread.current)
//DispatchQueue.global().async {
//    print("🔵 🧵", Thread.current)
//
//    DispatchQueue.main.async {
//        print("✅ 🧵", Thread.current)
//        for _ in 0...1000 { print("✅ async 코드 실행") }
//    }
//
//    DispatchQueue.main.sync {
//        print("🟩 🧵", Thread.current)
//        for _ in 0...1000 { print("🟩 sync 코드 실행") }
//    }
//
//    print("---> 글로벌큐")
//}
//
//print("🙋🏻 글로벌큐로 보내진 작업이랑 지금 현재 프린트랑 어떤게 먼저 실행될까...?")


//DispatchQueue.main.sync {
//    print("메인큐로 싱크 보내기...")
//}
//
//print("앞에 보낸거 다음에 실행될겨")


