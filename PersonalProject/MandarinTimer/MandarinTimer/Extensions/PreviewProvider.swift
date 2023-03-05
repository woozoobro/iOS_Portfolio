//
//  PreviewProvider.swift
//  MandarinTimer
//
//  Created by 우주형 on 2023/02/25.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() { }
    let timeVM = TimerViewModel()
}
