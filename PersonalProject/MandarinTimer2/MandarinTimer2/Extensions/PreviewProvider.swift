//
//  PreviewProvider.swift
//  MandarinTimer2
//
//  Created by 우주형 on 2023/03/19.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() { }
    
    let timerVM = TimerViewModel()
    let timeModel = TimeModel(fullDate: "2023-04-01 00:01:01", studySeconds: 200, breakSeconds: 0)
    
    static let list: [TimeModel] = [
        TimeModel(fullDate: "2023-04-02 00:01:01", studySeconds: 800, breakSeconds: 0),
        TimeModel(fullDate: "2023-03-01 00:01:01", studySeconds: 100, breakSeconds: 0),
        TimeModel(fullDate: "2022-03-04 00:01:01", studySeconds: 700, breakSeconds: 0),
        TimeModel(fullDate: "2022-03-07 00:01:01", studySeconds: 800, breakSeconds: 0),
        TimeModel(fullDate: "2022-02-01 00:01:01", studySeconds: 2100, breakSeconds: 0),
        TimeModel(fullDate: "2022-02-04 00:01:01", studySeconds: 1000, breakSeconds: 0),
        TimeModel(fullDate: "2022-02-19 00:01:01", studySeconds: 1200, breakSeconds: 0),
        TimeModel(fullDate: "2022-02-12 00:01:01", studySeconds: 700, breakSeconds: 0),
        TimeModel(fullDate: "2022-02-01 00:01:01", studySeconds: 600, breakSeconds: 0),
        TimeModel(fullDate: "2022-01-12 00:01:01", studySeconds: 250, breakSeconds: 0),
        TimeModel(fullDate: "2022-01-15 00:01:01", studySeconds: 10, breakSeconds: 0),
        TimeModel(fullDate: "2022-01-28 00:01:01", studySeconds: 20, breakSeconds: 0),
        TimeModel(fullDate: "2022-01-30 00:01:01", studySeconds: 40, breakSeconds: 0),
        TimeModel(fullDate: "2022-01-31 00:01:01", studySeconds: 50, breakSeconds: 0),
        TimeModel(fullDate: "2022-01-31 00:01:01", studySeconds: 800, breakSeconds: 0),
    ]
}
