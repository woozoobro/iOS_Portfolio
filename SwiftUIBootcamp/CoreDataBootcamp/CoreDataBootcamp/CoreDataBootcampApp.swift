//
//  CoreDataBootcampApp.swift
//  CoreDataBootcamp
//
//  Created by 우주형 on 2023/01/25.
//

import SwiftUI

@main
struct CoreDataBootcampApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
