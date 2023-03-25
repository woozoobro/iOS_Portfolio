//
//  String.swift
//  MandarinTimer2
//
//  Created by 우주형 on 2023/03/19.
//

import Foundation

extension String {
    
    ///Format the String to Section's Title
    ///다른 형식으로 할라면
    ///데이트 포맷 쪽에 "yy년 MMMM월" 수정 해주면 됨
    func formatSectionTitle() -> String {
        let dateComponents = self.components(separatedBy: "-")
            .compactMap { Int($0) }
        
        guard let year = dateComponents.first,
              let month = dateComponents.last else { return "Format Error"}
        
        let calendar = Calendar(identifier: .gregorian)
        let dateComponent = DateComponents(calendar: calendar, year: year, month: month)
        let date = dateComponent.date ?? Date()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MMMM"
        formatter.locale = Locale(identifier: "ko")
        return formatter.string(from: date)
    }
    
    func formatDayTitle() -> String {
        let dateComponents = self.components(separatedBy: "-")
            .compactMap { Int($0) }
        
        let year = dateComponents[0]
        let month = dateComponents[1]
        let day = dateComponents[2]
        
        let calendar = Calendar(identifier: .gregorian)
        let dateComponent = DateComponents(calendar: calendar, year: year, month: month, day: day)
        let date = dateComponent.date ?? Date()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일"
        formatter.locale = Locale(identifier: "ko")
        return formatter.string(from: date)
    }
}
