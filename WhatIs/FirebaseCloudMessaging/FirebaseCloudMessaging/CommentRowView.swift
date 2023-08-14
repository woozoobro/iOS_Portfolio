//
//  CommentRowView.swift
//  Mandarin2
//
//  Created by 우주형 on 2023/04/03.
//

import SwiftUI

struct CommentRowView: View {
    @State var comment: CommentModel
    let isMyComment: Bool
    
    var body: some View {
        ZStack {
            if isMyComment {
                HStack {
                    Spacer(minLength: 0)
                    
                    VStack(alignment: .trailing, spacing: 4) {
                        //MARK: - User Name
                        HStack {
                            Text(comment.dateCreated.timeAgoDisplay())
                                .font(.caption2)
                            
                            if comment.isDeleted == true {
                                Text("익명의 귤")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            } else {
                                Text(comment.username ?? "삭제된 유저")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        HStack {
                            if comment.isDeleted == true {
                                Image(systemName: "info.circle")
                                Text("삭제된 코멘트")
                            } else {
                                Text(comment.content ?? "뭔가 잘못됨")
                            }
                        }
                        .lineSpacing(4)
                        .padding(10)
                        .foregroundColor((comment.isDeleted ?? false) ? .secondary : .primary)
                        .background(Color.orange.opacity(0.4))
                        .cornerRadius(10)
                    }
                }
            } else {
                HStack {
                    //MARK: - Profile Image
                    if comment.isDeleted == true {
                        EmptyView()
                    } else {
//                        ProfileImageView(imageURL: comment.userProfileURL, imageFrame: 32)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        //MARK: - User Name
                        if comment.isDeleted == true {
                            EmptyView()
                        } else {
                            HStack {
                                Text(comment.username ?? "삭제된 유저")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                
                                Text(comment.dateCreated.timeAgoDisplay())
                                    .font(.caption2)
                            }
                        }
                        //MARK: - Content
                        HStack {
                            if comment.isDeleted == true {
                                Image(systemName: "info.circle")
                                Text("삭제된 코멘트")
                            } else {
                                Text(comment.content ?? "뭔가 잘못됨")
                            }
                        }                        
                        .lineSpacing(4)
                        .padding(10)
                        .foregroundColor((comment.isDeleted ?? false) ? .secondary : .primary)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                    }
                    Spacer(minLength: 0)
                }
            }
        }
        .contentShape(RoundedRectangle(cornerRadius: 18))
    }
}

struct CommentRowView_Previews: PreviewProvider {
    static var previews: some View {
        CommentRowView(comment: CommentModel.sampleComment, isMyComment: false)
    }
}
