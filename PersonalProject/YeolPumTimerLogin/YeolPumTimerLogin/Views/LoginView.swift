//
//  LoginView.swift
//  YeolPumTimerLogin
//
//  Created by 우주형 on 2023/02/04.
//

import SwiftUI

struct LoginView: View {
    @AppStorage("user_signin") var userSignIn: Bool = false
    @AppStorage("user_email") var userEmail: String?
    var body: some View {
        VStack(spacing: 30) {
            Text("로그인 성공 ^^")
            Text(userEmail ?? "N/A")
                .font(.largeTitle)
                .foregroundColor(.orange)
            Button {
                userSignIn = false
                userEmail = nil
            } label: {
                Text("로그아웃하기")
            }

        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
