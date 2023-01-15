//
//  AppleTimerApp.swift
//  AppleTimer
//
//  Created by 우주형 on 2023/01/15.
//

import SwiftUI

@main
struct AppleTimerApp: App {
    var body: some Scene {
        WindowGroup {
            TimerPickerView(time: Time(hour: 0, minute: 0, second: 0))
        }
    }
}
