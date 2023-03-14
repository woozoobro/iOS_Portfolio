//
//  MoodDiary.swift
//  EmotionDiary
//
//  Created by 우주형 on 2023/03/14.
//

import Foundation

struct MoodDiary: Identifiable, Codable {
    var id: UUID = UUID()
    var date: String
    var text: String
    var mood: Mood
}

extension MoodDiary {
    private var dateComponent: DateComponents {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let formattedDate = formatter.date(from: self.date)
        
        let calendar = Calendar(identifier: .gregorian)
        let dc = calendar.dateComponents([.year, .month], from: formattedDate!)
        return dc
    }
    
    var monthlyIdentifier: String {
        return "\(dateComponent.year ?? 0)-\(dateComponent.month ?? 0)"
    }
}

extension MoodDiary {
    static let list: [MoodDiary] = [
        MoodDiary(date: "2022-04-01 00:01:01", text: "My Diary", mood: .good),
        MoodDiary(date: "2022-04-03 00:01:01", text: "My Diary", mood: .great),
        MoodDiary(date: "2022-04-05 00:01:01", text: "My Diary", mood: .great),
        MoodDiary(date: "2022-04-10 00:01:01", text: "My Diary", mood: .great),
        MoodDiary(date: "2022-04-11 00:01:01", text: "My Diary", mood: .great),
        MoodDiary(date: "2022-04-12 00:01:01", text: "My Diary", mood: .great),
        MoodDiary(date: "2022-04-13 00:01:01", text: "My Diary", mood: .good),
        MoodDiary(date: "2022-04-14 00:01:01", text: "My Diary", mood: .good),
        MoodDiary(date: "2022-04-15 00:01:01", text: "My Diary", mood: .good),
        MoodDiary(date: "2022-04-16 00:01:01", text: "My Diary", mood: .good),
        
        MoodDiary(date: "2022-05-01 00:01:01", text: "My Diary", mood: .good),
        MoodDiary(date: "2022-05-03 00:01:01", text: "My Diary", mood: .good),
        MoodDiary(date: "2022-05-05 00:01:01", text: "My Diary", mood: .good),
        MoodDiary(date: "2022-05-15 00:01:01", text: "My Diary", mood: .good),
        
        MoodDiary(date: "2022-06-01 00:01:01", text: "My Diary", mood: .bad),
        MoodDiary(date: "2022-06-03 00:01:01", text: "My Diary", mood: .bad),
        MoodDiary(date: "2022-06-05 00:01:01", text: "My Diary", mood: .notGreat),
        MoodDiary(date: "2022-06-15 00:01:01", text: "My Diary", mood: .notGreat),
        MoodDiary(date: "2022-06-16 00:01:01", text: "My Diary", mood: .notGreat),
        MoodDiary(date: "2022-06-17 00:01:01", text: "My Diary", mood: .notGreat),
        MoodDiary(date: "2022-06-18 00:01:01", text: "My Diary", mood: .good),
        MoodDiary(date: "2022-06-19 00:01:01", text: "My Diary", mood: .good),
        MoodDiary(date: "2022-06-20 00:01:01", text: "My Diary", mood: .good),
        MoodDiary(date: "2022-06-21 00:01:01", text: "My Diary", mood: .good),
        
        MoodDiary(date: "2022-07-01 00:01:01", text: "My Diary", mood: .great),
        MoodDiary(date: "2022-07-03 00:01:01", text: "My Diary", mood: .great),
        MoodDiary(date: "2022-07-05 00:01:01", text: "My Diary", mood: .great),
        MoodDiary(date: "2022-07-15 00:01:01", text: "My Diary", mood: .great),
    ]
}
