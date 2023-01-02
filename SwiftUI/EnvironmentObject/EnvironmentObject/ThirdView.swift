//
//  ThirdView.swift
//  EnvironmentObject
//
//  Created by 우주형 on 2023/01/03.
//

import SwiftUI

struct ThirdView: View {
    
    @EnvironmentObject var userProfile: UserProfileSettings
    
    var body: some View {
        VStack (spacing: 30) {
            Text("Current Age: \(userProfile.age)")
            Text("Third View")
            Button {
                userProfile.haveBirthDayParty()
                print("--- button pressed")
            } label: {
                Text("Having Birthday Party")
            }
        }
        .navigationTitle("Third View")
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
            .environmentObject(UserProfileSettings())
    }
}
