//
//  NavigationStockViewApp.swift
//  NavigationStockView
//
//  Created by 우주형 on 2023/01/02.
//

import SwiftUI

@main
struct NavigationStockViewApp: App {
    var body: some Scene {
        WindowGroup {
            StockRankView()
                .preferredColorScheme(.dark)
        }
    }
}
