//
//  TimeModel.swift
//  MandarinTimer2
//
//  Created by 우주형 on 2023/03/18.
//

import Foundation

struct TimeModel: Identifiable, Codable {
    var id = UUID()
    var fullDate: String
    var studySeconds: Int
    var breakSeconds: Int
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
        let dc = calendar.dateComponents([.year, .month, .day], from: stringToDate)
        return dc
    }
    
    var monthlyIdentifier: String {
        return "\(dateComponent.year ?? 0)-\(dateComponent.month ?? 0)"
    }
    
    var dailyIdentifier: String {
        return "\(dateComponent.year ?? 0)-\(dateComponent.month ?? 0)-\(dateComponent.day ?? 0)"
    }
    
    //MARK: - 날짜 (일) 가져오기
    var justDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일"
        return formatter.string(from: stringToDate)
    }
    
    var allDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일"
        formatter.locale = Locale(identifier: "ko")
        return formatter.string(from: stringToDate)
    }
}
