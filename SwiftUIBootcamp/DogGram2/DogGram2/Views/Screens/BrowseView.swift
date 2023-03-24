//
//  BrowseView.swift
//  DogGram2
//
//  Created by 우주형 on 2023/03/24.
//

import SwiftUI

struct BrowseView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            CarouselView()
        }
        .navigationTitle("Browse")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BrowseView()
        }
    }
}
