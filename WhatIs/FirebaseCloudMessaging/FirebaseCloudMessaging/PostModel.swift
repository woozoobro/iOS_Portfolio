//
//  PostModel.swift
//  FirebaseCloudMessaging
//
//  Created by 우주형 on 2023/08/09.
//

import Foundation

struct PostModel: Identifiable, Codable, Hashable {
    let id: String
    let userID: String?
    var userProfileURLString: String?
    var username: String?
    var content: String?
    var dateCreated: Date?
    var likedByUsers: [String]?
    var commentsCount: Int?
        
    var userProfileURL: URL? {
        get {
            if let urlString = self.userProfileURLString {
                return URL(string: urlString)
            } else {
                return nil
            }
        }
//        set {
//            if let url = newValue {
//                self.userProfileURLString = url.absoluteString
//            } else {
//                self.userProfileURLString = nil
//            }
//        }
    }
    
    init(
        id: String = UUID().uuidString,
        userID: String?,
        userProfileURLString: String?,
        username: String?,
        content: String?,
        dateCreated: Date?,
        likedByUsers: [String]?,
        commentsCount: Int?
    ) {
        self.id = id
        self.userID = userID
        self.userProfileURLString = userProfileURLString
        self.username = username
        self.content = content
        self.dateCreated = dateCreated
        self.likedByUsers = likedByUsers
        self.commentsCount = commentsCount
    }

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case userProfileURLString = "user_profile_url_string"
        case username = "user_name"
        case content
        case dateCreated = "date_created"
        case likedByUsers = "liked_by_user"
        case commentsCount = "comments_count"
    }
    
    ///init When just Posting
    init(id: String = UUID().uuidString, user: DBUser, content: String) {
        self.id = id
        self.userID = user.userId
        self.userProfileURLString = user.profileImagePathUrl
        self.username = user.username
        self.content = content
        self.dateCreated = Date()
        self.likedByUsers = []
        self.commentsCount = 0
    }
}

/// mock
extension PostModel {
    static var samplePost: PostModel = PostModel(userID: "something", userProfileURLString: nil, username: "우주형님", content: "설명이 될거에요,설명이 될거에요,설명이 될거에요,설명이 될거에요,설명이 될거에요,설명이 될거에요, https://www.naver.com", dateCreated: Date(), likedByUsers: [], commentsCount: 0)
}
