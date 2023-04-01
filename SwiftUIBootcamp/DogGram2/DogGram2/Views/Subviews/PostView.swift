//
//  PostView.swift
//  DogGram2
//
//  Created by 우주형 on 2023/03/21.
//

import SwiftUI

struct PostView: View {
    
    @State var post: PostModel
    var showHeaderAndFooter: Bool
    @State var postImage: UIImage = UIImage(named: "dog1")!
    
    @State var animateLike: Bool = false
    @State var showActionSheet: Bool = false
    @State var actionSheetType: PostActionSheetOption = .general
    
    enum PostActionSheetOption {
        case general, reporting
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            //MARK: - "Header"
            if showHeaderAndFooter {
                HStack {
                    NavigationLink {
                        ProfileView(isMyProfile: false, profileDisplayName: post.username, profileUserID: post.userID)
                    } label: {
                        Image(uiImage: postImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30)
                            .cornerRadius(15)
                        
                        Text(post.username)
                            .font(.callout)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                    }
                    
                    Spacer()
                    
                    Button {
                        showActionSheet.toggle()
                    } label: {
                        Image(systemName: "ellipsis")
                            .font(.headline)
                    }
                    .tint(.primary)
                    .actionSheet(isPresented: $showActionSheet) {
                        getActionSheet()
                    }
                }
                .padding(6)
            }
            
            //MARK: - Image
            
            ZStack {
                Image("dog1")
                    .resizable()
                    .scaledToFit()
                    .overlay {
                        LikeAnimationView(animate: $animateLike)
                    }
            }
            //MARK: - Footer
            if showHeaderAndFooter {
                HStack(alignment: .center, spacing: 20) {
                    
                    Button {
                        if post.likedByUser {
                            // unlike
                            unlikePost()
                        } else {
                            // like
                            likePost()
                        }
                    } label: {
                        Image(systemName: post.likedByUser ? "heart.fill" : "heart")
                    }
                    .tint(post.likedByUser ? .red : .primary)
                    //MARK: - Comment Icon
                    NavigationLink {
                        CommentsView()
                    } label: {
                        Image(systemName: "bubble.middle.bottom")
                    }
                    .tint(.primary)
                    
                    Button {
                        sharePost()
                    } label: {
                        Image(systemName: "paperplane")
                    }.tint(.primary)

                    Spacer()
                }
                .font(.title3)
                .padding(6)
                
                if let caption = post.caption {
                    HStack {
                        Text(caption)
                        Spacer(minLength: 0)
                    }
                    .padding(6)
                }
            }

        }
    }
    
    //MARK: - Functions
    func likePost() {
        // Update the local Data
        let updatedPost = PostModel(postID: post.postID, userID: post.userID, username: post.username, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount + 1, likedByUser: true)
        self.post = updatedPost
        
        animateLike = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            animateLike = false
        }
    }
    
    func unlikePost() {
        // Update the local Data
        let updatedPost = PostModel(postID: post.postID, userID: post.userID, username: post.username, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount - 1, likedByUser: false)
        self.post = updatedPost
    }
    
    func getActionSheet() -> ActionSheet {
        
        switch self.actionSheetType {
        case .general:
            return ActionSheet(title: Text("What would you like to do?"), message: nil, buttons: [
                .destructive(Text("Report"), action: {
                    print("Report Post")
                    self.actionSheetType = .reporting
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        self.showActionSheet.toggle()
                    }
                }),
                .default(Text("Learn more..."), action: {
                    print("Laern more Pressed")
                }),
                .cancel()
            ])
            
        case .reporting:
            return ActionSheet(title: Text("Why are you reporting this post?"), message: nil, buttons: [
                .destructive(Text("This is inappropriate")) {
                    reportPost(reason: "This is inappropriate")
                },
                .destructive(Text("This is spam")) {
                    reportPost(reason: "This is spam")
                },
                .destructive(Text("It made me uncomfortable")) {
                    reportPost(reason: "It made me uncomfortable")
                },
                .cancel({
                    self.actionSheetType = .general
                })
            ])
        }
    }
    
    func reportPost(reason: String) {
        print("Report Post Now")
    }
    
    func sharePost() {
        
        let message = "Check out this post on DogGram!"
        let image = postImage
        let link = URL(string: "https://www.google.com")!
        
        let activityViewController = UIActivityViewController(activityItems: [message, image, link], applicationActivities: nil)
        
        let viewController = UIApplication.shared.windows.first?.rootViewController
        viewController?.present(activityViewController, animated: true, completion: nil)
        
    }
}

struct PostView_Previews: PreviewProvider {
    
    static var post: PostModel = PostModel(postID: "", userID: "", username: "Woozoobro", caption: "This is a test caption", dateCreated: Date(), likeCount: 0, likedByUser: false)
    
    static var previews: some View {
        NavigationView {
            PostView(post: post, showHeaderAndFooter: true)
                .previewLayout(.sizeThatFits)
        }
    }
}
