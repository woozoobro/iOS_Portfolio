//
//  CircleButtonView.swift
//  SwiftfulCrypto3
//
//  Created by 우주형 on 2023/03/12.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName: String
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background {
                Circle()
                    .foregroundColor(Color.theme.background)
            }
            .shadow(color: Color.theme.accent.opacity(0.25), radius: 10, x: 0, y: 0)
            .padding()
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonView(iconName: "plus")
    }
}
