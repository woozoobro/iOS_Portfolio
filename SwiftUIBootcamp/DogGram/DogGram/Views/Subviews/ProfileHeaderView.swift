//
//  ProfileHeaderView.swift
//  DogGram
//
//  Created by 우주형 on 2023/02/07.
//

import SwiftUI

struct ProfileHeaderView: View {
    @Binding var profileDisplayName: String
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            
            //MARK: - Profile picture
            Image("dog1")
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120, alignment: .center)
                .cornerRadius(60)
            //MARK: - Bio
            Text(profileDisplayName)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Text in here for the bio!")
                .font(.body)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
            //MARK: - Posts
            HStack(alignment: .center, spacing: 20) {
                VStack(alignment: .center, spacing: 5) {
                    Text("5")
                        .font(.title2)
                        .fontWeight(.bold)
                    Capsule()
                        .fill(Color.gray)
                        .frame(width: 20, height: 2, alignment: .center)
                    Text("Posts")
                        .font(.callout)
                        .fontWeight(.medium)
                }
                //MARK: - Likes                
                VStack(alignment: .center, spacing: 5) {
                    Text("20")
                        .font(.title2)
                        .fontWeight(.bold)
                    Capsule()
                        .fill(Color.gray)
                        .frame(width: 20, height: 2, alignment: .center)
                    Text("Likes")
                        .font(.callout)
                        .fontWeight(.medium)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    @State static var name: String = "Woozoo"
    static var previews: some View {
        ProfileHeaderView(profileDisplayName: $name)
            .previewLayout(.sizeThatFits)
    }
}
