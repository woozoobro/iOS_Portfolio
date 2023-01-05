//
//  DiaryViewModel.swift
//  EmotionDiary
//
//  Created by 우주형 on 2023/01/06.
//

import Foundation
import SwiftUI
import Combine


final class DiaryViewModel: ObservableObject {
    
    @Published var diary: MoodDiary = MoodDiary(date: "", text: "", mood: .great)
    
    @Published var date: Date = Date()
    @Published var mood: Mood = .great
    @Published var isPresented: Binding<Bool>
    @Published var text: String = ""
    
    var subscriptions = Set<AnyCancellable>()
    
    init(isPresented: Binding<Bool>) {
        self.isPresented = isPresented
        
        $date.sink { date in
//            print("---> selected: \(date)")
            self.update(date: date)
        }.store(in: &subscriptions)
        
        $mood.sink { mood in
//            print("---> selected: \(mood)")
            self.update(mood: mood)
        }.store(in: &subscriptions)
        
        $text.sink {text in
//            print("---> selected: \(text)")
            self.update(text: text)
        }.store(in: &subscriptions)
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
        guard diary.date.isEmpty == false else { return }
        print("전체 리스트 추가하기")
        // 저장하고
        // 닫고
        isPresented.wrappedValue = false
    }
    
}
