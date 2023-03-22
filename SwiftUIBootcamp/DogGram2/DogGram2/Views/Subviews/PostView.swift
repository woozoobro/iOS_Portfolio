//
//  PostView.swift
//  DogGram2
//
//  Created by 우주형 on 2023/03/21.
//

import SwiftUI

struct PostView: View {
    
    @State var post: PostModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            HStack {
                //MARK: - "Header"
                Image("dog1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .cornerRadius(15)
                
                Text(post.username)
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                Spacer()
                Image(systemName: "ellipsis")
                    .font(.headline)
            }
            .padding(6)
            
            //MARK: - Image
            Image("dog1")
                .resizable()
                .scaledToFit()
            
            //MARK: - Footer
            HStack(alignment: .center, spacing: 20) {
                Image(systemName: "heart")
                Image(systemName: "bubble.middle.bottom")
                Image(systemName: "paperplane")
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

struct PostView_Previews: PreviewProvider {
    
    static var post: PostModel = PostModel(postID: "", userID: "", username: "Woozoobro", caption: "This is a test caption", dateCreated: Date(), likeCount: 0, likedByUser: false)
    
    static var previews: some View {
        PostView(post: post)
            .previewLayout(.sizeThatFits)
    }
}
