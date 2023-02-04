//
//  ContentView.swift
//  LoginSample
//
//  Created by 우주형 on 2023/01/19.
//

import SwiftUI

struct IntroView: View {
    
    @AppStorage("user_signIn") var userSignIn: Bool = false
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [.blue, .purple], center: .topLeading, startRadius: 5, endRadius: 900).ignoresSafeArea()

                Group {
                    if userSignIn {
                        ProfileView()
                            .transition(AnyTransition.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
                    } else {
                        OnboardingView()
                            .transition(AnyTransition.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
                    }
                }
                .animation(.spring(), value: userSignIn)
        }        
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
