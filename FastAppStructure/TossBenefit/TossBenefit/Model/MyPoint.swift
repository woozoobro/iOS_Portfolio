//
//  MyPoint.swift
//  TossBenefit
//
//  Created by 우주형 on 2023/01/03.
//

import Foundation

struct MyPoint: Hashable {
    var point: Int
}

extension MyPoint {
    static let `default` = MyPoint(point: 0)
}
