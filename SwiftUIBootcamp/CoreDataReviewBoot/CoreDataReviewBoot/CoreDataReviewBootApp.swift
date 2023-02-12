//
//  CoreDataReviewBootApp.swift
//  CoreDataReviewBoot
//
//  Created by 우주형 on 2023/02/12.
//

import SwiftUI

@main
struct CoreDataReviewBootApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
