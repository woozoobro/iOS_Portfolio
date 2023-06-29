//
//  OnFirestAppearViewModifier.swift
//  FirebaseAgain
//
//  Created by 우주형 on 2023/06/28.
//

import SwiftUI

struct onFirstAppearViewModifier: ViewModifier {
    @State private var didAppear: Bool = false
    let perform: (() -> Void)?
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                if !didAppear {
                    perform?()
                    didAppear = true
                }
            }
    }
}

extension View {
    func onFirstAppear(perform: (() -> Void)?) -> some View {
        modifier(onFirstAppearViewModifier(perform: perform))
    }
}
