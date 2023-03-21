//
//  PostView.swift
//  DogGram2
//
//  Created by 우주형 on 2023/03/21.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            HStack {
                //MARK: - "Header"
                Image("dog1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .cornerRadius(15)
                
                Text("User name here")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                Spacer()
                Image(systemName: "ellipsis")
                    .font(.headline)
            }
            .padding(6)
            
            //MARK: - Image
            Image("dog1")
                .resizable()
                .scaledToFit()
            
            //MARK: - Footer
            HStack(alignment: .center, spacing: 20) {
                Image(systemName: "heart")
                Image(systemName: "bubble.middle.bottom")
                Image(systemName: "paperplane")
                Spacer()
            }
            .font(.title3)
            .padding(6)
            
            HStack {
                Text("This is the caption for the photo!")
                Spacer(minLength: 0)
            }
            .padding(6)
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
            .previewLayout(.sizeThatFits)
    }
}
