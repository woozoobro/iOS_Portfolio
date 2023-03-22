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
    
    private var timer: AnyCancellable?
    private var breakTimer: AnyCancellable?
    private var cancellables = Set<AnyCancellable>()
    
    var sectionKeys: [String] {
        return sectionTimeDic.keys.sorted(by: { $0 > $1 })
    }
    
    init() {
        //timeList세팅
        addSubscriber()
        getTimeList()
//        timeList = DeveloperPreview.list
    }
    
    private func addSubscriber() {
        // sectionTimeDic 세팅
        $timeList
//            .subscribe(on: DispatchQueue.global(qos: .background))
//            .receive(on: RunLoop.main)
            .sink { times in
                self.sectionTimeDic = Dictionary(grouping: times, by: {$0.monthlyIdentifier})
            }
            .store(in: &cancellables)
    }
    
    private func getTimeList() {
        timeList = TimeModelStorage.instance.fetch()
    }
    
    func getSectionTimeData(key: String) -> [TimeModel] {
        let items = sectionTimeDic[key] ?? []
        let mergedItems = Dictionary(grouping: items) { $0.dailyIdentifier }
            .map { (_, models) in
                models.reduce(TimeModel(fullDate: "", studySeconds: 0, breakSeconds: 0)) { result, model in
                    TimeModel(fullDate: model.fullDate,
                              studySeconds: result.studySeconds + model.studySeconds,
                              breakSeconds: result.breakSeconds + model.breakSeconds)
                }
            }.sorted { $0.fullDate < $1.fullDate }
        return mergedItems
    }

    /* 이게 원래 쓰던거 그냥 섹션별로 나뉜!
    func getSectionTimeData(key: String) -> [TimeModel] {
        let items = sectionTimeDic[key] ?? []
        let orderedItems = items.sorted(by: { $0.fullDate < $1.fullDate })
        return orderedItems
    }
     */
    
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
        getTimeList()
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
