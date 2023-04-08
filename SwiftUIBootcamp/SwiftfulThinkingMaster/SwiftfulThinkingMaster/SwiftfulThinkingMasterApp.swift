//
//  SwiftfulThinkingMasterApp.swift
//  SwiftfulThinkingMaster
//
//  Created by 우주형 on 2023/03/20.
//

import SwiftUI

@main
struct SwiftfulThinkingMasterApp: App {
    
    let currentUserIsSignedIn: Bool
    
    init() {
//        let userIsSignedIn: Bool = CommandLine.arguments.contains("-UITest_startSignedIn") ? true : false
        let userIsSignedIn: Bool = ProcessInfo.processInfo.arguments.contains("-UITest_startSignedIn") ? true: false
        self.currentUserIsSignedIn = userIsSignedIn
        print("User Is Signed In: \(userIsSignedIn)")
    }
    
    var body: some Scene {
        WindowGroup {
            UITestingBootcampView(currentUserIsSignedIn: currentUserIsSignedIn)
        }
    }
}
