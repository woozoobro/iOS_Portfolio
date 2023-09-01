//
//  ContentView.swift
//  DispatchQueueBasic
//
//  Created by 우주형 on 2023/08/26.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    func task1() {
        DispatchQueue.main.async {
            print("🔵 \(Thread.current)")
            if Thread.isMainThread {
                for i in 1...3 {
                    print("🔵", i)
                }
            }
        }

        if Thread.isMainThread {
            print("🟢 \(Thread.current)")
            for i in 4...6 {
                print("🟢",i)
            }
        }

        DispatchQueue.main.async {
            if Thread.isMainThread {
                print("🔵 \(Thread.current)")
                print("🔵","7")
            }
        }

        DispatchQueue.global().sync {
            print(Thread.current)
            if Thread.isMainThread {
                print("🟠 글로벌 큐로 보내짐")
                print("🟠 \(Thread.current)")
                DispatchQueue.main.async {
                    print("🟠 \(Thread.current)")
                    print("🟠 메인 큐로 이동했고, 메인스레드에서 동작중")
                }
            }
        }
    }
}

struct ContentView: View {
    @StateObject private var vm = ContentViewModel()
    var body: some View {
        Button {
            vm.task1()
        } label: {
            Text("작업 수행")
                .font(.largeTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
