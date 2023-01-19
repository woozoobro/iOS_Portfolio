//
//  OnboardingView.swift
//  LoginSample
//
//  Created by 우주형 on 2023/01/19.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("user_signIn") var userSignIn: Bool = false
    @AppStorage("name") var userName: String?
    @AppStorage("age") var userAge: Int?
    @AppStorage("gender") var userGender: String?
    
    @State var onboardingState: Int = 0
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    
    @State var name: String = ""
    @State var age: Double = 20.0
    @State var gender: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                switch onboardingState {
                    
                case 0: welcomeSection
                        .transition(transition)
                case 1: addNameSection
                        .transition(transition)
                case 2: addAgeSection
                        .transition(transition)
                case 3: addGenderSection
                        .transition(transition)
                    
                default: Text("Section 구성하자")
                }
                Spacer()
                nextButton
            }
            .alert(isPresented: $showAlert) {
                return Alert(title: Text(alertTitle))
            }
        }
    }
}

extension OnboardingView {
    private var nextButton: some View {
        Text(onboardingState == 0 ? "로그인하기" : "다음으로" )
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white).cornerRadius(10)
            .onTapGesture {
                nextButtonTapped()
            }
            .padding(20)
    }
    
    private var welcomeSection: some View {
        VStack(spacing: 40) {
            Spacer()
            Image(systemName: "rectangle.portrait.and.arrow.forward")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
            Text("로그인 해볼까요?")
                .font(.largeTitle)
                .overlay(
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 10), alignment: .bottom
                )
            Text("로그인을 해서 AppStorage를 한번 사용해 볼 거에요. 그리고 사용자의 로그인 정보를 저장하는 방법을 알아보고 UserDefaults랑 어떤 차이점이 있는지 살펴봅시다.")
                .font(.headline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                
            Spacer()
            Spacer()
        }
        .padding(.horizontal, 40)
        .foregroundColor(.white)
    }
    
    private var addNameSection: some View {
        VStack(spacing: 40) {
            Spacer()
            
            Text("이름이 뭐에요?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .overlay(
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 10), alignment: .bottom
                )
            TextField("이름을 입력하세요", text: $name)
                .foregroundColor(.black)
                .padding()
                .background(.white).cornerRadius(12)
                
                
            Spacer()
            Spacer()
        }
        .padding(.horizontal, 40)
        .foregroundColor(.white)
    }
    
    private var addAgeSection: some View {
        VStack(spacing: 40) {
            Spacer()
            
            Text("몇 살이에요?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .overlay(
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 10), alignment: .bottom
                )
            Slider(value: $age, in: 1...50, step: 1.0)
                .tint(.white)
            
            
            let ageToString = String(format: "%.0f", age)
            Text(ageToString)
                .font(.system(size: 100))
                
                
            Spacer()
            Spacer()
        }
        .padding(.horizontal, 40)
        .foregroundColor(.white)
    }
    
    private var addGenderSection: some View {
        VStack(spacing: 40) {
            Spacer()
            
            Text("성별은 어떻게 되나요?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .overlay(
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 10), alignment: .bottom
                )
            Picker("성별", selection: $gender) {
                Text("남자").tag("남자")
                Text("여자").tag("여자")
                Text("Non-Binary").tag("Non-Binary")
            }.pickerStyle(.menu)
            .tint(.white)
                
            Spacer()
            Spacer()
        }
        .padding(.horizontal, 40)
        .foregroundColor(.white)
    }
    
    func nextButtonTapped() {
        
        switch onboardingState {
        case 1:
            guard name.count >= 3 else {
                getAlert(title: "3글자 이상의 이름을 입력해주세요🤣")
                return
            }
        case 3:
            guard gender.count > 0 else {
                getAlert(title: "성별을 선택해주세요🥹")
                return
            }
        default: break
        }
        
        if onboardingState == 3 {
            userSignIn = true
            userName = name
            userAge = Int(age)
            userGender = gender
        } else {
            withAnimation(.spring()) {
                onboardingState += 1
            }
        }
    }
    
    func getAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .background(.purple)
    }
}
