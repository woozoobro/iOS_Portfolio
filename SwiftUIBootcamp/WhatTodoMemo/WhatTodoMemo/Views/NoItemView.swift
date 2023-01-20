//
//  NoItemView.swift
//  WhatTodoMemo
//
//  Created by 우주형 on 2023/01/20.
//

import SwiftUI

struct NoItemView: View {
    
    @State var animate: Bool = false
    let secondaryAccent: Color = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("메모가 없어요!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("하루를 알차게 보낼 수 있는 계획 \n그것은 바로 메모메모... \n 무엇이든지 기록하고 체크해 볼까요?!")
                    .padding(.bottom, 30)
                
                NavigationLink(destination: AddView()) {
                    Text("메모 추가")
                        .foregroundColor(.white)
                        .font(animate ? .title2 : .title3)
                        .fontWeight(.semibold)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccent : .accentColor).cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? secondaryAccent.opacity(0.3) : .accentColor.opacity(0.6),
                        radius: animate ? 30 : 10 ,
                        x: 0, y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            withAnimation (
                Animation.easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemView()
                .navigationTitle("Title")
        }
    }
}
