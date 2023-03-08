//
//  HapticManager.swift
//  SwiftfulCrypto2
//
//  Created by 우주형 on 2023/03/08.
//

import Foundation
import SwiftUI

class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
