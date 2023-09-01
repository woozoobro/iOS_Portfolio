//
//  Home.swift
//  SwiftUIImageViewer
//
//  Created by 우주형 on 2023/08/23.
//

import SwiftUI

struct Home: View {
    
    @StateObject var homeData = HomeViewModel()
    
    var body: some View {
        ScrollView {
            
            // Tweet View...
            HStack(alignment: .top, spacing: 15) {
                Image(systemName: "square.and.arrow.up.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                VStack(alignment: .leading, spacing: 10) {
                    Group {
                        Text("우주형")
                            .bold()
                        +
                        Text("천재")
                            .foregroundColor(.gray)
                        Text("#ios #swiftui #mandarin")
                            .foregroundColor(.blue)
                        Text("Adding New Photos :)")
                    }
                    
                    // Our Custom Grid of Items...
                    let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
                     
                    LazyVGrid(columns: columns, alignment: .leading,spacing: 10) {
                        ForEach(homeData.allImages.indices, id: \.self) { index in
                            GridImageView(index: index)
                        }
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .overlay {
            // Image Viewer...
            ZStack {
                if homeData.showImageViewer {
                    ImageView()
                }
            }
        }
        .environmentObject(homeData)
    }
    

}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
