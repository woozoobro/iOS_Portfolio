//
//  ProfileView.swift
//  DogGram2
//
//  Created by 우주형 on 2023/04/01.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.colorScheme) var colorScheme
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
                .tint(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowColor)
                .opacity(isMyProfile ? 1 : 0)
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
            ProfileView(isMyProfile: true, profileDisplayName: "Joe", profileUserID: "")
        }
    }
}
