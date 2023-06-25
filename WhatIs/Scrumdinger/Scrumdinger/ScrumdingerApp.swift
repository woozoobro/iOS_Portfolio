//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by 우주형 on 2023/06/22.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
