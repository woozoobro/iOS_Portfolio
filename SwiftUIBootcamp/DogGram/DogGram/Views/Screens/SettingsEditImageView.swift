//
//  SettingsEditImageView.swift
//  DogGram
//
//  Created by 우주형 on 2023/02/09.
//

import SwiftUI

struct SettingsEditImageView: View {
    
    @State var title: String
    @State var description: String
    @State var selectedImage: UIImage // Image shown on this screen
    @State var sourceType: UIImagePickerController.SourceType = UIImagePickerController.SourceType.photoLibrary
    
    @State var showImagePicker: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text(description)
                Spacer(minLength: 0)
            }
            Image(uiImage: selectedImage)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .clipped()
                .cornerRadius(12)
            
            Button {
                showImagePicker.toggle()
            } label: {
                Text("Import".uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.yellowColor)
                    .cornerRadius(12)
            }
            .tint(Color.MyTheme.purpleColor)
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(imageSelected: $selectedImage, sourceType: $sourceType)
            }
            
            Button {
                
            } label: {
                Text("Save".uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.purpleColor)
                    .cornerRadius(12)
            }
            .tint(Color.MyTheme.yellowColor)

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .navigationTitle(title)
    }
}

struct SettingsEditImageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsEditImageView(title: "Title", description: "Description", selectedImage: UIImage(named: "dog1")!)
        }
    }
}
