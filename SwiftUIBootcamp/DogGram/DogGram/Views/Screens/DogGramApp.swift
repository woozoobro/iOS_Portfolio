//
//  DogGramApp.swift
//  DogGram
//
//  Created by 우주형 on 2023/01/31.
//

import SwiftUI
import FirebaseCore
//import GoogleSignIn

@main
struct DogGramApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
//                .onOpenURL { url in
//                    GIDSignIn.sharedInstance.handle(url) // for google Sign In
//                }
        }
    }
}
