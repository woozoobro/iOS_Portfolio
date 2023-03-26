//
//  MandarinTimer2App.swift
//  MandarinTimer2
//
//  Created by 우주형 on 2023/03/18.
//

import SwiftUI

@main
struct MandarinTimer2App: App {
    @StateObject var vm = TimerViewModel()
    
//    init() {
//        UITabBar.appearance().backgroundColor = UIColor.orange
//    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
