//
//  ContentView.swift
//  DownloadingImages
//
//  Created by 우주형 on 2023/02/23.
//

import SwiftUI

struct DownloadingImagesView: View {
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Circle()
                        .frame(width: 50, height: 50)
                    VStack(alignment: .leading) {
                        Text("Hello")
                            .font(.headline)
                        
                        Text("Hello2Hello2Hello2Hello2Hello2Hello2")
                            .foregroundColor(.gray)
                            .italic()
                    }
                }
            }
            .navigationTitle("Downloading Images")
        }
    }
}

struct DownloadingImagesView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImagesView()
    }
}
