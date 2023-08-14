//
//  PostRowView.swift
//  Mandarin
//
//  Created by 우주형 on 2023/03/29.
//

import SwiftUI

struct PostRowView: View {
    @EnvironmentObject var navPathFinder: NavigationPathFinder
    let post: PostModel
    private let imageSize: CGFloat = 36
    @State private var imageURL: URL?
    
    var body: some View {
        VStack {
            VStack(alignment: .leading,spacing: 10) {
                Button {
                    navPathFinder.addPath(option: .forum(post: post))
                } label: {
                    HStack(alignment: .top) {
                        //MARK: - 프로필 이미지
                        Image(systemName: "person")
                            .padding(.trailing, 3)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            HStack(alignment:.center) {
                                Text(post.username ?? "삭제된 유저")
                                    
                                Circle()
                                    .frame(width: 2.5, height: 2.5)
                                    .opacity(0.6)
                                Text((post.dateCreated ?? Date()).timeAgoDisplay())
                                    
                                Spacer()
                            }
                            .foregroundColor(.secondary)
                            
                            Text(.init(post.content ?? "내용 없음"))
                                .lineSpacing(4)
                                .multilineTextAlignment(.leading)                        
                                .frame(maxHeight: .infinity)
                                .foregroundColor(.primary)
                        }
                    }
                }
                                
                
                HStack {
                    Circle()
                        .fill(Color.clear)
                        .frame(width: imageSize, height: imageSize)
                        .padding(.trailing, 3)
                    
                    HStack(alignment:.center) {
                        Image(systemName: "heart.fill")
                            .font(.body)
                        Text("\(post.likedByUsers?.count ?? 0)")
                        
                        Image(systemName: "bubble.middle.bottom.fill")
                            .font(.body)
                        Text("\(post.commentsCount ?? 0)")
                            
                        Spacer()
                    }
                    .foregroundColor(.secondary)
                }
                
            }
            .frame(maxHeight: .infinity)
            .padding(.vertical)
            .padding(.horizontal, 4)
            .padding(.leading, 6)
            
            Divider()
            
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .onAppear {
            if let urlString = post.userProfileURLString {
                self.imageURL = URL(string: urlString)
            }
        }
//        .task(id: post.userProfileImageURL, priority: .background) {
//            guard
//                let userId = post.userID,
//                self.imageURL == nil
//            else {
//                if let imageURL = post.userProfileImageURL {
//                    self.imageURL = imageURL
//                }
//                return
//            }
//            do {
//                guard
//                    let imageURLString = try await UserManager.shared.getImageURLPath(userId: userId),
//                    let imageURL = URL(string: imageURLString)
//                else {
//                    print("유저매니저가 이미지 불러오는 거 실패함 프로필 이미지 등록 안한듯")
//                    return
//                }
//                self.post.userProfileImageURL = imageURL
//                self.imageURL = imageURL
//            } catch {
//                print("Loading Image Failed \(error.localizedDescription)")
//            }
//        }
    }

}

struct PostUserHeader: View {
    let post: PostModel
    let imageSize: CGFloat
    
    let alignment: VerticalAlignment
    var body: some View {
        HStack(alignment: alignment, spacing: 0) {
            Image(systemName: "person")
                .padding(.trailing)
            
            HStack(alignment: .center,spacing: 8) {
                Text(post.username ?? "삭제된 유저")
                    
                Text((post.dateCreated ?? Date()).timeAgoDisplay())
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}

struct PostRowView_Previews: PreviewProvider {
    static var previews: some View {
        PostRowView(post: PostModel.samplePost)
    }
}
