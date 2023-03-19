//
//  TimerViewModel.swift
//  MandarinTimer2
//
//  Created by 우주형 on 2023/03/18.
//

import Foundation
import Combine

class TimerViewModel: ObservableObject {
    @Published var count: Int = 0
    @Published private var timeList: [TimeModel] = []
    @Published var timeDic: [String : [TimeModel]] = [:]
    
    var timer: AnyCancellable?
    var cancellables = Set<AnyCancellable>()
    
    var sectionKeys: [String] {
        return timeDic.keys.sorted(by: { $0 > $1 })
    }
    
    init() {
        //timeList, timeDic 세팅
        timeList = TimeModel.list
        timeDic = Dictionary(grouping: timeList, by: { $0.monthlyIdentifier})
    }
    
    func getTimeData(key: String) -> [TimeModel] {
        let items = timeDic[key] ?? []
        let orderedItems = items.sorted(by: { $0.fullDate < $1.fullDate})
        return orderedItems
    }
    
    func setUpTimer() {
        timer = Timer
            .publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink(receiveValue: { _ in
                self.count += 1
            })
    }
    
    func startButtonPressed() {
        
    }
}
