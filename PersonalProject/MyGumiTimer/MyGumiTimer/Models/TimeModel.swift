//
//  TimeModel.swift
//  MyGumiTimer
//
//  Created by 우주형 on 2023/01/27.
//

import Foundation

struct TimeModel: Identifiable {
    let id: UUID = UUID()
    
    let date: Date
    var currentSeconds: Int
    var currentMinutes: Int
    var currentHours: Int
    
    var timeLabel: String {
        if currentHours > 0 {
            return "\(currentHours)시간 \(currentMinutes)분 \(currentSeconds)초"
        } else if currentHours == 0 && currentMinutes == 0 {
            return "\(currentSeconds)초"
        } else {
            return "\(currentMinutes)분 \(currentSeconds)초"
        }
    }
}
