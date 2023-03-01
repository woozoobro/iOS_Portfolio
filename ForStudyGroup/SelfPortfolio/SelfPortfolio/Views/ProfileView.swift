//
//  ProfileView.swift
//  SelfPortfolio
//
//  Created by 우주형 on 2023/03/02.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 10) {
            Circle()
                .frame(width: 150, height: 150)
            HStack {
                Text("Steve")
                Text("우주형")
            }
            .font(.title)
        }
        .padding(.top)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .previewLayout(.sizeThatFits)
    }
}
