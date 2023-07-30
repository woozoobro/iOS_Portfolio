//
//  TestAnimationView.swift
//  WooZooSwiftUI
//
//  Created by 우주형 on 2023/07/20.
//

import SwiftUI

/// 3항 연산자
/// withAnimation과
/// .animation 차이

struct TestAnimationView: View {
    @State var isAnimated: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Button("Button") {
//                withAnimation(.easeIn(duration: 10)) {
                    isAnimated.toggle()
//                }
            }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
                .fill(isAnimated ? .blue : .green)
                .frame(
                    width: isAnimated ? 100 : 300,
                    height: isAnimated ? 100 : 300
                )
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                .offset(y: isAnimated ? 200 : 0)
                .animation(.spring().repeatForever(), value: isAnimated)
            
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
                .fill(isAnimated ? .blue : .green)
                .frame(
                    width: isAnimated ? 100 : 300,
                    height: isAnimated ? 100 : 300
                )
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                .offset(y: isAnimated ? 200 : 0)
                .animation(.spring().repeatForever(), value: isAnimated)
        }
    }
    
//    func cornerRadius(isAnimated: Bool) -> CGFloat {
//        if isAnimated == true {
//            return 50
//        } else {
//            return 25
//        }
//    }
}

struct TestAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        TestAnimationView()
    }
}
