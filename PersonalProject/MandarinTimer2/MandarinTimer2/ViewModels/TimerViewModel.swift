//
//  TimerViewModel.swift
//  MandarinTimer2
//
//  Created by 우주형 on 2023/03/18.
//

import Foundation
import Combine

class TimerViewModel: ObservableObject {
    @Published var count: Int = 7200
    @Published var isStarting = false
    @Published var isFinished = true
    
    @Published private var timeList: [TimeModel] = []
    @Published var timeDic: [String : [TimeModel]] = [:]
    
    var timer: AnyCancellable?
    var cancellables = Set<AnyCancellable>()
    
    var sectionKeys: [String] {
        return timeDic.keys.sorted(by: { $0 > $1 })
    }
    
    init() {
        //timeList세팅
        addSubscriber()
        
        timeList = getTimeList()
    }
    
    private func addSubscriber() {
        // timeDic 세팅
        $timeList.sink { times in
            self.timeDic = Dictionary(grouping: times, by: {$0.monthlyIdentifier})
        }
        .store(in: &cancellables)
    }
    
    private func getTimeList() -> [TimeModel] {
        return TimeModelStorage.instance.fetch()
    }
    
    func getTimeData(key: String) -> [TimeModel] {
        let items = timeDic[key] ?? []
        let orderedItems = items.sorted(by: { $0.fullDate < $1.fullDate})
        return orderedItems
    }
    
    private func setUpTimer() {
        timer = Timer
            .publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink(receiveValue: { _ in
                self.count += 1
            })
    }
    
    func startButtonPressed() {
        isStarting.toggle()
        if isStarting {
            setUpTimer()
            isFinished = false
        } else {
            timer?.cancel()
        }
    }
    
    func stopButtonPressed() {
        guard !isFinished else { return }
        addTime()
        resetTimer()
        
        // Storage
        TimeModelStorage.instance.save(timeList)
    }
    
    private func resetTimer() {
        timer?.cancel()
        timer = nil
        count = 0
        isStarting = false
        isFinished = true
    }
    
    func addTime() {
        let newDate = Date()
        let fullDate = newDate.dateToString()
        let newTime = TimeModel(fullDate: fullDate, passedTime: countToTimeLabel())
        timeList.append(newTime)
    }
    
    func deleteTime(item: TimeModel) {
        if let index = timeList.firstIndex(where: { $0.id == item.id }) {
            timeList.remove(at: index)
            print("Item Deleted")
            // Storage
            TimeModelStorage.instance.save(timeList)
        }
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
