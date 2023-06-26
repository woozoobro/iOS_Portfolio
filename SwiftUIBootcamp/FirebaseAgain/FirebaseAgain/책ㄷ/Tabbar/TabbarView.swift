//
//  TabbarView.swift
//  FirebaseAgain
//
//  Created by 우주형 on 2023/06/26.
//

import SwiftUI

struct TabbarView: View {
    @Binding var showSignInView: Bool
    var body: some View {
        TabView {
            NavigationStack {
                ProductsView()
            }
            .tabItem {
                Image(systemName: "cart")
                Text("Products")
            }
            
            NavigationStack {
                FavoriteView()
            }
            .tabItem {
                Image(systemName: "star.fill")
                Text("Favorites")
            }            
            
            NavigationStack {
                ProfileView(showSignInView: $showSignInView)
            }
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(showSignInView: .constant(false))
    }
}
