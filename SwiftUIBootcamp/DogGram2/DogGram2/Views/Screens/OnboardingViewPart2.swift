//
//  OnboardingViewPart2.swift
//  DogGram2
//
//  Created by 우주형 on 2023/04/01.
//

import SwiftUI

struct OnboardingViewPart2: View {
    @State var displayName: String = ""
    @State var showImagePicker: Bool = false
    
    // For ImagePicker
    @State var imageSelected: UIImage = UIImage(named: "logo")!
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        VStack(spacing: 20) {
            Text("What's your name?")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.MyTheme.yellowColor)
            
            TextField("Add your name here...", text: $displayName)
                .padding()
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color.MyTheme.beigeColor)
                .cornerRadius(12)
                .font(.headline)
                .textInputAutocapitalization(.sentences)
                .padding(.horizontal)
            
            Button {
                showImagePicker.toggle()
            } label: {
                Text("Finish: Add profile picture")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.yellowColor)
                    .cornerRadius(12)
                    .padding(.horizontal)
            }
            .tint(Color.MyTheme.purpleColor)
            .opacity(displayName != "" ? 1.0 : 0)
            .animation(.spring(), value: displayName)
            .sheet(isPresented: $showImagePicker) {
                createProfile()
            } content: {
                ImagePicker(imageSelected: $imageSelected, sourceType: $sourceType)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.MyTheme.purpleColor)
        .ignoresSafeArea()
    }
    
    //MARK: - Functions
    func createProfile() {
        print("Create Profile Now")
    }
}

struct OnboardingViewPart2_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewPart2()
    }
}
