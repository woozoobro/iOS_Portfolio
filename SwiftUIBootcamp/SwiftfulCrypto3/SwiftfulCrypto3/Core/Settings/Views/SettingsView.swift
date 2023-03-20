//
//  SettingsView.swift
//  SwiftfulCrypto3
//
//  Created by 우주형 on 2023/03/20.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    let defaultURL = URL(string: "https://www.google.com")!
    let youtubeURL = URL(string: "https://www.youtube.com/channel/UCDu6yjwSyDRePL-4yDBnv0Q")!
    
    
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Text("Hi")
                    Text("Hi")
                } header: {
                    Text("header")
                }
                
            }
            .listStyle(.grouped)
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XmarkButton(dismiss: _dismiss)
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
