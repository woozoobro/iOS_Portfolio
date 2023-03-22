//
//  AnyTransitionBootcamp.swift
//  SwiftfulThinkingMaster
//
//  Created by 우주형 on 2023/03/22.
//

import SwiftUI

struct RotateViewModifier: ViewModifier {
    let rotaion: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotaion))
            .offset(
                x: rotaion != 0 ? UIScreen.main.bounds.width : 0,
                y: rotaion != 0 ? UIScreen.main.bounds.height : 0
            )
    }
}

extension AnyTransition {
    static var rotating: AnyTransition {
        AnyTransition.modifier(
            active: RotateViewModifier(rotaion: 180),
            identity: RotateViewModifier(rotaion: 0))
    }
    
    static func rotating(rotation: Double) -> AnyTransition {
        AnyTransition.modifier(
            active: RotateViewModifier(rotaion: rotation),
            identity: RotateViewModifier(rotaion: 0))
    }
    
    static var rotateOn: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .rotating,
            removal: .move(edge: .leading))
    }
}

struct AnyTransitionBootcamp: View {
    @State private var showRectangle: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            if showRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 250, height: 350)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.rotateOn)
            }
            Spacer()
            
            Text("Click Me!")
                .withDefaultButtonFormatting()
                .padding(.horizontal, 40)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showRectangle.toggle()
                    }
                }
        }
    }
}

struct AnyTransitionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnyTransitionBootcamp()
    }
}
