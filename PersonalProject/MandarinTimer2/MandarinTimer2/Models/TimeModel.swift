//
//  TimeModel.swift
//  MandarinTimer2
//
//  Created by 우주형 on 2023/03/18.
//

import Foundation

struct TimeModel: Identifiable {
    let id = UUID().uuidString
    let date: String
    let passedTime: String
    
}

extension TimeModel {
    private var dateComponent: DateComponents {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let formattedDate = formatter.date(from: self.date) ?? Date()
        
        let calendar = Calendar(identifier: .gregorian)
        let dc = calendar.dateComponents([.year, .month], from: formattedDate)
        return dc
    }
    
    var monthlyIdentifier: String {
        return "\(dateComponent.year ?? 0)-\(dateComponent.month ?? 0)"
    }
}

extension TimeModel {
    static let list: [TimeModel] = [
        TimeModel(date: "2023-04-01 00:01:01", passedTime: "Hello"),
        TimeModel(date: "2023-04-03 00:01:01", passedTime: "Hello"),
        TimeModel(date: "2023-04-05 00:01:01", passedTime: "Hello"),
        TimeModel(date: "2023-03-01 00:01:01", passedTime: "Hello"),
        TimeModel(date: "2023-03-02 00:01:01", passedTime: "Hello"),
        TimeModel(date: "2023-02-01 00:01:01", passedTime: "Hello"),
        TimeModel(date: "2023-02-21 00:01:01", passedTime: "Hello"),
        TimeModel(date: "2023-01-21 00:01:01", passedTime: "Hello"),
        TimeModel(date: "2023-01-22 00:01:01", passedTime: "Hello"),
        TimeModel(date: "2023-01-11 00:01:01", passedTime: "Hello"),
    ]
}
