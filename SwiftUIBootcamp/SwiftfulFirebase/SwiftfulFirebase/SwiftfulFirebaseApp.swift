//
//  SwiftfulFirebaseApp.swift
//  SwiftfulFirebase
//
//  Created by 우주형 on 2023/04/04.
//

import SwiftUI
import Firebase

@main
struct SwiftfulFirebaseApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
