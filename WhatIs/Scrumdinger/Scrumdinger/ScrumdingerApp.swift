//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by 우주형 on 2023/06/22.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
