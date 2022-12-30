//
//  TaskViewModel.swift
//  TaskCountdown
//
//  Created by 우주형 on 2022/12/30.
//

import Foundation

class TaskViewModel {
    
    //MARK: - variables
    private var task: Task!
    
    private let taskTypes: [TaskType] = [
        TaskType(symbolName: "star", typeName: "Priority"),
        TaskType(symbolName: "iphone", typeName: "Develop"),
        TaskType(symbolName: "gamecontroller", typeName: "Gaming"),
        TaskType(symbolName: "wand.and.stars.inverse", typeName: "Editing"),
    ]
    
    private var selectedIndex = -1 {
        didSet {
            // set task type here
            self.task.taskType = self.getTaskTypes()[selectedIndex]
        }
    }
    
    private var hours = Box(0)
    private var minutes = Box(0)
    private var seconds = Box(0)
    
    
    //MARK: - init
    init() {
        task = Task(taskName: "", taskDescription: "", seconds: 0, taskType: .init(symbolName: "", typeName: ""), timeStamp: 0)
    }
    
    
    //MARK: - functions
    func setSelectedIndex(to value: Int) {
        self.selectedIndex = value
    }
    
    func setTaskName(to value: String) {
        self.task.taskName = value
    }
    
    func setTaskDescription(to value: String) {
        self.task.taskDescription = value
    }
    
    func getSelectedIndex() -> Int {
        self.selectedIndex
    }
    
    func getTask() -> Task {
        return self.task
    }
    
    func getTaskTypes() -> [TaskType] {
        return self.taskTypes
    }
    
    
    func setHours(to value: Int) {
        self.hours.value = value
    }
    
    func setMinutes(to value: Int) {
        var newMinutes = value
        if (value >= 60) {
            newMinutes -= 60
            hours.value += 1
        }
        
        self.minutes.value = newMinutes
    }
    
    func setSeconds(to value: Int) {
        var newSeconds = value
        if (value >= 60) {
            newSeconds -= 60
            minutes.value += 1
        }
        
        if (minutes.value >= 60) {
            minutes.value -= 60
            hours.value += 1
        }
        
        self.seconds.value = newSeconds
    }
    func getHours() -> Box<Int> {
        return self.hours
    }
    func getMinutes() -> Box<Int> {
        return self.minutes
    }
    func getSeconds() -> Box<Int> {
        return self.seconds
    }
    
    func computeSeconds() {
        self.task.seconds = (hours.value * 3600) + (minutes.value * 60) + seconds.value
        self.task.timeStamp = Date().timeIntervalSince1970
    }
    
    func isTaskValid() -> Bool {
        if (!task.taskName.isEmpty && !task.taskDescription.isEmpty && selectedIndex != -1 && (self.seconds.value > 0 || self.minutes.value > 0 || self.hours.value > 0)) {
            return true
        }
        return false
    }
}
