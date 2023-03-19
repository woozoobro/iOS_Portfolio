//
//  TimeModelStorage.swift
//  MandarinTimer2
//
//  Created by 우주형 on 2023/03/19.
//

import Foundation

final class TimeModelStorage {
    
    static let instance = TimeModelStorage()
    private init() { }
    
    func save(_ items : [TimeModel]) {
        Storage.store(items, to: .documents, as: "time_list.json")
    }
    
    func fetch() -> [TimeModel] {
        let list = Storage.retrieve("time_list.json", from: .documents, as: [TimeModel].self) ?? []
        return list
    }
}
