//
//  PostView.swift
//  Mandarin2
//
//  Created by 우주형 on 2023/04/03.
//

import SwiftUI
import Combine

//MARK: - PostViewModel
@MainActor
final class PostViewModel: ObservableObject {
    @Published var comments: [CommentModel] = []
    @Published var submitComment: CommentModel?
    @Published var post: PostModel
    @Published var loadComment: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    
    init(post: PostModel) {
        self.post = post
    }
    
    /// subCollection 인 comments 먼저 삭제 후에 post 삭제
    func removePost() {
        Task {
            try await PostsManager.shared.deleteAllComments(post: post)
            try await PostsManager.shared.deletePost(post: post)
        }
    }
    
    func loadComments() {
        Task {
            loadComment = true
            self.comments = try await PostsManager.shared.getAllCommentsSortedByDate(postId: post.id, descending: false)
            loadComment = false
        }
    }
    
    func addComment(user: DBUser?, content: String) {
        guard let user = user else { return }
        Task {
            let newComment = CommentModel(postID: post.id, user: user, content: content)
            try await PostsManager.shared.addPostComment(comment: newComment)
            try await updateCommentCountForPost()
        }
    }
    
    func deleteComment(comment: CommentModel) {
        Task {
            try await PostsManager.shared.deleteComment(postId: post.id, comment: comment)
        }
    }
    
    func reloadPost() async throws {
        self.post = try await PostsManager.shared.getPost(postId: post.id)
    }
    
//    func reloadLike() async throws {
//        let reloadedPost = try await PostsManager.shared.getPost(postId: post.id)
//        self.post.likedByUsers = reloadedPost.likedByUsers
//        print(reloadedPost.likedByUsers?.count)
//    }
    
    /// 좋아요 업데이트
    func updateLike(user: DBUser?) async throws {
        guard
            let user = user,
            let likedUsers = post.likedByUsers
        else { return }
        
        if likedUsers.contains(user.userId) {
            try await PostsManager.shared.removePostLike(post: post, userId: user.userId)
        } else {
            try await PostsManager.shared.updatePostLike(post: post, userId: user.userId)
        }
        try await reloadPost()
    }
    
    func isLiked(user: DBUser?) -> Bool {
        guard
            let user = user,
            let likedUsers = post.likedByUsers
        else { return false }
        return likedUsers.contains(user.userId)
    }
    
    func addListenerForComments() {
        PostsManager.shared.addListenerForPostComments(postId: post.id)
            .sink { completion in
                
            } receiveValue: { [weak self] comments in
                let sortedComments = comments.sorted { $0.dateCreated < $1.dateCreated}
                self?.comments = sortedComments
                self?.post.commentsCount = comments.count
            }
            .store(in: &cancellables)
    }
    
    func removeListenerForComments() {
        PostsManager.shared.removeListenerForPostComments()
    }
    
    func updateCommentCountForPost() async throws {
        try await PostsManager.shared.updatePostCommentsCount(post: post)
    }
    
}

//MARK: - PostView
struct PostView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var postVM: PostViewModel
    @EnvironmentObject var forumVM: ForumViewModel
    @EnvironmentObject var userStore: UserStore
    
    private let imageSize: CGFloat = 40
    @State private var imageURL: URL?
    
    @State private var submissionText: String = ""
    @State private var scrollToId: String = ""
    @State private var showAlert: Bool = false
    @State private var isTapped: Bool = false
    
    @State private var scrollPosition: CGRect = .zero
    
    @FocusState private var isTextFieldFocused: Bool
    @State private var showConfirmation: Bool = false
    @State private var showSubmissionView: Bool = false
    
    init(post: PostModel) {
        _postVM = StateObject(wrappedValue: PostViewModel(post: post))
    }
    
    var body: some View {
        ScrollViewReader { proxy in
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                VStack {
                    ScrollView(showsIndicators: false) {
                        LazyVStack {
                            HStack {
                                PostUserHeader(post: postVM.post, imageSize: imageSize, alignment: .center)
                                moreInfo
                            }
                            .id("scrollToTop")
                            .padding(.horizontal)
                            .padding(.top)
                            
                            postContent
                                
                            postFooterButton
                        }
                        commentList
                    }
                }
                .overlay(alignment: .bottom) {
                    Button {
                        proxy.scrollTo("scrollToTop", anchor: .bottom)
                    } label: {
                        Image(systemName: "chevron.up.circle")
                            .font(.title)
                            .offset(y: (scrollPosition.minY/scrollPosition.maxY) < 0 ? 10 : 50)
                            .scaleEffect((scrollPosition.minY/scrollPosition.maxY) < 0 ? 1 : 0.001)
                    }
                    .animation(.spring(), value: (scrollPosition.minY/scrollPosition.maxY) < 0)
                    
                }
                .safeAreaInset(edge: .bottom, alignment: .center, content: {
                    submissionField
                })
                .navigationBarTitleDisplayMode(.inline)
                .sheet(isPresented: $showSubmissionView) {
                    PostSubmissionView(user: userStore.user, post: postVM.post) { isUploaded in
                        Task {
                            if isUploaded {
                                try await postVM.reloadPost()
                                await forumVM.updatePost(postVM.post)
                            }
                        }
                    }
                }
                .refreshable {
                    
                }
                .onFirstAppear {
                    postVM.addListenerForComments()
                }
                .onAppear {
                    guard
                        let likedUsers = postVM.post.likedByUsers,
                        let userId = userStore.user?.userId
                    else { return }
                    self.isTapped = likedUsers.contains(userId)
                }
                .onDisappear {
                    postVM.removeListenerForComments()
                }
                //MARK: - async로 둘다 처리해줘야함!
                .task {
                    postVM.loadComments()
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

//MARK: - Component
extension PostView {
    
    private var postContent: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(.init(postVM.post.content ?? "내용 없음"))
                    .font(.title)
                    .textSelection(.enabled)
                    
                Spacer()
            }
            .padding(.bottom, 4)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(4)
        .padding(.horizontal, 14)
    }
    
    private var moreInfo: some View {
        Button {
            showConfirmation.toggle()
        } label: {
            Image(systemName: "ellipsis")
        }
        .confirmationDialog("포스트 관리", isPresented: $showConfirmation) {
            if userStore.user?.userId == postVM.post.userID {
                Button("삭제", role: .destructive) {
                    showAlert.toggle()
                }
                
                Button {
                    showSubmissionView.toggle()
                } label: {
                    Text("수정")
                }
                
            } else {
                Button("신고", role: .destructive) {
                    
                }
            }
//            Button {
//                sharePost()
//            } label: {
//                Text("공유")
//            }
        }
        .tint(Color.orange)
    }
    
    private var postFooterButton: some View {
        HStack(spacing: 10) {
            HStack(spacing: 5) {
//                HeartAnimation(isTapped: $isTapped)
                    
                Text("\(postVM.post.likedByUsers?.count ?? 0)")
                    .foregroundColor(.secondary)
            }
            .font(.body)
            .monospaced()
            .padding(10)
            .background(Color.orange.opacity(0.3).cornerRadius(20))
            .onTapGesture {
                Task(priority: .userInitiated) {
                    try await postVM.updateLike(user: userStore.user)
                    await forumVM.updatePost(postVM.post)
                    isTapped = postVM.isLiked(user: userStore.user)
                }
            }
            
            HStack(spacing: 3) {
                Image(systemName: "bubble.middle.bottom")
                Text("\(postVM.post.commentsCount ?? 0)")
            }
            .foregroundColor(.secondary)
            .font(.body)
            .monospaced()
            .padding(10)
            .background(Color.orange.opacity(0.3).cornerRadius(20))
            .onTapGesture {
                scrollToId = postVM.comments.last?.id ?? ""
                isTextFieldFocused = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    scrollToId = ""
                }
            }
        }
        .padding(4)
    }
    
    //MARK: - Comment List
    private var commentList: some View {
        VStack {
            Divider()
                .padding()
            if postVM.loadComment {
                ProgressView()
            } else if userStore.user != nil {
                VStack {
                    ScrollViewReader { proxy in
                        ForEach(postVM.comments) { comment in
                            CommentRowView(comment: comment, isMyComment: comment.userID == userStore.user?.userId)
                                .id(comment.id)
                                .padding(.horizontal)
                                .contextMenu {
                                    if let isDeleted = comment.isDeleted, isDeleted == false {
                                        if userStore.user?.userId == comment.userID {
                                            Button("삭제", role: .destructive) {
                                                print("삭제 버튼 눌려짐")
                                                postVM.deleteComment(comment: comment)
                                            }
                                        } else {
                                            Button("신고", role: .destructive) {
                                                print("신고 버튼 눌려짐")
                                            }
                                        }
                                    }
                                }
                            
                        }
                        .onChange(of: scrollToId) { newValue in
                            withAnimation(.spring()) {
                                proxy.scrollTo(newValue, anchor: .center)
                            }
                        }
                    }
                }
                .padding(.bottom, 30)
                .navigationTitle(Text("\(scrollPosition.minY / scrollPosition.maxY)"))
                .background {
                    GeometryReader { geo in
                        Color.clear
                            .preference(
                                key: ScrollOffsetPreferenceKey.self,
                                value: geo.frame(in: .global)
                            )
                    }
                }
                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                    scrollPosition = value
                }
            }
        }
    }
    
    private var submissionField: some View {
        HStack {
            VStack {
                //MARK: - 이미지 처리
                Image(systemName: "person")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 34, height: 34)
            }
            
            TextField("의견 남기기...", text: $submissionText, axis: .vertical)
                .font(.body)
                .lineLimit(5, reservesSpace: false)
                .focused($isTextFieldFocused)
                
            
            //MARK: - Add Comment
            Button {
                postVM.addComment(user: userStore.user, content: submissionText)
                submissionText = ""
                scrollToId = postVM.comments.last?.id ?? ""
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    scrollToId = ""
                }
            } label: {
                Image(systemName: "paperplane.fill")
                    .font(.title2)
                    .tint(Color.orange)
                    .padding(.trailing, 10)
            }
            .disabled(submissionText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        }
        .padding(.all, 8)
        .background(Color.orange.opacity(0.1)).cornerRadius(40)
        .background(.ultraThinMaterial).cornerRadius(40)
        .padding(.all, 8)
    }
    
}

//MARK: - 스크롤 오프셋 프리퍼런스키
struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        
    }
}


//MARK: - Sharing인데 우선은 사용하지 않기로함
extension PostView {
    func sharePost() {
        let message = "만다린의 포스트를 확인해볼까요!"
        let link = URL(string: "https://www.google.com")!
        
        let activityViewController = UIActivityViewController(activityItems: [message, link], applicationActivities: nil)
        
        let viewController = UIApplication.shared.windows.first?.rootViewController
        viewController?.present(activityViewController, animated: true, completion: nil)
        
    }
    
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: PostModel.samplePost)
            .environmentObject(ForumViewModel())
    }
}
