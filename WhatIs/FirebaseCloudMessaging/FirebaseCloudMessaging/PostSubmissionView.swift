//
//  PostSubmissionView.swift
//  Mandarin2
//
//  Created by 우주형 on 2023/04/03.
//

import SwiftUI

@MainActor
final class PostSubmissionViewModel: ObservableObject {
    let user: DBUser?
    @Published private var post: PostModel? = nil
    
    init(user: DBUser?, post: PostModel?) {
        self.user = user
        self.post = post
    }
    
    func uploadPost(content: String) {
        // 유저 정보 + content만 있으면 됨
        guard let user = user else { return }
        Task {
            let newPost = PostModel(user: user, content: content)
            do {
                try await PostsManager.shared.uploadPost(post: newPost)
                print("업로드 합니당")
            } catch {
                print("업로드 실패했습니당")
                print(error.localizedDescription)
            }
        }
    }
    
    func updatePost(content: String) {
        guard
            let user = user,
            var post = post
        else { return }
        Task {
            post.content = content
            post.username = user.username
            post.userProfileURLString = user.profileImagePathUrl
            try await PostsManager.shared.updatePost(post: post)
        }
    }
}


struct PostSubmissionView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var content: String
    private(set) var isEditing: Bool = false
    
    @State private var showCancel: Bool = false
    @StateObject private var postSubmissionVM: PostSubmissionViewModel
    let uploaded: (_ isUploaded: Bool) -> Void
    
    /// action으로 업로드가 끝나면 포럼뷰가 reload되게!
    init(user: DBUser?, post: PostModel? = nil, action: @escaping (Bool) -> Void) {
        _postSubmissionVM = StateObject(wrappedValue: PostSubmissionViewModel(user: user, post: post))
        self.uploaded = action
        self.isEditing = (post != nil)
        _content = State(wrappedValue: post?.content ?? "")
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Divider()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        HStack(alignment: .top, spacing: 0) {
                            //MARK: - 유저 이미지로 변경 필요
                            Image("pm_avatar")
                                .resizable()
                                .scaledToFit()
                                .background {
                                    Circle()
                                        .fill(Color.green.opacity(0.2))
                                }
                                .frame(width: 36, height: 36)
                                .padding(.trailing)
                            VStack(alignment: .leading, spacing: 10) {
                                HStack(alignment: .center,spacing: 8) {
                                    Text(postSubmissionVM.user?.username ?? "삭제된 유저")
                                }
                                PlaceholderTextEditor(text: $content, placeholder: "내용을 입력해주세요...")
                            }
                        }
                    }
                }
                .padding()
                
            }
            .navigationBarTitle("새 포스트", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        !content.isEmpty ? showCancel.toggle() : dismiss()
                    } label: {
                        Text("취소")
                            .foregroundColor(.orange)
                    }                    
                }
                                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isEditing ? postSubmissionVM.updatePost(content: content) : postSubmissionVM.uploadPost(content: content)
                        uploaded(true)
                        dismiss()
                    } label: {
                        Text("게시")
                            .foregroundColor(content.isEmpty ? .gray : .green)
                    }
                    .disabled(content.isEmpty)
                }
            }
        }
    }
    
}


struct PostSubmissionView_Previews: PreviewProvider {
    static var previews: some View {
        PostSubmissionView(user: nil, post: nil, action: {_ in })
            .environmentObject(ForumViewModel())
    }
}
