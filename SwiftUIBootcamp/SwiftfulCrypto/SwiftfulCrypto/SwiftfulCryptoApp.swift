//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by 우주형 on 2023/02/23.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
            .environmentObject(vm)
        }
    }
}
