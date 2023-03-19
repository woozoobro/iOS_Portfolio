//
//  String.swift
//  SwiftfulCrypto3
//
//  Created by 우주형 on 2023/03/19.
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
