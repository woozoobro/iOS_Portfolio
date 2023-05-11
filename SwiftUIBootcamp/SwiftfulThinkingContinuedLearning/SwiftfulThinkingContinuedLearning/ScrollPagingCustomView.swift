//
//  ScrollPagingCustomView.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by 우주형 on 2023/05/11.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(height: 400)
            .foregroundColor(.blue)
    }
}

struct ContentView: View {
    @State var offset: CGSize = .zero
    
    var body: some View {
        CardView()
            .offset(y: offset.height + 300)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        withAnimation(.spring()) {
                            offset = value.translation
                        }
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            offset = .zero
                        }
                    }
            )
            
    }
}


struct ScrollPagingCustomView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
