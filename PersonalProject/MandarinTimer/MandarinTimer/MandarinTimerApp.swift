//
//  MandarinTimerApp.swift
//  MandarinTimer
//
//  Created by 우주형 on 2023/02/25.
//

import SwiftUI

@main
struct MandarinTimerApp: App {
    @StateObject var vm = TimerViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TimerView()
            }
            .environmentObject(vm)
        }
    }
}
