//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by 우주형 on 2023/01/12.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
