import Foundation

/*
print("현재 메인스레드인가요?")

if Thread.isMainThread {
    print("네 메인스레드에서 동작중입니다")
    print("🧵",Thread.current)
} else {
    print("아니요 메인스레드 아님!")
}

print("-------")

print("🟢 🧵",Thread.current)
DispatchQueue.main.async {
    if Thread.isMainThread {
        // 메인큐로 작업 예약할 거고, 이 작업이 완료되길 기다리지 않겠음
        for _ in 0...100 {print("🟢 메인 큐에 예약된 작업 실행")}
    }
}

//DispatchQueue.main.async {
//    if Thread.isMainThread {
//        // 메인큐로 작업 예약할 거고, 이 작업이 완료되길 기다리지 않겠음
//        for _ in 0...1000 { print("🟩 메인 큐에 예약된 작업 실행") }
//    }
//}

print("🙋🏻 메인큐로 보내진 작업이랑 지금 프린트랑 어떤 게 먼저 실행될까..?")

print("-------")
print("🧵","\(Thread.current)")
DispatchQueue.global().async {
    print("🔵 🧵","\(Thread.current)")
    if !Thread.isMainThread {
        print("🔵 현재 메인 스레드 아님 백그라운드 스레드에서 실행 중")
    }
    
    DispatchQueue.global().sync {
        print("🟦 🧵","\(Thread.current)")
        for _ in 0...1000 {print("🟦 async 코드 실행")}
    }
    
    DispatchQueue.main.async {
        print("✅ 🧵","\(Thread.current)")
        for _ in 0...1000 {print("✅ a싱크 코드 실행")}
        print("----------> a싱크 코드 종료")
    }
    
    DispatchQueue.main.sync {
        print("🟩 🧵","\(Thread.current)")
        for _ in 0...1000 {print("🟩 싱크 코드 실행")}
        print("----------> 싱크 코드 종료")
    }
    
    print("\(Thread.current)")
    print("---> 글로벌큐")
}

print("🙋🏻 글로벌큐로 보내진 작업이랑 지금 프린트랑 어떤 게 먼저 실행될까..?")
*/


