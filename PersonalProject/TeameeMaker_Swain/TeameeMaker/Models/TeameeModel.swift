//
//  TeameeModel.swift
//  TeameeMaker
//
//  Created by Swain Yun on 2023/03/25.
//

import Foundation

enum DaysOfWeek: String {
    case mon
    case tue
    case wed
    case thu
    case fri
    case sat
    case sun
    
    var koreanValue: String {
        switch self {
        case .mon: return "월"
        case .tue: return "화"
        case .wed: return "수"
        case .thu: return "목"
        case .fri: return "금"
        case .sat: return "토"
        case .sun: return "일"
        }
    }
}

/*
 모든 Teamee 의 참여 가능 시간 중에서 공통 부분을 뽑아내야 함
 */
struct TaskModel {
    let title: String
    // date
}

/*
 scheduleModel 은 특정 요일에 참여 가능한 시간대 배열을 정의함.
 예를 들어, [월 : [14-16], 화: [14-16], 수: [14-16, 19-20]]
 */
struct ActiveTime: Identifiable {
    let id: String = UUID().uuidString
    let startTime: Int
}

/*
 Teamee 는 유저의 단위. 각 유저 별로 가능한 시간대를 가져야 함.
 */
struct TeameeModel: Identifiable {
    let id: String
    let name: String
    
    init(id: String = UUID().uuidString, name: String) {
        self.id = id
        self.name = name
    }
}
