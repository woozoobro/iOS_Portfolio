//
//  DiaryListViewModel.swift
//  EmotionDiary
//
//  Created by 우주형 on 2023/03/15.
//

import Foundation
import Combine

final class DiaryListViewModel: ObservableObject {
    
    let storage: MoodDiaryStorage
    
    @Published var list: [MoodDiary] = []
    @Published var dic: [String: [MoodDiary]] = [:]
    
    var cancellables = Set<AnyCancellable>()
    // 데이터 파일에서 일기 리스트 가져오기
    // list에 해당 일기 객체들 세팅
    // list 세팅 되면, dic도 세팅하기
    
    init(storage: MoodDiaryStorage) {
        self.storage = storage
        bind()
        //self.dic = Dictionary(grouping: list, by: { $0.monthlyIdentifier })
    }
    
    var keys: [String] {
        return dic.keys.sorted { $0 > $1 }
    }
    
    private func bind() {
        $list.sink { items in
            self.dic = Dictionary(grouping: items, by: { $0.monthlyIdentifier })
            self.persist(items: items)
        }
        .store(in: &cancellables)
    }
    
    func persist(items: [MoodDiary]) {
        guard !items.isEmpty else { return }
        self.storage.persist(items)
    }
    
    func fetch() {
        self.list = storage.fetch()
    }
}
