//
//  AppleTimerApp.swift
//  AppleTimer
//
//  Created by 우주형 on 2023/01/15.
//

import SwiftUI

@main
struct AppleTimerApp: App {
    
    @StateObject var vm = TimerViewModel()
    
    var body: some Scene {
        WindowGroup {
            TimerView()
                .environmentObject(vm)
        }
    }
}
