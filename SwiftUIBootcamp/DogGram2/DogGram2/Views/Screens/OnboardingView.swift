//
//  OnboardingView.swift
//  DogGram2
//
//  Created by 우주형 on 2023/04/01.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

@MainActor
final class AuthenticationViewModel: ObservableObject {
    let signInAppleHelper = SignInAppleHelper()
    
    func signInGoogle() async throws {
        let helper = SignInGoogleHelper()
        let tokens = try await helper.signIn()
        try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
    }
    
    func signInApple() async throws {
        let helper = SignInAppleHelper()
        let tokens = try await helper.startSignInWithAppleFlow()
        try await AuthenticationManager.shared.signInWithApple(tokens: tokens)
    }
}

struct OnboardingView: View {
    @StateObject private var viewModel = AuthenticationViewModel()
    @Environment(\.dismiss) var dismiss
    @State var showOnboardingPart2: Bool = false
    @State var showError: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .shadow(radius: 12)
            Text("Welcome to DogGram!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.MyTheme.purpleColor)
            Text("DogGram is the #1 app for posting pictures of your dog and sharing them across the world. We are a dog-loving community and we're happy to have you")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.MyTheme.purpleColor)
                .padding()
            
            //MARK: - Sign In with Apple
            Button {
                Task {
                    do {
                        try await viewModel.signInApple()
                        showOnboardingPart2.toggle()
                    } catch {
                        print(error)
                    }
                }
            } label: {
                SignInWithAppleViewRepresentable(type: .default, style: .black)
                    .allowsHitTesting(false)
            }
            .frame(height: 60)
            
            
            //MARK: - Sign In with Google
            
            GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .wide, state: .normal)) {
                Task {
                    do {
                        try await viewModel.signInGoogle()
                        showOnboardingPart2.toggle()
                    } catch {
                        print(error)
                    }
                }
            }
            
            Button {
                showOnboardingPart2.toggle()
            } label: {
                HStack {
                    Image(systemName: "globe")
                    Text("Sign in with Google")
                }
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color(.sRGB, red: 222/255, green: 82/255, blue: 70/255, opacity: 1.0))
                .cornerRadius(6)
                .font(.system(size: 23, weight: .medium, design: .default))
            }
            .tint(Color.white)
            
            Button {
                dismiss()
            } label: {
                Text("Continue as guests".uppercased())
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding()
            }.tint(.primary)


        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.MyTheme.beigeColor)
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showOnboardingPart2) {
            OnboardingViewPart2()
        }
        .alert(isPresented: $showError) {
            return Alert(title: Text("Error signing in 😭"))
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
