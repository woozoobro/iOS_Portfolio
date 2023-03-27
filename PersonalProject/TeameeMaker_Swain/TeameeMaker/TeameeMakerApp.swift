//
//  TeameeMakerApp.swift
//  TeameeMaker
//
//  Created by Swain Yun on 2023/03/25.
//

import SwiftUI

@main
struct TeameeMakerApp: App {
    let teameeMakerViewModel = TeameeMakerViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(teameeMakerViewModel)
        }
    }
}
