//
//  AnimationBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/16.
//

import SwiftUI

struct AnimationBootcamp: View {
    @State var isAnimated: Bool = false
    var body: some View {
        VStack {
            Button("Button") {
//                withAnimation(Animation.default.delay(2.0)) {
                    isAnimated.toggle()
//                }
            }
            Spacer()
            RoundedRectangle(cornerRadius: isAnimated ? 50:25)
                .fill(isAnimated ? .blue : .green)
                .frame(
                    width: isAnimated ? 100 : 300,
                    height:isAnimated ? 100 : 300)
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                .offset(y: isAnimated ? 200 : 0)
                .animation(Animation.default.repeatForever(), value: isAnimated)
            Spacer()
        }
    }
}

struct AnimationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimationBootcamp()
    }
}
