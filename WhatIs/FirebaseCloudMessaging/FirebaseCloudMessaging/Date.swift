//
//  Date.swift
//  Mandarin2
//
//  Created by 우주형 on 2023/04/04.
//

import Foundation

extension Date {
    
    /// Date를 인스타 느낌의 시간으로 보여주는 function
    func timeAgoDisplay() -> String {
        let now = Date()
        let components = Calendar.current.dateComponents([.minute, .hour, .day], from: self, to: now)
        
        if let days = components.day, days > 0 {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yy.MM.dd"
            return dateFormatter.string(from: self)
        } else if let hours = components.hour, hours > 0 {
            return "\(hours)시간 전"
        } else if let minutes = components.minute, minutes > 0 {
            return "\(minutes)분 전"
        } else {
            return "방금 전"
        }
    }
    
    /// 23.07.10(월) 형식
    func toFullDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy.MM.dd(EEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: self)
    }
    
    /// 07.10(월) 형식
    func toShortDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM.dd(EEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: self)
    }
}
