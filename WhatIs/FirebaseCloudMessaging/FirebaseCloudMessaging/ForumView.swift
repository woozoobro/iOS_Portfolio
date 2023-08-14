//
//  ForumView.swift
//  Mandarin
//
//  Created by 우주형 on 2023/03/28.
//

import SwiftUI
import FirebaseFirestore

@MainActor
final class ForumViewModel: ObservableObject {
    @Published var posts = [PostModel]()
    @Published var isFull: Bool = false
    
    private let itemsPerPage: Int = 12
    private var lastDocument: DocumentSnapshot? = nil
    
    func updatePost(_ updatedPost: PostModel) async {
        if let index = posts.firstIndex(where: {$0.id == updatedPost.id}) {
            posts[index] = updatedPost
        }
    }
//    func updatePostWhenLiked(_ updatedPost: PostModel) async {
//        if let index = posts.firstIndex(where: {$0.id == updatedPost.id}) {
//            posts[index].likedByUsers = updatedPost.likedByUsers
//        }
//    }
    func getPosts() {
        Task {
            isFull = false
            let (newPosts, lastDocument) = try await PostsManager.shared.getAllPostsSortedByDate(descending: true, count: itemsPerPage, lastDocument: lastDocument)
            if let lastDocument {
                self.lastDocument = lastDocument
            }
            if newPosts.count == 0 {
                try? await Task.sleep(nanoseconds: 100_000_000)
                self.isFull = true
                return
            }
            self.posts.append(contentsOf: newPosts)
            print("---> Getting more Posts")
        }
    }
    
    func reload() async {
        try? await Task.sleep(nanoseconds: 200_000_000)
        self.posts = []
        self.lastDocument = nil
        getPosts()
    }
    
    //MARK: - Test용 Date 생성 메소드
    private func getDateCreated(hoursAgo: Int) -> Date {
        let calendar = Calendar.current
        let currentDate = Date()
        let date = calendar.date(byAdding: .hour, value: -hoursAgo, to: currentDate)!
        return date
    }
}


struct ForumView: View {
    @State private var showPostSubmission = false
    @EnvironmentObject var forumVM: ForumViewModel
    @EnvironmentObject var userStore: UserStore
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                Image(systemName: "terminal.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .padding([.top, .horizontal])
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Capsule()
                    .fill(Color.clear)
                    .frame(height: 3)
                
                Spacer()
                
                ScrollViewReader { proxy in
                    postsSection
                }
                //MARK: - Empty 패딩
                Rectangle()
                    .fill(Color.clear)
                    .frame(height: 50)
            }
            .refreshable {
                await forumVM.reload()
            }
            .sheet(isPresented: $showPostSubmission) {
                PostSubmissionView(user: userStore.user) { isUploaded in
                    Task {
                        if isUploaded {
                            await forumVM.reload()
                        }
                    }
                }
            }
        }
        .onFirstAppear {
            Task {
                forumVM.getPosts()
            }
        }
        .overlay(alignment: .bottomTrailing) {
            ToolbarButtonComponent(systemName: "plus") {
                showPostSubmission.toggle()
            }
            .padding(.trailing, 30)
            .padding(.bottom, 74)
        }
    }
}

//MARK: - 포트스 섹션
extension ForumView {
    private var postsSection: some View {
        LazyVStack {
            if forumVM.posts.isEmpty {
                ForEach(0..<9) { _ in
                    ForumShimmerRowView()
                }
            } else {
                ForEach(forumVM.posts) { post in
                    PostRowView(post: post)
                        .id(post.id)
                                        
                    if post == forumVM.posts.last {
                        ProgressView()
                            .onAppear {
                                forumVM.getPosts()
                            }
                            .opacity(forumVM.isFull ? 0 : 1 )
                            .disabled(!forumVM.isFull)
                    }
                }
            }
        }
    }
}

struct ForumView_Previews: PreviewProvider {
    static var previews: some View {
        ForumView()
            .environmentObject(ForumViewModel())
    }
}

