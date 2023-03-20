//
//  ViewModifierBootcamp.swift
//  SwiftfulThinkingMaster
//
//  Created by 우주형 on 2023/03/20.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
            
    }
}

extension View {
    func withDefaultButtonFormatting(backgroundColor: Color = .blue) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}

struct ViewModifierBootcamp: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, world!")
                .withDefaultButtonFormatting()
            
            Text("Hello, everyone!")
                .withDefaultButtonFormatting(backgroundColor: .green)
            
            Text("Hello!!!")
                .withDefaultButtonFormatting(backgroundColor: .yellow)
        }
        .padding()
    }
}

struct ViewModifierBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierBootcamp()
    }
}
