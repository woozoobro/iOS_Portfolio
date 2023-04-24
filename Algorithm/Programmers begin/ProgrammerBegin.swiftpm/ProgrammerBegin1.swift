//
//  ProgrammerBegin1.swift
//  ProgrammerBegin
//
//  Created by 우주형 on 2023/04/25.
//

import Foundation

class Test {
    func something() {
        let s1 = "HelloWorld"
        let mapResult = s1.map { $0 }
        print(mapResult)
        
        let result = s1.map { $0.isLowercase ? $0.uppercased() : $0.lowercased() }.joined()
    }
}
