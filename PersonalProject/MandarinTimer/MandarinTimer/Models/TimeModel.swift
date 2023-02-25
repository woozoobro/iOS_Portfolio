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
        
}

