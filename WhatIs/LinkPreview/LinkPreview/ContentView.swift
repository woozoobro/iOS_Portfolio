//
//  ContentView.swift
//  LinkPreview
//
//  Created by 우주형 on 2023/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "house")
                }
            Text("두번째탭")
                .tabItem {
                    Image(systemName: "xmark")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
