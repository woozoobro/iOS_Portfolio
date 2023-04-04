//
//  OnboardingViewPart2.swift
//  DogGram
//
//  Created by 우주형 on 2023/02/09.
//

import SwiftUI

struct OnboardingViewPart2: View {
    @Binding var displayName: String
    @Binding var email: String
    @Binding var providerID: String
    @Binding var provider: String
    
    @State var showImagePicker: Bool = false
    
    // For image picker
    @State var imageSelected: UIImage = UIImage(named: "logo")!
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @State var showError: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
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
                .autocapitalization(.sentences)
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
            .opacity(displayName != "" ? 1.0 : 0.0)
            .animation(.easeOut(duration: 0.5), value: displayName)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.MyTheme.purpleColor)
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $showImagePicker) {
            createProfile()
        } content: {
            ImagePicker(imageSelected: $imageSelected, sourceType: $sourceType)
        }
        .alert(isPresented: $showError) {
            return Alert(title: Text("Error creating profile😤"))
        }

    }
    
    //MARK: - Functions
    func createProfile() {
        print("Create Profile Now")
        AuthService.instance.createNewUserInDatabase(name: displayName, email: email, providerID: providerID, provider: provider, profileImage: imageSelected) { returnedUserID in
            if let userID = returnedUserID {
                // Success
                
            } else {
                // Error
                print("Error creating user in Database")
                self.showError.toggle()
            }
        }
    }
}

struct OnboardingViewPart2_Previews: PreviewProvider {
    
    @State static var testString: String = "Test"
    
    static var previews: some View {
        OnboardingViewPart2(displayName: $testString, email: $testString, providerID: $testString, provider: $testString)
    }
}
