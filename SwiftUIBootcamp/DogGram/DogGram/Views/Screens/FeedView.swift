//
//  FeedView.swift
//  DogGram
//
//  Created by 우주형 on 2023/01/31.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            PostView()
            PostView()
            PostView()
            PostView()
            PostView()
        }
        .navigationTitle("Feed View")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FeedView()
        }
    }
}
