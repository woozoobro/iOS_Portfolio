//
//  PostImageView.swift
//  DogGram2
//
//  Created by 우주형 on 2023/03/30.
//

import SwiftUI

struct PostImageView: View {
    @Environment(\.dismiss) var dismiss
    @State var captionText: String = ""
    @Binding var imageSelected: UIImage
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.title)
                        .padding()
                }
                .tint(.primary)
                Spacer()
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                Image(uiImage: imageSelected)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .cornerRadius(12)
                    .clipped()
                TextField("Add your caption here...", text: $captionText)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.beigeColor.cornerRadius(12))
                    .font(.headline)
                    .padding(.horizontal)
                    .textInputAutocapitalization(.sentences)
                
                Button {
                    postPicture()
                } label: {
                    Text("Post Picture!".uppercased())
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(Color.MyTheme.purpleColor.cornerRadius(12))
                        .padding(.horizontal)
                }
                .tint(Color.MyTheme.yellowColor)

            }
        }
    }
    
    //MARK: - Functions
    
    func postPicture() {
        print("Post Picture To Database Here")
    }
    
}

struct PostImageView_Previews: PreviewProvider {
    @State static var image = UIImage(named: "dog1")!
    
    static var previews: some View {
        PostImageView(imageSelected: $image)
    }
}
