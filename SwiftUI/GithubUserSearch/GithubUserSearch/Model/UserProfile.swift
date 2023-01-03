//
//  UserProfile.swift
//  GithubUserSearch
//
//  Created by 우주형 on 2023/01/03.
//

import Foundation

struct UserProfile: Hashable, Identifiable, Decodable {
    
    var id: Int64
    var login: String
    var name: String
    var avatarUrl: URL
    var htmlUrl: String
    var followers: Int
    var following: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case login
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
        case followers
        case following
    }
}

extension UserProfile {
    static let mock = UserProfile(
        id: 99154211,
        login: "woozoobro",
        name: "JuHyeong Woo",
        avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/99154211?v=4")!,
        htmlUrl: "https://github.com/woozoobro",
        followers: 0,
        following: 1)
}
