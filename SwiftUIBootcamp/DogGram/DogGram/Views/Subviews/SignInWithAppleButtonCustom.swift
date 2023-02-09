//
//  SignInWithAppleButtonCustom.swift
//  DogGram
//
//  Created by 우주형 on 2023/02/09.
//

import Foundation
import SwiftUI
import AuthenticationServices

struct SignInWithAppleButtonCustom: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .black)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) { }
    
}
