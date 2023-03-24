//
//  MessageView.swift
//  DogGram2
//
//  Created by 우주형 on 2023/03/23.
//

import SwiftUI

struct MessageView: View {
    @State var comment: CommentModel
    
    var body: some View {
        HStack {
            //MARK: - Profile Image
            Image("dog1")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .cornerRadius(20)
            VStack(alignment: .leading, spacing: 4) {
                //MARK: - User Name
                Text(comment.username)
                    .font(.caption)
                    .foregroundColor(.gray)
                //MARK: - Content
                Text(comment.content)
                    .padding(10)
                    .foregroundColor(.primary)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
            }
            Spacer(minLength: 0)
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var comment: CommentModel = CommentModel(commentID: "", userID: "", username: "Woozoobro", content: "This photo is really cool. haha", dateCreated: Date())
    
    static var previews: some View {
        MessageView(comment: comment)
            .previewLayout(.sizeThatFits)
    }
}
