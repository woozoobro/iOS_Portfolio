//
//  ProfileHeaderTabsView.swift
//  Mandarin2
//
//  Created by 우주형 on 2023/05/19.
//

import SwiftUI

enum ProfileTab: String, CaseIterable {
    case project = "프로젝트"
    case myPosts = "나의 글"
    case bookmark = "관심"
    case rewards = "보상"
}

struct ProfileHeaderTabsView: View {
    @State var currentTab: ProfileTab = .project
    @EnvironmentObject var profileVM: ProfileViewModel
    
    
    var body: some View {
        VStack(spacing: 0) {
            ProfileCustomTabBar(currentTab: $currentTab)
            
            TabView(selection: $currentTab) {
                ZStack {
                    if profileVM.userStore.user?.userNeeds == nil {
                        NoUserNeedsView(showEditProfileView: $profileVM.showEditProfileView)
                    } else {
                        
                    }
                }
                .tag(ProfileTab.project)
                
                Text("my post")
                    .tag(ProfileTab.myPosts)
                
                Text("Bookmark")
                    .tag(ProfileTab.bookmark)
                
                Text("Rewards")
                    .tag(ProfileTab.rewards)
            }
        }
    }
}



struct NoUserNeedsView: View {
    @Binding var showEditProfileView: Bool
    var body: some View {
        VStack(spacing: 24) {
            Text("나의 Style & Needs")
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 40)
                .padding(.leading, 40)
            
            Button {
                showEditProfileView.toggle()
            } label: {
                Text("선택이 필요해요")
                    .foregroundColor(.orange)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background {
                        Color.green.cornerRadius(10)
                    }
                    .padding(.horizontal, 30)
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct ProfileCustomTabBar: View {
    @Binding var currentTab: ProfileTab
    
    var body: some View {
        VStack {
            Divider()
            HStack(spacing: 0) {
                ForEach(ProfileTab.allCases, id: \.rawValue) { tab in
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                            print(tab.rawValue)
                            currentTab = tab
                        }
                    } label: {
                        Text(tab.rawValue)
                            .scaleEffect(currentTab == tab ? 1.1 : 1.0 )
                            .overlay {
                                Capsule()
                                    .frame(height: currentTab == tab ? 2 : 0)
                                    .frame(maxWidth: currentTab == tab ? .infinity : 0)
                                    .offset(y: 20)
                            }
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? .black : .gray)
                    }
                    .offset(y: currentTab == tab ? -7 : 0)
                }
            }
            .frame(height: 30)
            .padding(.vertical, 16)
            Divider()
        }
    }
}

struct ProfileHeaderTabsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderTabsView()
    }
}
