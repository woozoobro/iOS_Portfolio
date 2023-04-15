//
//  Enums&Structs.swift
//  DogGram
//
//  Created by 우주형 on 2023/04/04.
//

import Foundation

struct DatabaseUserField { // Fields within the User Document in Database
    
    static let displayName = "display_name"
    static let email = "email"
    static let providerID = "provider_id"
    static let provider = "provider"
    static let userID = "user_id"
    static let bio = "bio"
    static let dateCreated = "date_created"
    
}

struct DatabasePostField { // Field within Post Document in Database
    static let postID = "post_id"
    static let userID = "user_id"
    static let displayName = "display_name"
    static let caption = "caption"
    static let dateCreated = "date_created"
}

struct CurrentUserDefaults { // Fields for UserDefaults saved within app
    static let displayName = "display_name"
    static let bio = "bio"
    static let userID = "user_id"
}
