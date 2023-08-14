//
//  OnboardingLoginView.swift
//  Mandarin2
//
//  Created by 우주형 on 2023/05/17.
//

import SwiftUI
//import GoogleSignIn
//import GoogleSignInSwift

@MainActor
final class OnboardingLoginViewModel: ObservableObject {
    
    func signInGoogle() async throws {
        let helper = SignInGoogleHelper()
        let tokens = try await helper.signIn()
        let authDataResult = try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
        let user = DBUser(auth: authDataResult)
        try await checkUserCreatedAndThenCreate(user: user)
    }
    
    func signInApple() async throws {
        let tokens = try await SignInWithAppleHelper.shared.startSignInWithAppleFlow()
        let authDataResult = try await AuthenticationManager.shared.signInWithApple(tokens: tokens)
        let user = DBUser(auth: authDataResult)
        try await checkUserCreatedAndThenCreate(user: user)
    }
    
    func signInGithub() async throws {
        do {
            let authDataResult = try await AuthenticationManager.shared.signInWithGithub()
            let user = DBUser(auth: authDataResult)
            try await checkUserCreatedAndThenCreate(user: user)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func checkUserCreatedAndThenCreate(user: DBUser) async throws {
        let userExists = try await UserManager.shared.userExists(userId: user.userId)
        if !userExists {
            try await UserManager.shared.createNewUser(user: user)
        }
        UserDefaults.standard.setValue(false, forKey: "showOnboarding")
    }
}

struct OnboardingLoginView: View {
    @EnvironmentObject var navPathFinder: NavigationPathFinder
    @EnvironmentObject var userStore: UserStore
    @StateObject private var loginVM = OnboardingLoginViewModel()
    
    @Binding var showSignInView: Bool
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack(spacing: 63) {
                Image(systemName: "doc.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 51)
                    .offset(x: -5)
                Text("함께 하고픈\n개발자가 되어 볼까요?")
                    
                    .multilineTextAlignment(.center)
                    .lineSpacing(9)
                
                HStack {
                    Capsule()
                        .frame(height: 1)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                    
                    Text("SNS로 1초만에 로그인")
                        
                    
                    Capsule()
                        .frame(height: 1)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                }
                .foregroundColor(.secondary)
                
                //MARK: - Logins
                HStack(spacing: 28) {
                    Button {
                        Task {
                            do {
                                try await loginVM.signInGoogle()
                                try await userStore.loadCurrentUser()
                                showSignInView = false
                            } catch {
                                print(error)
                                // alert 처리
                            }
                        }
                    } label: {
                        Image(systemName: "pencil.circle.fill")
                            .font(.largeTitle)
                    }
                    
                    Button {
                        Task {
                            do {
                                try await loginVM.signInApple()
                                try await userStore.loadCurrentUser()
                                showSignInView = false
                            } catch {
                                print(error)
                                // alert 처리
                            }
                        }
                    } label: {
                        Image(systemName:"apple.logo")
                            .font(.largeTitle)
                    }
                                        
                }
                
                Button {
//                    navPathFinder.removeStack()
                    withAnimation {
                        showSignInView = false
                        UserDefaults.standard.setValue(false, forKey: "showOnboarding")
                    }
                } label: {
                    Text("로그인 없이 보기")
                        .foregroundColor(.secondary)                        
                }
            }
        }
    }
}

struct OnboardingLoginView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingLoginView(showSignInView: .constant(false))
    }
}
