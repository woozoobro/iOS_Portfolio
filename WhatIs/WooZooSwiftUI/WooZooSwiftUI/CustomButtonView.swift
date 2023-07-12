//
//  CustomButtonView.swift
//  WooZooSwiftUI
//
//  Created by 우주형 on 2023/07/12.
//

import SwiftUI

struct CustomButtonView: View {
    let placeholder: String
    
    init(placeholder: String) {
        self.placeholder = placeholder
    }
    
    var body: some View {
        VStack {
            
            Text(placeholder)
                .foregroundColor(.white)
                .font(.largeTitle)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue)
                .cornerRadius(20)
                .padding()
                .onTapGesture {
                    print("버튼이 눌러 졌어요")
                }
        }
    }
}

struct FlowerView: View {
    let name: String
    
    init(count: Int) {
        self.name = "꽃이 \(count)개수 만큼 있습니다"
    }
    
    var body: some View {
        Text(name)
            .font(.largeTitle)
            .bold()
            .foregroundColor(.white)
            .padding()
            .background(.blue)
    }
}



struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView(placeholder: "호호 구멍이 뚫렸네요")
    }
}



