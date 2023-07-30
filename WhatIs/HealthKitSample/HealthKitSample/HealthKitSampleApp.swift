//
//  HealthKitSampleApp.swift
//  HealthKitSample
//
//  Created by 우주형 on 2023/07/29.
//

import SwiftUI

@main
struct HealthKitSampleApp: App {
    @StateObject var manager = HealthManager()
    
    var body: some Scene {
        WindowGroup {
            BeActiveTabView()
                .environmentObject(manager)
        }
    }
}
