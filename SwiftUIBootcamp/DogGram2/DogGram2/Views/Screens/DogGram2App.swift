//
//  DogGram2App.swift
//  DogGram2
//
//  Created by 우주형 on 2023/02/12.
//

import SwiftUI
import Firebase

@main
struct DogGram2App: App {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

//MARK: - If using App Delegate
//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication,
//                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        FirebaseApp.configure()
//
//        return true
//    }
//}
