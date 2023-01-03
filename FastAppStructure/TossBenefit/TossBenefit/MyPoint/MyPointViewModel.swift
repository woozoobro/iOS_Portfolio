//
//  MyPointViewModel.swift
//  TossBenefit
//
//  Created by 우주형 on 2023/01/04.
//

import Foundation

final class MyPointViewModel {
    @Published var point: MyPoint = .default
    
    init(point: MyPoint) {
        self.point = point
    }
}
