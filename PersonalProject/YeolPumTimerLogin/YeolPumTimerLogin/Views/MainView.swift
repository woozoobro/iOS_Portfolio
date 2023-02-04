//
//  MainView.swift
//  YeolPumTimerLogin
//
//  Created by 우주형 on 2023/02/04.
//

import SwiftUI

struct MainView: View {
    @AppStorage("user_signin") var userSignIn: Bool = false
    var body: some View {
        ZStack {
            Group {
                if userSignIn {
                    LoginView()
                        .transition(.asymmetric(insertion: .move(edge: .top), removal: .identity))
                } else {
                    OnboardingView()
                        .transition(.opacity)
                }
            }.animation(.easeInOut, value: userSignIn)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
