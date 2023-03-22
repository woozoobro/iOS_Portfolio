//
//  PostArrayObject.swift
//  DogGram2
//
//  Created by 우주형 on 2023/03/22.
//

import Foundation

class PostArrayObject: ObservableObject {
    @Published var dataArray = [PostModel]()
    
    init() {
        print("Fetch from DataBase Here")
        let post1 = PostModel(postID: "", userID: "", username: "Woozoobro", caption: "This is a caption", dateCreated: Date(), likeCount: 0, likedByUser: false)
        let post2 = PostModel(postID: "", userID: "", username: "Jessica", caption: nil,  dateCreated: Date(), likeCount: 0, likedByUser: false)
        let post3 = PostModel(postID: "", userID: "", username: "Emily", caption: "This is a really really long caption hahahahahaha", dateCreated: Date(), likeCount: 0, likedByUser: false)
        let post4 = PostModel(postID: "", userID: "", username: "Christopher",caption: nil, dateCreated: Date(), likeCount: 0, likedByUser: false)
        
        self.dataArray.append(post1)
        self.dataArray.append(post2)
        self.dataArray.append(post3)
        self.dataArray.append(post4)
    }    
}
