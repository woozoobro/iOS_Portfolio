//
//  PostArrayObject.swift
//  DogGram
//
//  Created by 우주형 on 2023/02/04.
//

import Foundation

class PostArrayObject: ObservableObject {
    
    @Published var dataArray = [PostModel]()
    
    init() {
        print("Fetch from Database Here")
        let post1 = PostModel(postID: "", userID: "", username: "WooZoo", caption: "This is a caption" , dateCreated: Date(), likeCount: 0, likedByUser: false)
        let post2 = PostModel(postID: "", userID: "", username: "Jessica", caption: nil , dateCreated: Date(), likeCount: 0, likedByUser: false)
        let post3 = PostModel(postID: "", userID: "", username: "Steve", caption: "This is a really really long caption hahahahahaha" , dateCreated: Date(), likeCount: 0, likedByUser: false)
        let post4 = PostModel(postID: "", userID: "", username: "Emily", caption: "This is a caption" , dateCreated: Date(), likeCount: 0, likedByUser: false)
        self.dataArray.append(post1)
        self.dataArray.append(post2)
        self.dataArray.append(post3)
        self.dataArray.append(post4)
    }
}
