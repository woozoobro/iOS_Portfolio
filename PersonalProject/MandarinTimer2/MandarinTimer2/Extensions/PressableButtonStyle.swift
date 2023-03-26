//
//  PressableButtonStyle.swift
//  MandarinTimer2
//
//  Created by 우주형 on 2023/03/25.
//

import Foundation
import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    let scaledAmount: CGFloat
    
    init(scaledAmount: CGFloat) {
        self.scaledAmount = scaledAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}

struct ErrorButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .offset(x: configuration.isPressed ? 10 : 0)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}

extension View {
    func withPressableStyle(scaledAmount: CGFloat = 0.8) -> some View {
        buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
    
    func withErrorStyle() -> some View {
        buttonStyle(ErrorButtonStyle())
    }
}
