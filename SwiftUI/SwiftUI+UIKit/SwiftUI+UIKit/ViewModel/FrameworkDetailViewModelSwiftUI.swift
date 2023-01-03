//
//  FrameworkDetailViewModelSwiftUI.swift
//  SwiftUI+UIKit
//
//  Created by 우주형 on 2023/01/03.
//

import Foundation
import SwiftUI

final class FrameworkDetailViewModelSwiftUI: ObservableObject {
    @Published var framework: AppleFramework
    @Published var isSafariPresented: Bool = false
    
    init(framework: AppleFramework) {
        self.framework = framework
    }
}
