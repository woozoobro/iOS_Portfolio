//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by 우주형 on 2023/06/22.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()
    //@State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums) {
                Task {
                    do {
                        try await store.save(scrums: store.scrums)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .task {
                do {
                    try await store.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}
