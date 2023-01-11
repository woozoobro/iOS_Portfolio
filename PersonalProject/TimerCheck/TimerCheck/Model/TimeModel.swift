//
//  TimeModel.swift
//  TimerCheck
//
//  Created by 우주형 on 2023/01/05.
//

import Foundation

struct TimeModel {
    var secondsPassed = 0
    var minutesPassed = 0
    var houresPassed = 0
    var date = Date()
    
    func currentTimetoString(sec: Int, min: Int, hour: Int) -> String {
        if min > 0 {
            return "\(minutesPassed)분 \(secondsPassed)초"
        } else if hour > 0 {
            return "\(houresPassed)시간 \(minutesPassed)분 \(secondsPassed)초"
        } else {
            return "\(secondsPassed)초"
        }
    }
}
