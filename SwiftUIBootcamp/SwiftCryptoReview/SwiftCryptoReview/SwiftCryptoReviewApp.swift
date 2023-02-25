//
//  SwiftCryptoReviewApp.swift
//  SwiftCryptoReview
//
//  Created by 우주형 on 2023/02/25.
//

import SwiftUI

@main
struct SwiftCryptoReviewApp: App {
    @StateObject var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }.environmentObject(vm)
        }
    }
}
