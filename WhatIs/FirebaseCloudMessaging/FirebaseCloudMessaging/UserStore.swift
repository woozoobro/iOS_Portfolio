//
//  UserStore.swift
//  Mandarin2
//
//  Created by 우주형 on 2023/07/12.
//

import SwiftUI

@MainActor
final class UserStore: ObservableObject {
    
    @Published private(set) var user: DBUser?
    
    init() {
        Task(priority: .background) {
            do {
                try await loadCurrentUser()
                print("--->In the UserStore")
//                print(user ?? "유저 없음")
            } catch {
                print("---> Loading User Failed")
            }
        }
    }
    
    /// Check Auth and Get Firestore's DBUSER
    func loadCurrentUser() async throws {
        print("---> In the UserStore, loadCurrentUser() just called!!")
        let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
        self.user = try await UserManager.shared.getUser(userId: authDataResult.uid)
    }
    
    func logOutUser() throws {
        try AuthenticationManager.shared.signOut()
        user = nil
    }
    
    func deleteCurrentUser() async throws {
        try await AuthenticationManager.shared.delete()
        user = nil
    }
    
    deinit {
        print("--->UserStore Deinit")
    }
    
}
