//
//  FirebaseAgainApp.swift
//  FirebaseAgain
//
//  Created by 우주형 on 2023/06/11.
//

import SwiftUI
import Firebase

@main
struct FirebaseAgainApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
//            RootView()
            CrashView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
