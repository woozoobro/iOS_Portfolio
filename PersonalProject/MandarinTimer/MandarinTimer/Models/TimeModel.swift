//
//  TimeModel.swift
//  MandarinTimer
//
//  Created by 우주형 on 2023/02/25.
//

import Foundation

struct TimeModel: Identifiable {
    let id: String = UUID().uuidString
    let startedDate: Date
    let passedTime: String
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = Locale(identifier: "kor")
        return formatter
    }
    
    var formattedDate: String {
        return dateFormatter.string(from: startedDate)
    }
}

extension TimeModel {
//    private var dateComponent: DateComponents {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
//
//        return
//    }
}

