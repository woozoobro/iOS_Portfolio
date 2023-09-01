//
//  ContentView.swift
//  BindingForEachTest
//
//  Created by 우주형 on 2023/08/21.
//

import SwiftUI

struct Fruit: Identifiable {
    let id = UUID().uuidString
    let name: String
}

extension Fruit {
    static var list: [Fruit] = [
        Fruit(name: "사과"),
        Fruit(name: "감자"),
        Fruit(name: "바나나"),
        Fruit(name: "수박"),
        Fruit(name: "귤"),
        Fruit(name: "오렌지"),
        Fruit(name: "포도"),
        Fruit(name: "복숭아"),
        Fruit(name: "자몽"),
        Fruit(name: "키위"),
        Fruit(name: "사과"),
        Fruit(name: "감자"),
        Fruit(name: "바나나"),
        Fruit(name: "수박"),
        Fruit(name: "귤"),
        Fruit(name: "오렌지"),
        Fruit(name: "포도"),
        Fruit(name: "복숭아"),
        Fruit(name: "자몽"),
        Fruit(name: "키위"),
        Fruit(name: "수박"),
        Fruit(name: "귤"),
        Fruit(name: "오렌지"),
        Fruit(name: "포도"),
        Fruit(name: "복숭아"),
        Fruit(name: "자몽"),
        Fruit(name: "키위"),
        Fruit(name: "사과"),
        Fruit(name: "감자"),
        Fruit(name: "바나나"),
        Fruit(name: "수박"),
        Fruit(name: "귤"),
        Fruit(name: "오렌지"),
        Fruit(name: "포도"),
        Fruit(name: "복숭아"),
        Fruit(name: "자몽"),
        Fruit(name: "키위"),
    ]
    
    static var newList: [Fruit] = [
        Fruit(name: "감자"),
        Fruit(name: "복숭아"),
        Fruit(name: "자몽"),
        Fruit(name: "키위"),
        Fruit(name: "사과"),
        Fruit(name: "바나나"),
        Fruit(name: "감자"),
        Fruit(name: "복숭아"),
        Fruit(name: "자몽"),
        Fruit(name: "키위"),
        Fruit(name: "사과"),
        Fruit(name: "바나나"),
        Fruit(name: "감자"),
        Fruit(name: "복숭아"),
        Fruit(name: "자몽"),
        Fruit(name: "키위"),
        Fruit(name: "사과"),
        Fruit(name: "바나나"),
        Fruit(name: "감자"),
        Fruit(name: "복숭아"),
        Fruit(name: "자몽"),
        Fruit(name: "키위"),
        Fruit(name: "사과"),
        Fruit(name: "바나나"),
        Fruit(name: "감자"),
        Fruit(name: "복숭아"),
        Fruit(name: "자몽"),
        Fruit(name: "키위"),
        Fruit(name: "사과"),
        Fruit(name: "바나나"),
        Fruit(name: "감자"),
        Fruit(name: "복숭아"),
        Fruit(name: "자몽"),
        Fruit(name: "키위"),
        Fruit(name: "사과"),
        Fruit(name: "바나나"),
        
    ]
}

@MainActor
class ContentViewModel: ObservableObject {
    @Published var fruits: [Fruit] = []
    
    func reload() async {
        fruits = []
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        fruits = Fruit.newList
    }
}

struct ContentView: View {
    @StateObject private var vm = ContentViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach($vm.fruits) { $fruit in
                    BindingView(fruit: $fruit)
                }
            }
        }
        .refreshable {
            await vm.reload()
        }
    }
}

struct BindingView: View {
    @Binding var fruit: Fruit
    var body: some View {
        Text(fruit.name)
            .font(.largeTitle)
            .task {
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                print("테스크 실행, 과일이름은: \(fruit.name)")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
