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
                TimerView()
            }
            .tabItem {
                Image(systemName: "timer")
            }
            
            NavigationView {
                TimerListView()
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
