//
//  ProfileView.swift
//  LoginSample
//
//  Created by 우주형 on 2023/01/19.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("user_signIn") var userSignIn: Bool = false
    @AppStorage("name") var userName: String?
    @AppStorage("age") var userAge: Int?
    @AppStorage("gender") var userGender: String?
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            Text("유저의 이름은 \(userName ?? "노유저")")
            Text("유저의 나이는 \(userAge ?? 0)")
            Text("유저의 성별은 \(userGender ?? "노유저")")
            
            Text("로그아웃")
                .foregroundColor(.white)
                .padding(20)
                .background(.blue).cornerRadius(.infinity)
                .onTapGesture {
                    signOut()
                }
        }
        .font(.system(size: 30))
        .foregroundColor(.purple)
        .padding()
        .padding(.vertical, 40)
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 20)
    }
}

extension ProfileView {
    
    func signOut() {
        userName = nil
        userAge = nil
        userGender = nil
        userSignIn = false
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
