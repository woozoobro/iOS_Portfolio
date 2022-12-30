//
//  FoundationExtensions.swift
//  TaskCountdown
//
//  Created by 우주형 on 2022/12/30.
//

import Foundation
import UIKit

extension Int {
    func appendZeros() -> String {
        if (self < 10) {
            return "0\(self)"
        } else {
            return "\(self)"
        }
    }
}
 
extension Double {
    func degreeToRadians() -> CGFloat {
       return  (CGFloat(self) * .pi) / 180
    }
}
