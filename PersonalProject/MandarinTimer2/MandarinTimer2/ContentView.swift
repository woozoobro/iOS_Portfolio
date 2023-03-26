//
//  ContentView.swift
//  MandarinTimer2
//
//  Created by 우주형 on 2023/03/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                ZStack {
                    Color.orange.opacity(0.14)
                        .ignoresSafeArea()
                    TimerView()
                }
            }
            .tabItem {
                Image(systemName: "timer")
            }
//            .toolbar(.visible, for: .tabBar)
//            .toolbarBackground(Color.orange, for: .tabBar)
            
            NavigationView {
                ZStack {
                    Color.orange.opacity(0.14)
                        .ignoresSafeArea()
                    TimerListView()
                }
            }
            .tabItem {
                Image(systemName: "list.bullet")
            }
            .toolbar(.visible, for: .tabBar)
            .toolbarBackground(Color.orange.opacity(0.1), for: .tabBar)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
                .environmentObject(TimerViewModel())
        }
    }
}
