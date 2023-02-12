//
//  TodoList3App.swift
//  TodoList3
//
//  Created by 우주형 on 2023/02/12.
//

import SwiftUI

@main
struct TodoList3App: App {
    
    @StateObject var vm = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(vm)
        }
    }
}
