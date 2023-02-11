//
//  TimeModel.swift
//  MyGumiTimer
//
//  Created by 우주형 on 2023/01/27.
//

import Foundation

struct TimeModel: Identifiable, Hashable {
    var id = UUID()
    
    let date: Date
    var currentSeconds: Int
    var currentMinutes: Int
    var currentHours: Int
    
    var formattedString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일 hh시 mm분"
        return formatter.string(from: date)
    }
    
    var formattedSectionString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 M월의 기록"
        return formatter.string(from: date)
    }
    
    var timeLabel: String {
        if currentHours > 0 {
            return "\(currentHours)시간 \(currentMinutes)분 \(currentSeconds)초"
        } else if currentHours == 0 && currentMinutes == 0 {
            return "\(currentSeconds)초"
        } else {
            return "\(currentMinutes)분 \(currentSeconds)초"
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
