//
//  TodaySectionItem.swift
//  TossBenefit
//
//  Created by 우주형 on 2023/01/03.
//

import Foundation

struct TodaySectionItem {
    var point: MyPoint
    let today: Benefit
    
    var sectionItems: [AnyHashable] {
        return [point, today]
    }
}

extension TodaySectionItem {
//    static let mock = TodaySectionItem(point: MyPoint(point: 0), today: Benefit.walk)
}
