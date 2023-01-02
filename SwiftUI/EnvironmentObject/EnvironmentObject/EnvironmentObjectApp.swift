//
//  EnvironmentObjectApp.swift
//  EnvironmentObject
//
//  Created by 우주형 on 2023/01/03.
//

import SwiftUI

@main
struct EnvironmentObjectApp: App {
    
    @StateObject var userProfile = UserProfileSettings()
    
    var body: some Scene {
        WindowGroup {
            FirstView().environmentObject(userProfile)
        }
    }
}
