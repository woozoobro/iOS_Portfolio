//
//  NavigationViewBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/16.
//

import SwiftUI

struct NavigationViewBootcamp: View {
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink("This is Navigation Link!") {
                    MyOtherScreen()
                }
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
            }
            .navigationTitle("All Inboxes")
            //.navigationBarTitleDisplayMode(.automatic)
//            .toolbar(.hidden)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink {
                        MyOtherScreen()
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .tint(.purple)
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink {
                        Text("Profile")
                    } label: {
                        Image(systemName: "person")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                    } label: {
                        Image(systemName: "gear")
                    }
                }
            }
        }
    }
}

struct MyOtherScreen: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
                .navigationTitle("Green Screen!")
//                .toolbar(.hidden)
            VStack {
                Button("Back Button") {
                    dismiss()
                }
                
                NavigationLink("Click here") {
                    Text("3rd screen!")
                }
            }
        }
    }
}

struct NavigationViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewBootcamp()
    }
}
