//
//  TimeModel.swift
//  TimerCheck
//
//  Created by 우주형 on 2023/01/05.
//

import Foundation

struct TimeModel: Hashable {
    var id = UUID()
    var seconds = 0
    var minutes = 0
    var hours = 0
    var date = Date()
    
    
    func currentTimetoString(sec: Int, min: Int, hour: Int) -> String {
        if min > 0 {
            return "\(minutes)분 \(seconds)초"
        } else if hour > 0 {
            return "\(hours)시간 \(minutes)분 \(seconds)초"
        } else {
            return "\(seconds)초"
        }
    }
}
