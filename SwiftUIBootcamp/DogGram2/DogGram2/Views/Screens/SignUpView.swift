//
//  SignUpView.swift
//  DogGram2
//
//  Created by 우주형 on 2023/04/01.
//

import SwiftUI

struct SignUpView: View {
    @State var showOnboarding: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image("logo.transparent")
                .resizable().scaledToFit()
                .frame(width: 100, height: 100)
            Text("You're not signed in! 🙁")
                .font(.largeTitle)
                .fontWeight(.bold)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundColor(Color.MyTheme.purpleColor)
            Text("Click the button below to create an account and join the fun!")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.MyTheme.purpleColor)
            
            Button {
                showOnboarding.toggle()
            } label: {
                Text("Sing in / Sign up".uppercased())
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color.MyTheme.purpleColor)
                    .cornerRadius(12)
                    .shadow(radius: 12)
            }
            .tint(Color.MyTheme.yellowColor)
            Spacer()
            Spacer()
        }
        .padding(40)
        .background(Color.MyTheme.yellowColor)
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showOnboarding) {
            OnboardingView()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .preferredColorScheme(.dark)
    }
}
