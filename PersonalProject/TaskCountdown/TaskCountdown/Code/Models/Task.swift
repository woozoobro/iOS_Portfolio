//
//  Task.swift
//  TaskCountdown
//
//  Created by 우주형 on 2022/12/30.
//

import Foundation

struct TaskType {
    let symbolName: String
    let typeName: String
}

struct Task {
    var taskName: String
    var taskDescription: String
    var seconds: Int
    var taskType: TaskType
    
    var timeStamp: Double
}

enum CountdownState {
    case suspended
    case running
    case paused
}
