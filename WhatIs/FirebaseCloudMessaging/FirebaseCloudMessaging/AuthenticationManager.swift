//
//  AuthenticationManager.swift
//  FirebaseCloudMessaging
//
//  Created by 우주형 on 2023/08/09.
//

import Foundation
import Firebase
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let photoUrl: String?
    let email: String?
    var username: String?
    var providerID: String?
    
    init(user: User) {
        self.uid = user.uid
        self.photoUrl = user.photoURL?.absoluteString
        self.email = user.email
        self.username = user.displayName
        self.providerID = user.providerData[0].providerID
    }
}

enum AuthProviderOption: String {
    case google = "google.com"
    case apple = "apple.com"
    case github = "github.com"
}

final class AuthenticationManager {
    static let shared = AuthenticationManager()
    private init() { }
    
    func getAuthenticatedUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel(user: user)
    }
    
    func getProviders() throws -> [AuthProviderOption] {
        guard let providerData = Auth.auth().currentUser?.providerData else {
            throw URLError(.badServerResponse)
        }
        var providers: [AuthProviderOption] = []
        for provider in providerData {
            if let option = AuthProviderOption(rawValue: provider.providerID) {
                providers.append(option)
            } else {
                assertionFailure("Provider option not found: \(provider.providerID)")
            }
        }
        
        return providers
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
    
    func delete() async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badURL)
        }
        try await user.delete()
    }
}

//MARK: - Sign In SSO
extension AuthenticationManager {
    
    @discardableResult
    func signInWithGoogle(tokens: GoogleSignInResultModel) async throws -> AuthDataResultModel {
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
        return try await signIn(credential: credential)
    }
    
    @discardableResult
    func signInWithApple(tokens: SignInWithAppleResult) async throws -> AuthDataResultModel {
//        let credential = OAuthProvider.credential(withProviderID: AuthProviderOption.apple.rawValue, idToken: tokens.token, rawNonce: tokens.nonce)
        
        let credential = OAuthProvider.appleCredential(withIDToken: tokens.token, rawNonce: tokens.nonce, fullName: tokens.name)
        return try await signIn(credential: credential)
    }
    
    @discardableResult
    func signInWithGithub() async throws -> AuthDataResultModel {
        let provider = OAuthProvider(providerID: AuthProviderOption.github.rawValue)
        
        let credential: OAuthCredential = try await withCheckedThrowingContinuation { continuation in
            provider.getCredentialWith(nil) { credential, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let credential = credential as? OAuthCredential {
                    continuation.resume(returning: credential)
                } else {
                    continuation.resume(throwing: URLError(.unknown))
                }
            }
        }
        let authResult = try await signIn(credential: credential)
        return authResult
    }
    
    func signIn(credential: AuthCredential) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().signIn(with: credential)
        return AuthDataResultModel(user: authDataResult.user)
    }
}

//MARK: - Sign in Anonymous

extension AuthenticationManager {
    
//    @discardableResult
//    func signInAnonymous() async throws -> AuthDataResultModel {
//        let authDataResult = try await Auth.auth().signInAnonymously()
//        return AuthDataResultModel(user: authDataResult.user)
//    }
    
    func linkEmail(email: String, password: String) async throws -> AuthDataResultModel {
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        
        return try await linkCredential(credential: credential)
    }
    
    func linkApple(tokens: SignInWithAppleResult) async throws -> AuthDataResultModel {
        let credential = OAuthProvider.credential(withProviderID: AuthProviderOption.apple.rawValue, idToken: tokens.token, rawNonce: tokens.nonce)
        return try await linkCredential(credential: credential)
    }
    
    func linkGoogle(tokens: GoogleSignInResultModel) async throws -> AuthDataResultModel {
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
        return try await linkCredential(credential: credential)
    }
    
    private func linkCredential(credential: AuthCredential) async throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badURL)
        }
        let authDataResult = try await user.link(with: credential)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
}

