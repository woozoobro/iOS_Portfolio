//
//  Int.swift
//  MandarinTimer2
//
//  Created by 우주형 on 2023/03/19.
//

import Foundation

extension Int {
    func countToTimeLabel() -> String {
        if self/3600 == 0 && self/60 == 0 {
            return "\(self)초"
        } else if self/3600 == 0 && self/60 < 60 {
            return "\(self/60)분 \(self%60)초"
        } else {
            return "\(self/3600)시간 \(self%3600/60)분 \(self%3600%60)초"
        }
    }
    
    func countToShortTime() -> String {
        if self/3600 == 0 && self/60 == 0 {
            return "넘 짧음"
        } else if self/3600 == 0 && self/60 < 60 {
            return "\(self/60)분"
        } else if self/3600 > 0 && self%3600/60 == 0 {
            return "\(self/3600)시간"
        } else {
            return "\(self/3600)시간 \(self%3600/60)분"
        }
    }
}
