//
//  LaunchView.swift
//  DisneyLaunchScreenTest2
//
//  Created by 우주형 on 2023/03/18.
//

import SwiftUI

struct LaunchView: View {
    @State var startAnimation: Bool = false
    @State var bowAnimation: Bool = false
    @State var glow: Bool = false
    @State var plusGlow: Bool = false
    @State var showPlus: Bool = false
    @State var isFinished: Bool = false
    
    var body: some View {
        ZStack {
            if !isFinished {
                ZStack {
                    Color("BG")
                        .ignoresSafeArea()
                    
                    GeometryReader { proxy in
                        let size = proxy.size
                        
                        ZStack {
                            Circle()
                                .trim(from: 0, to: bowAnimation ? 0.5 : 0)
                                .stroke(
                                    .linearGradient(.init(colors: [
                                        Color.white,
                                        Color("Gradient1"),
                                        Color("Gradient2"),
                                        Color("Gradient3"),
                                        Color("Gradient4"),
                                        Color("Gradient5").opacity(0.5),
                                        Color("BG"),
                                        Color("BG"),
                                    ]), startPoint: .leading, endPoint: .trailing)
                                    , style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round)
                                )
                                .rotationEffect(.init(degrees: -200))
                                .overlay {
                                    Circle()
                                        .fill(Color.white.opacity(0.4))
                                        .frame(width: 6, height: 6)
                                        .overlay {
                                            Circle()
                                                .fill(Color.white.opacity(glow ? 0.3 : 0.1))
                                                .frame(width: 20, height: 20)
                                        }
                                        .blur(radius: 2.5)
                                        .offset(x: -((size.width / 2) / 2), y: 10)
                                        .rotationEffect(.init(degrees: bowAnimation ? 180 : 0))
                                        .opacity(startAnimation ? 1 : 0)
                                    
                                }
                                .frame(width: size.width / 2)
                                .padding(.leading, 10)
                                .offset(y: 10)
                            
                            HStack {
                                Image("disney")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: size.width / 2, height: size.width / 2)
                                    .opacity(bowAnimation ? 1 : 0)
                                Image("plus")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .background {
                                        ZStack {
                                            Circle()
                                                .fill(Color.white.opacity(0.25))
                                                .frame(width: 20, height: 20)
                                                .blur(radius: 2)
                                            Circle()
                                                .fill(Color.white.opacity(0.22))
                                                .frame(width: 35, height: 35)
                                                .blur(radius: 2)
                                        }
                                        .opacity(plusGlow ? 1 : 0)
                                    }
                                    .scaleEffect(showPlus ? 1 : 0.01)
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation(.linear(duration: 2.0)) {
                            bowAnimation.toggle()
                        }
                    }
                    withAnimation(.linear(duration: 0.3).repeatForever(autoreverses: true)) {
                        glow.toggle()
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation(.spring()) {
                            startAnimation.toggle()
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                        withAnimation(.spring()) {
                            showPlus.toggle()
                            startAnimation.toggle()
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation(.linear(duration: 0.5)) {
                            plusGlow.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.linear(duration: 0.5)) {
                                plusGlow.toggle()
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            withAnimation {
                                isFinished.toggle()
                            }
                        }
                    }
                }
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
