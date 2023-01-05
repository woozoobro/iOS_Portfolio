//
//  DiaryListViewModel.swift
//  EmotionDiary
//
//  Created by 우주형 on 2023/01/05.
//

import Foundation

final class DiaryListViewModel: ObservableObject {
    
    let storage: MoodDiaryStorage
    
    @Published var list: [MoodDiary] = []
    @Published var dic: [String: [MoodDiary]] = [:]
    
    init(storage: MoodDiaryStorage) {
        self.storage = storage
        self.dic = Dictionary(grouping: self.list, by: { $0.monthlyIdentifier})
    }
    
    var keys: [String] {
        return dic.keys.sorted { $0 < $1 }
    }
    
    func fetch() {
        self.list = storage.fetch()
    }
    
}
