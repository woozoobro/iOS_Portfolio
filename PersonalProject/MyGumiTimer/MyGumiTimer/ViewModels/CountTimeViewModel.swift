//
//  CountTimeViewModel.swift
//  MyGumiTimer
//
//  Created by 우주형 on 2023/01/27.
//

import Foundation

class CountTimeViewModel: ObservableObject {
    @Published var timerRunning = false
    @Published var timeModel = TimeModel()
    
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var timeLabel: String {
        if timeModel.currentHours > 0 {
            return "\(timeModel.currentHours)시간 \(timeModel.currentMinutes)분 \(timeModel.currentSeconds)초"
        } else if timeModel.currentHours == 0 && timeModel.currentMinutes == 0 {
            return "\(timeModel.currentSeconds)초"
        } else {
            return "\(timeModel.currentMinutes)분 \(timeModel.currentSeconds)초"
        }
    }
    
    func currentTimePassed() {
        if timeModel.currentSeconds < 59 {
            timeModel.currentSeconds += 1
        } else {
            timeModel.currentSeconds = 0
            if timeModel.currentMinutes < 59 {
                timeModel.currentMinutes += 1
            } else {
                timeModel.currentHours += 1
                timeModel.currentMinutes = 0
            }
        }
    }
    
    func startButtonPressed() {
        if timerRunning {
            timer.upstream.connect().cancel()
        } else {
            timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        }
        timerRunning.toggle()
        
    }
    
    func stopButtonPressed() {
        timerRunning = false
        timer.upstream.connect().cancel()
        timeModel.currentHours = 0
        timeModel.currentMinutes = 0
        timeModel.currentSeconds = 0
    }
}
