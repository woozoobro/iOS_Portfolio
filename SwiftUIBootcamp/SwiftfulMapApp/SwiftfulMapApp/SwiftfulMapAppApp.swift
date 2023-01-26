//
//  SwiftfulMapAppApp.swift
//  SwiftfulMapApp
//
//  Created by 우주형 on 2023/01/26.
//

import SwiftUI

@main
struct SwiftfulMapAppApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(vm)
        }
    }
}
