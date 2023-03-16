//
//  DiaryViewModel.swift
//  EmotionDiary
//
//  Created by 우주형 on 2023/03/16.
//

import Foundation
import Combine
import SwiftUI

final class DiaryViewModel: ObservableObject {
    
    @Published var diary: MoodDiary = MoodDiary(date: "", text: "", mood: .great)
    @Published var date: Date = Date()
    @Published var mood: Mood = .okay
    @Published var text: String = ""
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscription()
    }
    
    private func addSubscription() {
        $date.sink { date in
            print("---> selected: \(date)")
            self.update(date: date)
        }
        .store(in: &cancellables)
        
        $mood.sink { mood in
            print("---> selected: \(mood)")
            self.update(mood: mood)
        }
        .store(in: &cancellables)
        
        $text.sink { text in
            print("---> text: \(text)")
            self.update(text: text)
        }
        .store(in: &cancellables)
    }
    
    private func update(date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        self.diary.date = formatter.string(from: date)
    }
    
    private func update(mood: Mood) {
        self.diary.mood = mood
    }
    
    private func update(text: String) {
        self.diary.text = text
    }
    
    func completed() {
        guard !diary.date.isEmpty == true else { return }
        
        
        print("전체 리스트 추가하기")
        
    }
}
