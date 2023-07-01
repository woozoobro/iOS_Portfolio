//
//  ProfileView.swift
//  FirebaseAgain
//
//  Created by 우주형 on 2023/06/22.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    @Binding var showSignInView: Bool
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var url: URL? = nil
    
    let preferenceOptions: [String] = ["Sports", "Movies", "Books"]
    
    private func preferenceIsSelected(text: String) -> Bool {
        viewModel.user?.preferences?.contains(text) == true
    }
    
    var body: some View {
        List {
            if let user = viewModel.user {
                Text("UserId: \(user.userId)")
                
                if let isAnonymous = user.isAnonymous {
                    Text("Is Anonymous: \(isAnonymous.description.capitalized)")
                }
                
                Button {
                    viewModel.togglePremiumStatus()
                } label: {
                    Text("User is premium: \((user.isPremium ?? false).description)")
                }
                
                VStack {
                    HStack {
                        ForEach(preferenceOptions, id:\.self) { preference in
                            Button(preference) {
                                if preferenceIsSelected(text: preference) {
                                    viewModel.removeUserPreference(text: preference)
                                } else {
                                    viewModel.addUserPreference(text: preference)
                                }
                            }
                            .font(.headline)
                            .buttonStyle(.borderedProminent)
                            .tint(preferenceIsSelected(text: preference) ? .green : .red)
                        }
                    }
                    
                    Text("User preferences: \((user.preferences ?? []).joined(separator: ", "))")
                        .frame(maxWidth:.infinity, alignment: .leading)
                }
                
                Button {
                    if user.favoriteMovie == nil {
                        viewModel.addFavoriteMovie()
                    } else {
                        viewModel.removeFavoriteMovie()
                    }
                } label: {
                    Text("Favorite Movie: \(user.favoriteMovie?.title ?? "")")
                }
                
                PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                    Text("Select a photo")
                }
                
                if let urlString = viewModel.user?.profileImagePath, let url = URL(string: urlString) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)
                    } placeholder: {
                        ProgressView()
                            .frame(width: 150, height: 150)
                    }
                }
                
                if viewModel.user?.profileImagePath != nil {
                    Button("Delete image") {
                        viewModel.deleteProfileImage()
                    }
                }
            }
        }
        .task {
            try? await viewModel.loadCurrentUser()
            if let user = viewModel.user , let path = user.profileImagePath {
                self.url = try? await StorageManager.shared.getUrlForImage(path: path)
            }
        }
        .onChange(of: selectedItem, perform: { newValue in
            if let newValue {
                viewModel.saveProfileImage(item: newValue)
            }
        })
        .navigationTitle("Profile")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    SettingsView(showSignInView: $showSignInView)
                } label: {
                    Image(systemName: "gear")
                        .font(.headline)
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
