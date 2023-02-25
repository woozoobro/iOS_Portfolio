//
//  CircleButtonView.swift
//  SwiftCryptoReview
//
//  Created by 우주형 on 2023/02/25.
//

import SwiftUI

struct CircleButtonView: View {
    let imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background {
                Circle()
                    .foregroundColor(Color.theme.background)
            }
            .shadow(color: Color.theme.accent.opacity(0.24), radius: 10, x: 0, y: 0)
            .padding()
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonView(imageName: "info")
            .previewLayout(.sizeThatFits)
    }
}