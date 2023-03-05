//
//  SwiftfulCrypto2App.swift
//  SwiftfulCrypto2
//
//  Created by 우주형 on 2023/03/05.
//

import SwiftUI

@main
struct SwiftfulCrypto2App: App {
    @StateObject var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
            .environmentObject(vm)
        }
    }
}
