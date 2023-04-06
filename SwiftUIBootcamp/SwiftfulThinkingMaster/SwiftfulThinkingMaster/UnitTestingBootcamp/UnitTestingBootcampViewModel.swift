//
//  UnitTestingBootcampViewModel.swift
//  SwiftfulThinkingMaster
//
//  Created by 우주형 on 2023/04/06.
//

import Foundation
import SwiftUI

class UnitTestingBootcampViewModel: ObservableObject {
    @Published var isPremium: Bool
    
    init(isPremium: Bool) {
        self.isPremium = isPremium
    }
}
