//
//  TodoList2App.swift
//  TodoList2
//
//  Created by 우주형 on 2023/02/12.
//

import SwiftUI

@main
struct TodoList2App: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
