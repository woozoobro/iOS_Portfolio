//
//  OnboardingView.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/19.
//

import SwiftUI

struct OnboardingView: View {
    
    // Onboarding states:
    /*
     0 - Welcome Screen
     1 - Add name
     2 - Add age
     3 - Add gender
     */
    @State var onboardingState: Int = 0
    
    var body: some View {
        ZStack {
            // content
            ZStack {
                switch onboardingState {
                case 0:
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.brown)
                default:
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.green)
                }
            }
            // buttons
            VStack {
                Spacer()
                bottomButton
            }
            .padding(30)
        }
    }
    

}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .background(.purple)
    }
}

//MARK: - Components
extension OnboardingView {
    private var bottomButton: some View {
        Text("Sign in")
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(10)
            .onTapGesture {
                
            }
    }
}
