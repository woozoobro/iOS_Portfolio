//
//  ContentView.swift
//  MyGumiTimer
//
//  Created by 우주형 on 2023/02/05.
//

import SwiftUI

struct ContentView: View {
    @State var selection: Int = 0
    @StateObject private var vm = CountTimeViewModel()
    
    var body: some View {
        TabView(selection: $selection) {
            CountTimeView(vm: vm)
                .tabItem {
                    Image(systemName: "timer")
                }.tag(0)
            
            TimeListView(vm: vm)
                .tabItem {
                    Image(systemName: "list.bullet.rectangle")
                }.tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
