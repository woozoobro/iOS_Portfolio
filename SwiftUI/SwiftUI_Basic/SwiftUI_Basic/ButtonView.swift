//
//  ButtonView.swift
//  SwiftUI_Basic
//
//  Created by 우주형 on 2023/01/01.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        Button {
            print("button tapped")
        } label: {
            Text("Click Me")
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundColor(.white)
        }
        .padding()
        .frame(height: 100)
        .background(.green)
        .cornerRadius(20)

    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
