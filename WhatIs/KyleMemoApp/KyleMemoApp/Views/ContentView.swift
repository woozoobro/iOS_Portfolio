//
//  ContentView.swift
//  KyleMemoApp
//
//  Created by 우주형 on 2023/08/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            
            Text("Friends")
                .tabItem {
                    Image(systemName: "person.2.fill")
                }
            
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            Text("Alarm")
                .tabItem {
                    Image(systemName: "bell.fill")
                }
            
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.circle.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
