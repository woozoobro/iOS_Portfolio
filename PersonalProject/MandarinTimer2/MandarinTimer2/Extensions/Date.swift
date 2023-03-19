//
//  Date.swift
//  MandarinTimer2
//
//  Created by 우주형 on 2023/03/19.
//

import Foundation

extension Date {
    
    func dateToString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        return formatter.string(from: self)        
    }
    
}
