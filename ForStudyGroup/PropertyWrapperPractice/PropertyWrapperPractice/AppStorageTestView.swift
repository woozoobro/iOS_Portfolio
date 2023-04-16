//
//  AppStorageTestView.swift
//  PropertyWrapperPractice
//
//  Created by 우주형 on 2023/04/15.
//

import SwiftUI

struct AppStorageTestView: View {
    @AppStorage("onboarding") var isOnboardingActive: Bool = true
    
    var body: some View {
        ZStack {
            if isOnboardingActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingActive: Bool = true
    let maxCount: Int = 8
    @State private var timerAdded: Bool = false
    @State private var selection: Int = 1
    
    var body: some View {
        VStack {
            TabView(selection: $selection) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.green)
                    .tag(1)
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue)
                    .tag(2)
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.purple)
                    .tag(3)
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.purple)
                    .tag(4)
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.purple)
                    .tag(5)
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.purple)
                    .tag(6)
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.purple)
                    .tag(7)
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.black)
                    .tag(8)
            }
            .animation(.spring(), value: selection)
            .padding()
            .frame(height: 300)
            .tabViewStyle(.page)

            Text("This is OnboardingView")
                .font(.largeTitle)
            
            //MARK: - Set UserDefaults
            Button("로그인!") {
                UserDefaults.standard.set(false, forKey: "onboarding")
            }
            .font(.largeTitle).fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .background(.blue).cornerRadius(20)
        }
        .onAppear {
            if !timerAdded {
                addTimer()
            }
        }
    }
    
    func addTimer() {
        timerAdded = true
        let timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { timer in
            selection = selection == (maxCount) ? 1 : selection + 1
        }
        timer.fire()
    }
}

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingActive: Bool = false
    
    var body: some View {
        VStack {
            Text("This is HomeView")
                .font(.largeTitle)
            //MARK: - Set UserDefaults
            Button("로그 아웃!") {
                UserDefaults.standard.set(true, forKey: "onboarding")
            }
            .font(.largeTitle).fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .background(.orange).cornerRadius(20)
        }
    }
}

struct AppStorageTestView_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageTestView()
    }
}
