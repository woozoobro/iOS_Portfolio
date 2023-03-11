//
//  String.swift
//  SwiftfulCrypto2
//
//  Created by 우주형 on 2023/03/11.
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}
