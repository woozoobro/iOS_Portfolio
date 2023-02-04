//
//  IntroView.swift
//  UserLoginOnboarding
//
//  Created by 우주형 on 2023/02/04.
//

import SwiftUI

struct IntroView: View {
    
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            //background
            RadialGradient(gradient: Gradient(colors: [.purple, .blue]),
                           center: .topLeading,
                           startRadius: 5,
                           endRadius: UIScreen.main.bounds.height)
            .ignoresSafeArea()
            
            Group {
                if currentUserSignedIn {
                    ProfileView()
                        .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
                } else {
                    OnboardingView()
                        .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
                }
            }
            .animation(.spring(), value: currentUserSignedIn)
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
