//
//  UploadView.swift
//  DogGram2
//
//  Created by 우주형 on 2023/03/27.
//

import SwiftUI
import UIKit

struct UploadView: View {
    @State var showImagePicker: Bool = false
    @State var imageSelected: UIImage = UIImage(named: "logo")!
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @State var showPostImageView: Bool = false
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Button {
                    sourceType = UIImagePickerController.SourceType.camera
                    showImagePicker.toggle()
                } label: {
                    Text("Take photo".uppercased())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.MyTheme.yellowColor)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.MyTheme.purpleColor)
                
                Button {
                    sourceType = UIImagePickerController.SourceType.photoLibrary
                    showImagePicker.toggle()
                } label: {
                    Text("Import photo".uppercased())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.MyTheme.purpleColor)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.MyTheme.yellowColor)
            }
            .sheet(isPresented: $showImagePicker) {
                segueToPostImageView()
            } content: {
                ImagePicker(imageSelected: $imageSelected, sourceType: $sourceType)
                    .preferredColorScheme(colorScheme)
                    .tint(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowColor)
            }
            
            Image("logo.transparent")
                .resizable().scaledToFit().frame(width: 100, height: 100)
                .shadow(radius: 12)
                .fullScreenCover(isPresented: $showPostImageView) {
                    PostImageView(imageSelected: $imageSelected)
                        .preferredColorScheme(colorScheme)
                }
        }
    }
    
    //MARK: - Functions
    func segueToPostImageView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            showPostImageView.toggle()
        }
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
            .preferredColorScheme(.dark)
    }
}
