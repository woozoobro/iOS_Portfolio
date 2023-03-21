//
//  TimerViewModel.swift
//  MandarinTimer2
//
//  Created by 우주형 on 2023/03/18.
//

import Foundation
import Combine

class TimerViewModel: ObservableObject {
    @Published var studyCount: Int = 7200
    @Published var breakCount: Int = 0
    @Published var isStarting = false
    @Published var isFinished = true
    
    @Published var studyTimeModel = TimeModel(fullDate: "", studySeconds: 0, breakSeconds: 0)
    @Published private var timeList: [TimeModel] = []
    @Published var sectionTimeDic: [String : [TimeModel]] = [:]
    @Published var dayTimeDic:[String: [TimeModel]] = [:]
    
    private var timer: AnyCancellable?
    private var breakTimer: AnyCancellable?
    private var cancellables = Set<AnyCancellable>()
    
    var sectionKeys: [String] {
        return sectionTimeDic.keys.sorted(by: { $0 > $1 })
    }
    
    init() {
        //timeList세팅
        addSubscriber()
        timeList = getTimeList()
//        timeList = DeveloperPreview.list
    }
    
    private func addSubscriber() {
        // sectionTimeDic 세팅
        $timeList
//            .subscribe(on: DispatchQueue.global(qos: .background))
//            .receive(on: RunLoop.main)
            .sink { times in
                self.sectionTimeDic = Dictionary(grouping: times, by: {$0.monthlyIdentifier})
                // [SectionKey: [DayKey: [TimeModel]] ]
                
                self.dayTimeDic = Dictionary(grouping: times, by: { $0.dailyIdentifier })
            }
            .store(in: &cancellables)
    }
    
    private func getTimeList() -> [TimeModel] {
        return TimeModelStorage.instance.fetch()
    }
    
//    func getSectionTimeData(key: String) -> [TimeModel] {
//        guard let times = sectionTimeDic[key] else { return []}
//        let groupedByDay = Dictionary(grouping: times, by: { $0.monthlyIdentifier })
//        return groupedByDay.values.map { $0[0]}
//    }
    
    func getSectionTimeData(key: String) -> [TimeModel] {
        let items = sectionTimeDic[key] ?? []
        let orderedItems = items.sorted(by: { $0.fullDate < $1.fullDate })
        return orderedItems
    }
    
    func getDayTimeData(key: String) -> [TimeModel] {
        let items = dayTimeDic[key] ?? []
        let orderedItems = items.sorted(by: { $0.fullDate < $1.fullDate })
        
        return orderedItems
    }
    
    private func setUpTimer() {
        timer = Timer
            .publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink(receiveValue: { _ in
                self.studyCount += 1
            })
    }
    
    private func setBreakTimer() {
        breakTimer = Timer
            .publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink(receiveValue: { _ in
                self.breakCount += 1
                print("\(self.breakCount)")
            })
    }
    
    func startButtonPressed() {
        isStarting.toggle()
        if isStarting {
            setUpTimer()
            if isFinished {
                studyTimeModel.fullDate = Date().dateToString()
                isFinished = false
            }
            breakTimer?.cancel()
        } else {
            timer?.cancel()
            setBreakTimer()
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
        breakTimer?.cancel()
        breakTimer = nil
        studyCount = 0
        breakCount = 0
        isStarting = false
        isFinished = true
        studyTimeModel = TimeModel(fullDate: "", studySeconds: 0, breakSeconds: 0)
    }
    
    func addTime() {
        studyTimeModel.studySeconds = studyCount
        studyTimeModel.breakSeconds = breakCount
        timeList.append(studyTimeModel)
    }
    
    func deleteTime(item: TimeModel) {
        if let index = timeList.firstIndex(where: { $0.id == item.id }) {
            timeList.remove(at: index)
            print("Item Deleted")
            // Storage
            TimeModelStorage.instance.save(timeList)
        }
    }
    
}
