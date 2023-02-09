//
//  SettingsView.swift
//  DogGram
//
//  Created by 우주형 on 2023/02/08.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                //MARK: - Section 1: DogGram
                GroupBox {
                    HStack(alignment: .center, spacing: 10) {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .cornerRadius(12)
                        Text("DogGram is the #1 app for posting pictures of your dog and sharing them across the world. We are a dog-loving community and we're happy to have you!")
                            .font(.footnote)
                    }
                } label: {
                    SettingsLabelView(labelText: "DogGram", labelImage: "dot.radiowaves.left.and.right")
                }
                .padding()
                
                //MARK: - Section 2: Profile
                GroupBox {
                    NavigationLink {
                        SettingsEditTextView(submissionText: "Current Display Name", title: "Display Name", description: "You can edit your display name here. This will be seen by other users on your profile and on your posts!", placeholder: "Your display name here...")
                    } label: {
                        SettingsRowView(leftIcon: "pencil", text: "Display Name", color: Color.MyTheme.purpleColor)
                    }
                    
                    NavigationLink {
                        SettingsEditTextView(submissionText: "Current bio here", title: "Profile Bio", description: "Your bio is a great place to let other users know a little about you. It will be shown on your profile only.", placeholder: "Your bio here...")
                    } label: {
                        SettingsRowView(leftIcon: "text.quote", text: "Bio", color: Color.MyTheme.purpleColor)
                    }
                    
                    NavigationLink {
                        SettingsEditImageView(title: "Profile Picture", description: "Your profile picture will be shown on your profile and on your posts. Most users make it an image of themselves or of their dog!", selectedImage: UIImage(named: "dog1")!)
                    } label: {
                        SettingsRowView(leftIcon: "photo", text: "Profile Picture", color: Color.MyTheme.purpleColor)
                    }
                    
                    SettingsRowView(leftIcon: "figure.walk", text: "Sign out", color: Color.MyTheme.purpleColor)
                } label: {
                    SettingsLabelView(labelText: "Profile", labelImage: "person.fill")
                }
                .padding()
                
                //MARK: - Section3: Application
                GroupBox {
                    
                    Button {
                        openCustomURL(urlString: "https://www.google.com")
                    } label: {
                        SettingsRowView(leftIcon: "folder.fill", text: "Privacy Policy", color: Color.MyTheme.yellowColor)
                    }
                    
                    Button {
                        openCustomURL(urlString: "https://www.yahoo.com")
                    } label: {
                        SettingsRowView(leftIcon: "folder.fill", text: "Terms & Conditions", color: Color.MyTheme.yellowColor)
                    }

                    Button {
                        openCustomURL(urlString: "https://www.bing.com")
                    } label: {
                        SettingsRowView(leftIcon: "globe", text: "DogGram's Website", color: Color.MyTheme.yellowColor)
                    }
                    
                } label: {
                    SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                }
                .padding()
                
                //MARK: - Section 4: Sign Off
                GroupBox {
                    Text("DogGram was mad with love. \n All Rights Reserved \n Cool Apps Inc. \n Copyright 2020❤️")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .padding(.bottom, 80)

            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title)
                    }
                    .tint(.primary)
                }
            }
        }
    }
    
    //MARK: - Functions
    
    func openCustomURL(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
