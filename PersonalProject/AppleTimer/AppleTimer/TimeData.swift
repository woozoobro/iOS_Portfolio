//
//  TimerData.swift
//  AppleTimer
//
//  Created by 우주형 on 2023/01/18.
//

import Foundation

struct TimeData: Identifiable, Hashable {
    var id: UUID = UUID()
    var value: Int
    var unit: String
}
