//
//  NoItemsView.swift
//  TodoList3
//
//  Created by 우주형 on 2023/02/12.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("메모가 없어요")
                    .font(.largeTitle)
                Text("당신은 창의적인 사람인가요?!\n해야할 일들을 자유롭게 한 번 추가해봅시다.\n기록하지 않으면 잊혀지기 마련이에요")
                    .font(.title3)
                    .padding(.bottom, 15)
                
                NavigationLink {
                    AddView()
                } label: {
                    Text("첫 메모 추가!")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.purple : Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, animate ? 50 : 70)
                        .scaleEffect(animate ? 1.1 : 1.0)
                        .offset(y: animate ? -7 : 0)
                        .shadow(color: animate ? Color.purple.opacity(0.5) : Color.blue.opacity(0.7),
                                radius: animate ? 20 : 10, x: 0,
                                y: animate ? 20 : 10)
                        
                }
            }
            .padding()
            .multilineTextAlignment(.center)
        }
        .onAppear(perform: animateUI)
    }
    
    func animateUI() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(.easeIn(duration: 1.8).repeatForever()) {
                animate.toggle()
            }
        }
    }
        
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NoItemsView()
            
    }
}
