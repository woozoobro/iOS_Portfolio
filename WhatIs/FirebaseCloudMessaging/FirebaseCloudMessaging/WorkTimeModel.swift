//
//  WorkTimeModel.swift
//  FirebaseCloudMessaging
//
//  Created by 우주형 on 2023/08/09.
//

import Foundation
//MARK: - WorkTime Model
struct WorkTime: Identifiable,Equatable {
    var id = UUID()
    var weekday: String
    var startTime: Date?
    var endTime: Date?
    
    init(id: UUID = UUID(), weekday: String, startTime: Int, endTime: Int) {
        self.id = id
        self.weekday = weekday
        self.startTime = getDateWithCustomHour(hour: startTime)
        self.endTime = getDateWithCustomHour(hour: endTime)
    }
    
    private func getDateWithCustomHour(hour: Int) -> Date {
        Calendar.current.date(from: DateComponents(hour: hour)) ?? Date()
    }
}

extension WorkTime  {
    static let timeList: [WorkTime] = [
        .init(weekday: "일", startTime: 0, endTime: 0),
        .init(weekday: "월", startTime: 0, endTime: 0),
        .init(weekday: "화", startTime: 0, endTime: 0),
        .init(weekday: "수", startTime: 0, endTime: 0),
        .init(weekday: "목", startTime: 0, endTime: 0),
        .init(weekday: "금", startTime: 0, endTime: 0),
        .init(weekday: "토", startTime: 0, endTime: 0),
    ]
    
    static let allDailyTime: [String] = ["아침", "낮", "저녁", "밤"]
}
