//
//  DisneyLauncScreenApp.swift
//  DisneyLauncScreen
//
//  Created by 우주형 on 2023/03/18.
//

import SwiftUI

@main
struct DisneyLauncScreenApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack  {
                ContentView()
                LaunchView()
            }
        }
    }
}
