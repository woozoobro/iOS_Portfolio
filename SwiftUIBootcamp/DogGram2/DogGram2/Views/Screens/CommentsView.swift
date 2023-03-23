//
//  CommentsView.swift
//  DogGram2
//
//  Created by 우주형 on 2023/03/23.
//

import SwiftUI

struct CommentsView: View {
    @State var submissionText: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                Text("PlaceHolder")
                Text("PlaceHolder")
                Text("PlaceHolder")
                Text("PlaceHolder")
                Text("PlaceHolder")
            }
            
            HStack {
                Image("dog1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .cornerRadius(20)
                TextField("Add a comment here...", text: $submissionText)
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane.fill")
                        .font(.title2)
                }
                .tint(Color.MyTheme.purpleColor)
            }
            .padding(.all, 6)
        }
        .navigationTitle("Comments")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CommentsView()
        }
    }
}
