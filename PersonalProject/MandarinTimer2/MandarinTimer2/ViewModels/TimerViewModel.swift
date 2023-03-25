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
    @Published var timeList: [TimeModel] = [] {
        didSet {
            TimeModelStorage.instance.save(timeList)
        }
    }
    @Published var sectionTimeDic: [String : [TimeModel]] = [:]
    @Published var dayTimeList: [TimeModel] = []
    
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
    
    private func getTimeList() {
        timeList = TimeModelStorage.instance.fetch()
    }
    
    private func addSubscriber() {
        // sectionTimeDic 세팅
        $timeList
            .sink { times in
                self.sectionTimeDic = Dictionary(grouping: times, by: {$0.monthlyIdentifier})
            }
            .store(in: &cancellables)
    }
    
    func getSectionTimeData(key: String) -> [TimeModel] {
        let items = sectionTimeDic[key] ?? []
        let mergedItems = items.reduce(into: [String: TimeModel]()) { result, timeModel in
            let dailyIdentifier = timeModel.dailyIdentifier
            // if the result dictionary already contains a TimeModel with the same dailyIdentifier,
            // update its studySeconds by adding the current timeModel's studySeconds

            if var existingModel = result[dailyIdentifier] {
                existingModel.studySeconds += timeModel.studySeconds
                existingModel.breakSeconds += timeModel.breakSeconds
                result[dailyIdentifier] = existingModel
            } else {
                // otherwise, add the current timeModel to the result dictionary
                result[dailyIdentifier] = timeModel
            }
        }.values.sorted { $0.fullDate < $1.fullDate }
        // mergedTimeModels will contain an array of TimeModels with unique dailyIdentifiers
        // and their studySeconds merged if they have the same dailyIdentifier
        return mergedItems
    }
    
    func getDateTimeList(key: String) {
        print("item filtered")
        dayTimeList = timeList.filter { $0.dailyIdentifier == key }
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
                print("Break Count:\(self.breakCount)")
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
            cancelBreakTimer()
        } else {
            cancelStudyTimer()
            setBreakTimer()
        }
    }
    
    func stopButtonPressed() {
        guard !isFinished else { return }
        addTime()
        resetToDefault()
    }
    
    private func resetToDefault() {
        cancelStudyTimer()
        cancelBreakTimer()
        studyCount = 0
        breakCount = 0
        isStarting = false
        isFinished = true
        studyTimeModel = TimeModel(fullDate: "", studySeconds: 0, breakSeconds: 0)
    }
    
    private func cancelStudyTimer() {
        timer?.cancel()
        timer = nil
    }
    
    private func cancelBreakTimer() {
        breakTimer?.cancel()
        breakTimer = nil
    }
    
    func addTime() {
        studyTimeModel.studySeconds = studyCount
        studyTimeModel.breakSeconds = breakCount
        timeList.append(studyTimeModel)
    }
    
    func deleteAllTimes(key: String) {
        timeList.removeAll { $0.dailyIdentifier == key}
    }
    
    func delteTime(atOffsets: IndexSet) {
        for index in atOffsets {
            if let realIndex = timeList.firstIndex(where: {$0.id == dayTimeList[index].id }) {
                timeList.remove(at: realIndex)
            } else {
                print("Not Found")
            }
        }
        dayTimeList.remove(atOffsets: atOffsets)
    }
    
}
