//
//  LineMinusView.swift
//  TextFactor
//
//  Created by 우주형 on 2023/02/26.
//

//MARK: - lineSpacing은 음수로 할 수 없는가? - 미해결

import SwiftUI

struct LineMinusView: View {
    @State var animate: Bool = false
    
    let text = "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세안녕하세요안녕하세요안녕하세요"
    
    
    var body: some View {
        VStack {
            Text(text)
                .font(.title)
                .background(Color.green)
                .lineSpacing(animate ? 0 : 60)
                .onTapGesture {
                    withAnimation(.spring(response: 0.55, dampingFraction: 0.1, blendDuration: 2)) {
                        animate.toggle()
                    }
                }
                
        }
    }
    
}


//                    CustomText(text: "Hello \nHello", font: UIFont.boldSystemFont(ofSize: 70))
struct LineMinusView_Previews: PreviewProvider {
    static var previews: some View {
        LineMinusView()
    }
}
