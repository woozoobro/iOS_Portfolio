//
//  AnimationView.swift
//  HappySunday
//
//  Created by 우주형 on 2023/03/26.
//

import SwiftUI

struct AnimationView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 20, height: 100)
                .offset(x: animate ? -100 : 100, y: 0)
        }
        .onAppear {
            withAnimation(.spring().repeatForever()) {
                animate.toggle()
            }
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
