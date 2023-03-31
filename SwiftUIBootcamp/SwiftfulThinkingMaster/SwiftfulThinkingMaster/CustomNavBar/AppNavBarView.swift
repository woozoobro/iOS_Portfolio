//
//  AppNavBarView.swift
//  SwiftfulThinkingMaster
//
//  Created by 우주형 on 2023/03/31.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
        CustomNavView {
            ZStack {
                Color.orange.ignoresSafeArea()
                
                CustomNavLink {
                    Text("Desti custom")
                        .customNavigationTitle("Second Screen")
                        .customNavigationSubTitle("Showing!!")
                } label: {
                    Text("Navigate")
                }
            }
            .customNavBarItems(title: "NewTitle", subtitle: nil, backButtonHidden: true)
        }
    }
}

extension AppNavBarView {
    
    private var defaultNavView: some View {
        NavigationView {
            ZStack {
                Color.green.ignoresSafeArea()
                
                NavigationLink {
                    Text("Destination")
                        .navigationTitle("Title 2")
                        .navigationBarBackButtonHidden(false)
                } label: {
                    Text("Navigate")
                }

            }
            .navigationTitle("Nav title here")
        }
    }
    
}

struct AppNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavBarView()
    }
}
