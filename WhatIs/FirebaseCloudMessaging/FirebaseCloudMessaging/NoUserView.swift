//
//  NoUserView.swift
//  Mandarin2
//
//  Created by 우주형 on 2023/04/20.
//

import SwiftUI

struct NoUserView: View {
    @State private var animate: Bool = false
    @Binding var showSignInView: Bool
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 36) {
                Text("로그인 해볼까요?")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom)
                Text("포스팅을 작성하거나\n챌린지에 참가하기 위해선\n로그인이 필요해요!")
                    .padding(.bottom, 20)
                    .lineSpacing(2)
                    .multilineTextAlignment(.leading)
                
                Text("3초만에 로그인")
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, animate ? 40 : 70)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0)
                    .onTapGesture {
                        showSignInView.toggle()
                    }
            }
            .multilineTextAlignment(.center)
            .padding(.horizontal)
            .padding(.top, 60)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoUserView_Previews: PreviewProvider {
    static var previews: some View {
        NoUserView(showSignInView: .constant(false))
    }
}
