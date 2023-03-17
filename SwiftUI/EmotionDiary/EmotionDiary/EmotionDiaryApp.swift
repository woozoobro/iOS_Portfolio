//
//  EmotionDiaryApp.swift
//  EmotionDiary
//
//  Created by 우주형 on 2023/03/14.
//

import SwiftUI

@main
struct EmotionDiaryApp: App {
    let vm = DiaryListViewModel(storage: MoodDiaryStorage())
    var body: some Scene {
        WindowGroup {
            DiaryListView(vm: vm)            
        }
    }
}
