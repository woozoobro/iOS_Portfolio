//
//  ContentView.swift
//  MandarinTimer
//
//  Created by 우주형 on 2023/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                TimerView()
            }
            .tabItem {
                Image(systemName: "timer")
            }
            NavigationView {
                TimeListView()
            }
            .tabItem {
                Image(systemName: "list.bullet")
            }
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
