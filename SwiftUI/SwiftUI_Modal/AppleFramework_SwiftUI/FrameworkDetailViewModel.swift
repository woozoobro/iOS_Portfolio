//
//  FrameworkDetailViewModel.swift
//  AppleFramework_SwiftUI
//
//  Created by 우주형 on 2023/01/03.
//

import Foundation
import SwiftUI

final class FrameworkDetailViewModel: ObservableObject {
    @Published var framework: AppleFramework
    @Published var isSafariPresented: Bool = false
    
    init(framework: AppleFramework) {
        self.framework = framework
    }
}
