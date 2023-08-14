//
//  ContentView.swift
//  FirebaseCloudMessaging
//
//  Created by 우주형 on 2023/08/08.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var navPathFinder: NavigationPathFinder
    @EnvironmentObject var userStore: UserStore
    
    var body: some View {
        NavigationStack(path: $navPathFinder.path) {
            ZStack(alignment:.bottom) {
                TabView(selection: $navPathFinder.currentTab) {
                    ForumView()
                        .tag(MainTab.forum)
                    LoginRootView(userStore: userStore)
                        .tag(MainTab.profile)
                }
                MainCustomTabBar(currentTab: $navPathFinder.currentTab)
            }
            .navigationDestination(for: ViewOptions.self) { option in
                option.view()
            }
        }
    }
}

enum ViewOptions: Hashable {
    case forum(post: PostModel)    
    
    @ViewBuilder func view() -> some View {
        switch self {
            case .forum(post: let post): PostView(post: post)
        }
    }
}

final class NavigationPathFinder: ObservableObject {
    @Published var path: NavigationPath = .init()
    @Published var currentTab: MainTab = .forum
    @Published var studyScroll = false
    @Published var forumScroll = false
        
    func addPath(option: ViewOptions) {
        path.append(option)
    }
    
    func removeStack() {
        path = .init()
    }
    
    func findStudyScrollToTop() {
        studyScroll = true
    }
    
    func forumScrollToTop() {
        forumScroll = true
    }
    
}

enum MainTab: String, CaseIterable {
    case forum = "message.fill"
    case study = "folder.fill"
    case profile = "person.circle.fill"
    
    var titleText: String {
        switch self {
            case .forum:
                return "게시판"
            case .study:
                return "스터디"
            case .profile:
                return "프로필"
        }
    }
}

struct MainCustomTabBar: View {
    @Binding var currentTab: MainTab
    @EnvironmentObject var navPathFinder: NavigationPathFinder
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                ForEach(MainTab.allCases, id: \.rawValue) { tab in
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                            if currentTab == tab {
                                /// current탭 다시 탭하면 스크롤 이동기능
                                switch currentTab {
                                    case .forum: navPathFinder.forumScrollToTop()
                                    case .study: navPathFinder.findStudyScrollToTop()
                                    case .profile: return
                                }
                            } else {
                                currentTab = tab
                            }
                        }
                    } label: {
                        VStack(spacing: 1) {
                            Image(systemName: tab.rawValue)
                                .font(.subheadline)
                                .bold()
                                .scaleEffect(currentTab == tab ? 1.06 : 1.0)
                                .frame(maxWidth: .infinity)
                            Text(tab.titleText)
                        }
                        .foregroundColor(currentTab == tab ? Color.black : .black.opacity(0.4))
                    }
                }
            }
            .frame(height: 30)
            .padding(.top, 10)
            .padding(.bottom, 8)
            .background(.ultraThinMaterial)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
