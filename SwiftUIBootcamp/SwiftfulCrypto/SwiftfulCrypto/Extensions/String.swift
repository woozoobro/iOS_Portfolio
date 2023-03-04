//
//  String.swift
//  SwiftfulCrypto
//
//  Created by 우주형 on 2023/03/04.
//

import Foundation

extension String {
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
