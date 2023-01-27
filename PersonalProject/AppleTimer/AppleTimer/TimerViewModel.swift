//
//  TimerViewModel.swift
//  AppleTimer
//
//  Created by 우주형 on 2023/01/28.
//

import Foundation

class TimerViewModel: ObservableObject, Identifiable {
    
    @Published var selectedHour = 0
    @Published var selectedMinute = 0
    @Published var selectedSecond = 0
    
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var timerRunning = false
}
