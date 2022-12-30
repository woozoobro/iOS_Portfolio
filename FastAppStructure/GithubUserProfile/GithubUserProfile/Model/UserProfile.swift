//
//  UserProfile.swift
//  GithubUserProfile
//
//  Created by 우주형 on 2022/12/31.
//

import Foundation

struct UserProfile: Hashable, Identifiable, Decodable {
    var login: String
    var id: Int64
    var name: String
    
    var avatarUrl: URL
    var htmlUrl: String
    var followers: Int
    var following: Int
    
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case name
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
        case followers
        case following
    }
}
