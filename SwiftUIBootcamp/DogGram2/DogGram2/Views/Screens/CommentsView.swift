//
//  CommentsView.swift
//  DogGram2
//
//  Created by 우주형 on 2023/03/23.
//

import SwiftUI

struct CommentsView: View {
    @State var submissionText: String = ""
    @State var commentArray = [CommentModel]()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(commentArray) { comment in
                        MessageView(comment: comment)
                    }
                }
            }
            
            HStack {
                Image("dog1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .cornerRadius(20)
                TextField("Add a comment here...", text: $submissionText)
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane.fill")
                        .font(.title2)
                }
                .tint(Color.MyTheme.purpleColor)
            }
            .padding(.all, 6)
        }
        .navigationTitle("Comments")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            getComments()
        }
    }
    
    //MARK: - Functions
    func getComments() {
        print("Get Comments from Database")
        let comment1 = CommentModel(commentID: "", userID: "", username: "woozoobro", content: "This is the first Comment", dateCreated: Date())
        let comment2 = CommentModel(commentID: "", userID: "", username: "alex", content: "This is the second Comment", dateCreated: Date())
        let comment3 = CommentModel(commentID: "", userID: "", username: "stefanie", content: "This is the third Comment", dateCreated: Date())
        let comment4 = CommentModel(commentID: "", userID: "", username: "chris", content: "This is the fourth Comment", dateCreated: Date())
        self.commentArray.append(comment1)
        self.commentArray.append(comment2)
        self.commentArray.append(comment3)
        self.commentArray.append(comment4)
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CommentsView()
        }
    }
}
