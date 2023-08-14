//
//  SignInGoogleHelper.swift
//  FirebaseCloudMessaging
//
//  Created by 우주형 on 2023/08/09.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift
import SwiftUI

struct CustomGoogleSignInButton: View {
    @Environment(\.colorScheme) var colorScheme
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image("google_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)

                Text("Google로 시작하기")
                    .font(.headline)
                    .padding(.trailing)
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
        }
        .foregroundColor(colorScheme == .light ? Color.black : Color.white)
        .background(colorScheme == .light ? Color.white : Color.black)
        .cornerRadius(6)
        .shadow(color: colorScheme == .light ? Color.gray.opacity(0.3) : Color.white.opacity(0.3), radius: 3, x: 0, y: 0)
        .contentShape(Rectangle())
    }
}

struct GoogleSignInResultModel {
    let idToken: String
    let accessToken: String
    let name: String?
    let email: String?
}

final class SignInGoogleHelper {
    
    @MainActor
    func signIn() async throws -> GoogleSignInResultModel {
        guard let topVC = Utilities.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }

        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)

        guard let idToken = gidSignInResult.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        
        let accessToken = gidSignInResult.user.accessToken.tokenString
        let name = gidSignInResult.user.profile?.name
        let email = gidSignInResult.user.profile?.email
        
        let tokens = GoogleSignInResultModel(idToken: idToken, accessToken: accessToken, name: name, email: email)
        return tokens
    }
}


