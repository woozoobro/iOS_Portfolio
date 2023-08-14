//
//  ProfileLoggedInView.swift
//  Mandarin2
//
//  Created by 우주형 on 2023/03/30.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var navPathFinder: NavigationPathFinder
    @EnvironmentObject private var profileVM: ProfileViewModel
    @Binding var showSignInView: Bool
    
    @State private var showNoUserView: Bool = false
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            ZStack {
                //MARK: - NoUserView
                if profileVM.userStore.user != nil  {
                    loggedInSection
                } else {
                    if showNoUserView {
                        NoUserView(showSignInView: $showSignInView)
                    } else { ProgressView() }
                }
            }
        }
        .onAppear { showNoUserView = true }
    }
}

extension ProfileView {
    private var loggedInSection: some View {
        GeometryReader { geomtry in
            ScrollView(showsIndicators: false) {
                VStack {
                    editProfileSheet
                    ProfileHeaderTabsView()
                        .padding(.bottom)
                        .frame(height: geomtry.size.height / 1.1)
                }
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .shadow(radius: 1)
                        .offset(y: 60)
                }
            }
        }
        .fullScreenCover(isPresented: $profileVM.showEditProfileView, content: {
            NavigationStack {
                EditProfileView(showEditProfileView: $profileVM.showEditProfileView)
            }
        })
        .safeAreaInset(edge: .top, alignment: .trailing, content: {
            Button {
                
            } label: {
                Image(systemName: "gear")
            }
            .padding(.trailing, 30)
            .padding(.top, 20)
        })
        .toolbar(.hidden, for: .navigationBar)
    }
}

extension ProfileView {
    private var editProfileSheet: some View {
        Button {
            profileVM.showEditProfileView.toggle()
        } label: {
            VStack {
                if profileVM.userImageURL != nil {
                    Image(systemName: "person")
                } else {
                    Image(systemName: "book.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                        .cornerRadius(45)
                        .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 0)
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                }
                
                HStack {
                    Text(profileVM.userStore.user?.username ?? "익명의 귤")
                        
                    Image(systemName: "chevron.right")
                }
                .padding(.bottom)
            }
            .foregroundColor(.primary)
        }        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
            ProfileView(showSignInView: .constant(false))
            .environmentObject(ProfileViewModel(userStore: UserStore()))
    }
}
