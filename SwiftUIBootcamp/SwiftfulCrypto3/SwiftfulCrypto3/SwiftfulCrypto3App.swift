//
//  SwiftfulCrypto3App.swift
//  SwiftfulCrypto3
//
//  Created by 우주형 on 2023/03/12.
//

import SwiftUI

@main
struct SwiftfulCrypto3App: App {
    @StateObject var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(vm)
        }
    }
}
