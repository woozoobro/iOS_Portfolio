//
//  CountTimeViewModel.swift
//  MyGumiTimer
//
//  Created by 우주형 on 2023/01/27.
//

import Foundation

class CountTimeViewModel: ObservableObject {
    @Published var timerRunning = false
    @Published var timeModel = TimeModel(date: Date(), currentSeconds: 0, currentMinutes: 0, currentHours: 0)
    @Published var timeList: [TimeModel] = []
    @Published var fullyStopChecking: Bool = true
    
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @Published var sectionArray: [String] = []
    
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
        if fullyStopChecking {
            let currentDate = Date()
            timeModel = TimeModel(date: currentDate, currentSeconds: 0, currentMinutes: 0, currentHours: 0)
            fullyStopChecking = false
        }
        
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
        print("Saved Time is \(timeModel.timeLabel) ")
        saveData()
        fullyStopChecking = true
    }
    
    func saveData() {
        timeList.append(timeModel)
        timeModel = TimeModel(date: Date(), currentSeconds: 0, currentMinutes: 0, currentHours: 0)
    }
    
    func createSectionArray() {
        
    }
}
