//
//  TimerData.swift
//  AppleTimer
//
//  Created by 우주형 on 2023/01/18.
//

import Foundation

struct TimeData: Identifiable, Hashable {
    let id: UUID = UUID()
    let value: Int
    let unit: String    
}
