//
//  MemoTwiceApp.swift
//  MemoTwice
//
//  Created by 우주형 on 2023/01/25.
//

import SwiftUI

@main
struct MemoTwiceApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
