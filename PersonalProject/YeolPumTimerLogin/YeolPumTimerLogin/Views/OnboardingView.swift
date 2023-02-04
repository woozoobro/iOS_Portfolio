//
//  ContentView.swift
//  YeolPumTimerLogin
//
//  Created by 우주형 on 2023/02/04.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("user_signin") var userSignIn: Bool = false
    @AppStorage("user_email") var userEmail: String?
    
    @State var loginState: Int = 0
    @State var toggleCheck: Bool = false
    @State var emailTextField: String = ""
    @State var passwordTextField: String = ""
    @State var passwordCheckField: String = ""
    
    @State var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            switch loginState {
            case 0:
                startSection
                    
            case 1:
                selectLoginSection
                    .transition(.opacity)
            case 2:
                termsAgreeSection
                    .transition(.asymmetric(
                        insertion: .move(edge: .trailing),
                        removal: .identity))
            case 3:
                signInSection
                    .transition(.asymmetric(
                        insertion: .move(edge: .trailing),
                        removal: .identity))
            case 4:
                LoginView()
            default:
                Text("Hello")
            }
        }
    }
}

//MARK: - Components
extension OnboardingView {
    private var header: some View {
        VStack(spacing: 20) {
            Image("logo1")
                .resizable()
                .scaledToFit()
                .frame(width: 100,height: 100)
                .shadow(color: Color.orange.opacity(0.3), radius: 10, x: 4, y: 10)
            
            Text("공부, 혼자 하지 말고 열품타에서 함께 하세요!")
                .fontWeight(.medium)
        }
    }
    
    private var startNewButton: some View {
        
        Button {
            withAnimation(.easeInOut(duration: 0.2)) {
                loginState += 1
            }
        } label: {
            Text("새로 시작하기")
                .fontWeight(.heavy)
        }
        .tint(.orange)
        .frame(height: 40)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(style: StrokeStyle(lineWidth: 1))
                .foregroundColor(.orange)
        )
        .padding(.horizontal)
    }
    
    private var loginButton: some View {
        Button {
            
        } label: {
            Text("로그인")
                .fontWeight(.black)
        }
        .tint(.orange)
        .frame(height: 40)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(style: StrokeStyle(lineWidth: 1))
                .foregroundColor(.orange)
        )
        .padding(.horizontal)
    }
    
    private func selectLoginButton(title: String) -> some View {
        Button {
            withAnimation(.easeInOut(duration: 0.2)) {
                loginState += 1
            }
        } label: {
            Image(systemName: "envelope.fill")
                .foregroundColor(.gray)
            Spacer()
            Text(title)
            Spacer()
        }
        .padding(.horizontal)
        .tint(.primary)
        .frame(height: 40)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 1)
                .foregroundColor(.gray.opacity(0.3))
        )
        .padding(.horizontal)
    }
    
    private var startSection: some View {
        VStack {
            Spacer()
            header
            Spacer()
            
            VStack(spacing: 15) {
                startNewButton
                loginButton
                    .padding(.bottom)
                Text("Pallo")
                    .font(.caption2)
            }
        }
    }
    
    private var selectLoginSection: some View {
        VStack {
            
            VStack(alignment: .leading, spacing: 12) {
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        loginState -= 1
                    }
                } label: {
                    Image(systemName: "arrowtriangle.left")
                        .font(.headline)
                        .tint(.black)
                }
                .padding(.bottom)

                Text("열정 품은 타이머")
                Text("가입하기")
                    .foregroundColor(.orange)
            }
            .font(.title)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            VStack(spacing: 10) {
                selectLoginButton(title: "이메일로 시작하기")
                selectLoginButton(title: "구글로 시작하기")
                selectLoginButton(title: "페이스북으로 시작하기")
                selectLoginButton(title: "카카오로 시작하기")
                selectLoginButton(title: "네이버로 시작하기")
                selectLoginButton(title: "Apple로 로그인")
                
                Text("개인정보 처리 방침 이용 약관")
                    .font(.callout)
                    .padding(.top)
                    .foregroundColor(.gray)
                    .background(
                        RoundedRectangle(cornerRadius: 1)
                            .frame(height: 1)
                            .offset(y: 16)
                            .foregroundColor(.gray)
                    )
                    
            }
            .padding(.top)
            Spacer()
            
            HStack {
                Text("이미 계정이 있나요?")
                Button {
                    
                } label: {
                    Text("로그인")
                }.tint(.orange)
            }
            .font(.headline)
            Spacer()
        }
    }
    
    private var termsAgreeSection: some View {
        VStack {
            VStack(alignment: .leading, spacing: 12) {
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        loginState -= 1
                    }
                } label: {
                    Image(systemName: "arrowtriangle.left")
                        .font(.headline)
                        .tint(.black)
                }
                .padding(.bottom)
                
                Text("열정 품은 타이머")
                Text("약관 동의")
                    .foregroundColor(.orange)
            }
            .font(.title)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            Spacer()
            VStack(spacing: 10) {
                ToggleAgreeView(toggleCheck: $toggleCheck)
                Divider()
                ToggleAgreeView(toggleCheck: $toggleCheck)
                ToggleAgreeView(toggleCheck: $toggleCheck)
                ToggleAgreeView(toggleCheck: $toggleCheck)
            }
            .padding()
            
            Button {
                withAnimation(.easeInOut(duration: 0.1)) {
                    loginState += 1
                }
            } label: {
                Text("동의하기")
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .background(toggleCheck ? .orange : .gray.opacity(0.3))
                    .cornerRadius(20)
                    .padding(.horizontal)
            }
            .disabled(!toggleCheck)

            
            Spacer()
            Spacer()
        }
    }
    
    private var signInSection: some View {
        VStack {
            VStack(alignment: .leading, spacing: 12) {
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        loginState -= 1
                    }
                } label: {
                    Image(systemName: "arrowtriangle.left")
                        .font(.headline)
                        .tint(.black)
                }
                .padding(.bottom)
                
                Text("열정 품은 타이머")
                Text("회원 가입")
                    .foregroundColor(.orange)
            }
            .font(.title)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            Spacer()
            VStack(alignment: .leading ,spacing: 15) {
                Text("계정")
                    .fontWeight(.bold)
                TextField("이메일 입력", text: $emailTextField)
                Divider()
                TextField("비밀번호 입력", text: $passwordTextField)
                Divider()
                TextField("비밀번호 확인", text: $passwordCheckField)
            }
            .padding(.horizontal)
            .foregroundColor(.orange)
            .padding()
            
            Spacer()
            Button {
                isSignInValid()
            } label: {
                Text("회원가입")
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .background(.orange)
                    .cornerRadius(20)
                    .padding(.horizontal)
            }
            
            Spacer()
            Spacer()
        }
        .confirmationDialog("회원가입", isPresented: $showAlert) {
            Button(role: .cancel) {
                
            } label: {
                Text("확인")
            }
        } message: {
            Text("비밀번호는 영문 대소문자, 숫자, 특수문자 중 2종류 이상을 조합하여 최소 8자리 이상으로 작성해주세요.")
        }

    }
}

//MARK: - Functions
extension OnboardingView {
    func isSignInValid() {
        guard emailTextField.count >= 3 else {
            showAlert.toggle()
            return
        }
        guard passwordTextField.count > 0, passwordTextField == passwordCheckField else {
            showAlert.toggle()
            return
        }
        userSignIn = true
        userEmail = emailTextField
        loginState += 1
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OnboardingView()
        }
    }
}
