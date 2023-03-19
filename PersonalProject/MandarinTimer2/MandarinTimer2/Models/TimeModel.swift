//
//  TimeModel.swift
//  MandarinTimer2
//
//  Created by 우주형 on 2023/03/18.
//

import Foundation

struct TimeModel: Identifiable {
    let id = UUID().uuidString
    let fullDate: String
    let passedTime: String
}

extension TimeModel {
    //MARK: - String데이트 dateComponent로 바꾸고 Identifier 설정
    private var stringToDate: Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        return formatter.date(from: self.fullDate) ?? Date()
    }
    
    private var dateComponent: DateComponents {
        let calendar = Calendar(identifier: .gregorian)
        let dc = calendar.dateComponents([.year, .month], from: stringToDate)
        return dc
    }
    
    var monthlyIdentifier: String {
        return "\(dateComponent.year ?? 0)-\(dateComponent.month ?? 0)"
    }
    
    //MARK: - 날짜 (일) 가져오기
    var justDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일"
        return formatter.string(from: stringToDate)
    }
    
}


//MARK: - MockData
extension TimeModel {
    static let list: [TimeModel] = [
        TimeModel(fullDate: "2023-04-01 00:01:01", passedTime: "2시간"),
        TimeModel(fullDate: "2023-04-03 00:01:01", passedTime: "3시간"),
        TimeModel(fullDate: "2023-04-05 00:01:01", passedTime: "5시간 20분"),
        TimeModel(fullDate: "2023-03-01 00:01:01", passedTime: "1시간 30분"),
        TimeModel(fullDate: "2023-03-02 00:01:01", passedTime: "25분"),
        TimeModel(fullDate: "2023-02-01 00:01:01", passedTime: "2시간 36"),
        TimeModel(fullDate: "2023-02-21 00:01:01", passedTime: "7분"),
        TimeModel(fullDate: "2023-01-21 00:01:01", passedTime: "10분"),
        TimeModel(fullDate: "2023-01-22 00:01:01", passedTime: "1분"),
        TimeModel(fullDate: "2023-01-11 00:01:01", passedTime: "6시간 20분"),
        TimeModel(fullDate: "2022-05-11 00:01:01", passedTime: "3시간 20분"),
        TimeModel(fullDate: "2022-05-11 00:01:01", passedTime: "3시간 20분"),
        TimeModel(fullDate: "2022-05-11 00:01:01", passedTime: "3시간 20분"),
        TimeModel(fullDate: "2022-05-11 00:01:01", passedTime: "3시간 20분"),
    ]
}
