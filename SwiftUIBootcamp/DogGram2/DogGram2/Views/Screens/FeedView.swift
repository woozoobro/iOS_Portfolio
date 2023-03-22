//
//  FeedView.swift
//  DogGram2
//
//  Created by 우주형 on 2023/03/21.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var posts: PostArrayObject
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                ForEach(posts.dataArray) { post in
                    PostView(post: post)
                }
            }
        }
        .navigationTitle("Feed View")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FeedView(posts: PostArrayObject())            
        }
    }
}
