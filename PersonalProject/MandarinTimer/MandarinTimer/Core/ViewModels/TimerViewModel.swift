//
//  TimerViewModel.swift
//  MandarinTimer
//
//  Created by 우주형 on 2023/02/25.
//

import Foundation
import Combine

class TimerViewModel: ObservableObject {
    @Published var count: Int = 3657
    @Published var isStarting: Bool = false
    @Published private var checkReset: Bool = false
    @Published var timeList: [TimeModel] = []
    @Published var startDate: Date?
    
    init() {
        timeList = [
            TimeModel(startedDate: Date(), passedTime: "Helloo"),
            TimeModel(startedDate: Date(), passedTime: "Helloo"),
            TimeModel(startedDate: Date(), passedTime: "Helloo"),
            TimeModel(startedDate: Date(), passedTime: "Helloo"),
        ]
    }
    
    var timer: AnyCancellable?
    
    func setUpTimer() {
        timer = Timer
            .publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.count += 1
            }
    }
    
    func startButtonPressed() {
        isStarting.toggle()
        if isStarting {
            setUpTimer()
            if !checkReset {
                startDate = Date()
                checkReset = true
            }
        } else {
            timer?.cancel()
        }
    }
    
    func stopButtonPressed() {
        addPassedTime()
        timer?.cancel()
        timer = nil
        startDate = nil
        count = 0
        isStarting = false
        checkReset = false
    }
    
    func addPassedTime() {
        guard let startDate = self.startDate else { return }
        let timeModel = TimeModel(startedDate: startDate, passedTime: countToTimeLabel())
        timeList.append(timeModel)
    }
    
    func countToTimeLabel() -> String {
        if count/3600 == 0 && count/60 == 0 {
            return "\(count)초"
        } else if count/3600 == 0 && count/60 < 60 {
            return "\(count/60)분 \(count%60)초"
        } else {
            return "\(count/3600)시간 \(count%3600/60)분 \(count%3600%60)초"
        }        
    }
    
}
