//
//  WhatTodoMemoApp.swift
//  WhatTodoMemo
//
//  Created by 우주형 on 2023/01/20.
//

import SwiftUI

@main
struct WhatTodoMemoApp: App {
    
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
