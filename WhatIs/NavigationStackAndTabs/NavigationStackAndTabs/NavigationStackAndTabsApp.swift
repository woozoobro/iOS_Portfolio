//
//  NavigationStackAndTabsApp.swift
//  NavigationStackAndTabs
//
//  Created by 우주형 on 2023/07/15.
//

import SwiftUI

@main
struct NavigationStackAndTabsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(NavigationPathFinder.shared)
        }
    }
}
