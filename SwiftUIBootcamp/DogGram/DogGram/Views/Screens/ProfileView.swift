//
//  ProfileView.swift
//  DogGram
//
//  Created by 우주형 on 2023/02/07.
//

import SwiftUI

struct ProfileView: View {
    var isMyProfile: Bool
    
    @State var profileDisplayName: String
    var profileUserID: String
    var posts = PostArrayObject()
    
    @State var showSettings: Bool = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ProfileHeaderView(profileDisplayName: $profileDisplayName)
            Divider()
            ImageGridView(posts: posts)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showSettings.toggle()
                } label: {
                    Image(systemName: "line.horizontal.3")
                }
                .tint(Color.MyTheme.purpleColor)
                .opacity(isMyProfile ? 1.0 : 0.0)
            }
        }
        .sheet(isPresented: $showSettings) {
            SettingsView()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView(isMyProfile: true, profileDisplayName: "Woozoo", profileUserID: "")
        }
    }
}
