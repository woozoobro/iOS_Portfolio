//
//  CommentModel.swift
//  FirebaseCloudMessaging
//
//  Created by 우주형 on 2023/08/09.
//

import Foundation

struct CommentModel: Identifiable, Codable {
    let id: String
    var postID: String?
    var userID: String?
    var userProfileURLString: String?
    var username: String?
    var content: String?
    var isDeleted: Bool?
    var dateCreated: Date
    
    var userProfileURL: URL? {
        get {
            if let urlString = self.userProfileURLString {
                return URL(string: urlString)
            } else {
                return nil
            }
        }
    }
    
    ///기본init
    init(id: String = UUID().uuidString,
         postID: String? = nil,
         userID: String? = nil,
         userProfileURLString: String? = nil,
         username: String? = nil, content: String? = nil,
         isDeleted: Bool? = nil,
         dateCreated: Date = Date()
    ) {
        self.id = id
        self.postID = postID
        self.userID = userID
        self.userProfileURLString = userProfileURLString
        self.username = username
        self.content = content
        self.isDeleted = isDeleted
        self.dateCreated = dateCreated
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case postID = "post_id"
        case userID = "user_id"
        case userProfileURLString = "user_profile_url_string"
        case username = "user_name"
        case content
        case isDeleted = "is_deleted"
        case dateCreated = "date_created"
    }
    
    ///새로운 코멘트 만들 때 init
    init(id: String = UUID().uuidString, postID: String, user: DBUser, content: String) {
        self.id = id
        self.postID = postID
        self.userID = user.userId
        self.userProfileURLString = user.profileImagePathUrl
        self.username = user.username
        self.content = content
        self.isDeleted = false
        self.dateCreated = Date()
    }
    
}

extension CommentModel {
    static var sampleComment: CommentModel = CommentModel(id: "1234", postID: "1461246", userID: "1234124", username: "우주형", content: "좋네요 ㅎ", dateCreated: Date())
}
