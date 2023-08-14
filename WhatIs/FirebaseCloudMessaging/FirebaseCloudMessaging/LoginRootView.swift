//
//  LoginRootView.swift
//  Mandarin2
//
//  Created by 우주형 on 2023/04/06.
//

import SwiftUI

struct LoginRootView: View {
    @State private var showSignInView: Bool = false
    @EnvironmentObject private var userStore: UserStore
    @StateObject private var profileVM: ProfileViewModel
    
    init(userStore: UserStore) {
        _profileVM = StateObject(wrappedValue: ProfileViewModel(userStore: userStore))
    }
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            if !showSignInView {
                ProfileView(showSignInView: $showSignInView)
            }
        }
        .onAppear {
            profileVM.getUserFromStore()
            self.showSignInView = userStore.user == nil
            
        }
        .fullScreenCover(isPresented: $showSignInView) {
            OnboardingLoginView(showSignInView: $showSignInView)
        }
        .environmentObject(profileVM)
    }
}

struct LoginRootView_Previews: PreviewProvider {
    static var previews: some View {
        LoginRootView(userStore: UserStore())
    }
}
