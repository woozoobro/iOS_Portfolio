//
//  IntroView.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/19.
//

import SwiftUI

struct IntroView: View {
    
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        
        ZStack {
            // background
            RadialGradient(gradient: Gradient(colors: [.blue, .purple]), center: .topLeading, startRadius: 5, endRadius: UIScreen.main.bounds.height).ignoresSafeArea()
            
            if currentUserSignedIn {
                Text("Profile View")
            } else {
                Text("Onboarding View")
            }
            
            // if user is signed in
            // profile view
            // else
            // onboarding
            
        }
        
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
