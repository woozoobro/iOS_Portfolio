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
    
    init() {
        let tabBarAppearnce: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearnce.configureWithTransparentBackground()
        UITabBar.appearance().standardAppearance = tabBarAppearnce
//        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearnce
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithTransparentBackground()
//        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
