//
//  Home.swift
//  HeartAnimation
//
//  Created by 우주형 on 2023/07/17.
//

import SwiftUI

struct Home: View {
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    
                }
            }
        }
    }
}

struct HeartLike: View {
    @State var isTapped: Bool = false
    @State var startAnimation = false
    @State var bgAnimation = false
    @State var resetBG = false
    @State var fireworkAnimation = false
    @State var animationEnded = false
    
    // To Avoid Taps during animation
    @State var tapComplete = false
    
    var body: some View {
        Image(systemName: resetBG ? "suit.heart.fill" : "suit.heart")
            .font(.system(size: 45))
            .foregroundColor(resetBG ? .red : .gray)
            .scaleEffect(startAnimation && !resetBG ? 0 : 1)
            .background {
                ZStack {
                    CustomShape(radius: resetBG ? 29 : 0)
                        .fill(Color.purple)
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                        .scaleEffect(bgAnimation ? 2.2 : 0.001)
                    
                    ZStack {
                        
                        let colors: [Color] = [.red, .purple, .green, .yellow, .pink]
                        
                        ForEach(1...6, id: \.self) { index in
                            Circle()
                                .fill(colors.randomElement() ?? .pink)
                                .frame(width: 12, height: 12)
                                .offset(x: fireworkAnimation ? 80 : 40)
                                .rotationEffect(.init(degrees: Double(index) * 60))
                        }
                        
                        ForEach(1...6, id: \.self) { index in
                            Circle()
                                .fill(colors.randomElement() ?? .pink)
                                .frame(width: 8, height: 8)
                                .offset(x: fireworkAnimation ? 64 : 24)
                                .rotationEffect(.init(degrees: Double(index) * 60))
                                .rotationEffect(.init(degrees: -45))
                        }
                    }
                    .opacity(resetBG ? 1 : 0)
                    .opacity(animationEnded ? 0 : 1)
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .contentShape(Rectangle())
            .onTapGesture {
                
                if tapComplete {
                    startAnimation = false
                    bgAnimation = false
                    resetBG = false
                    fireworkAnimation = false
                    animationEnded = false
                    tapComplete = false
                    return
                }
                
                if startAnimation {
                    return
                }
                
                isTapped = true
                
                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
                    startAnimation = true
                }
                
                // Sequence Animation...
                // Chain Animation...
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.5, blendDuration: 0.5)) {
                        bgAnimation = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
                            resetBG = true
                        }
                        
                        withAnimation(.spring()) {
                            fireworkAnimation = true
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                            withAnimation(.easeOut(duration: 0.4)) {
                                animationEnded = true
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                tapComplete = true
                            }
                        }
                        
                    }
                }
                
            }
    }
}

// Custom Shape

struct CustomShape: Shape {
    
    var radius: CGFloat
    
    var animatableData: CGFloat {
        get { return radius}
        set { radius = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
            let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
            path.move(to: center)
            path.addArc(center: center, radius: radius, startAngle: .zero, endAngle: .init(degrees: 360), clockwise: false)
        }
    }
}



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
