//
//  ContentView.swift
//  EnvironmentVersusObserved
//
//  Created by 우주형 on 2023/07/02.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Int = 1
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            TabView(selection: $selection) {
                EnvironmentObjectView()
                .tag(1)
                .tabItem {
                    Image(systemName: "person")
                }
                
                Text("Observed")
                    .tag(2)
                    .tabItem {
                        Image(systemName: "house")
                    }
            }
        }
    }
}



struct EnvironmentObjectView: View {
    @StateObject private var vm = EnvironmentObjectViewModel()
    var body: some View {
        NavigationStack(path: $vm.stackPath) {
            VStack(spacing: 30) {
                Text("Environment")
                Circle()
                    .fill(.white)
                    .frame(width: 200, height: 250)
                    .shadow(color: Color.black.opacity(0.9), radius: 7)
                    .shadow(color: Color.black.opacity(0.5), radius: 5)
                    .shadow(color: Color.black.opacity(0.3), radius: 3)
                    .shadow(color: Color.black.opacity(0.1), radius: 1)
                
                ForEach(vm.fruits, id: \.self) { fruit in
                    NavigationLink(value: fruit) {
                        Text(fruit)
                    }
                }
                
                Button("Go deep") {
                    vm.stackPath.append(contentsOf: vm.stackPath)
                }
            }
            .navigationDestination(for: String.self) { newValue in
                Text("\(newValue)")
            }
        }
        .environmentObject(vm)
    }
}

final class EnvironmentObjectViewModel: ObservableObject {
    let fruits = ["Apple", "Orange", "Banana"]
    @Published var stackPath: [String] = []
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ContentView()
        }
    }
}
