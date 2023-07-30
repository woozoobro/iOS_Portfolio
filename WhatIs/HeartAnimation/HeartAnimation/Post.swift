//
//  Post.swift
//  HeartAnimation
//
//  Created by 우주형 on 2023/07/17.
//

import Foundation

struct Post: Identifiable {
    var id = UUID().uuidString
    var imageName: String
    var isLiked: Bool = false
}
