//
//  ProfileView.swift
//  SelfPortfolio
//
//  Created by 우주형 on 2023/03/02.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .frame(width: 120, height: 120)
            HStack {
                Text("Steve")
                Text("우주형")
            }
            .font(.title)
            //.fontWeight(.bold)
            
            Text("빅뱅을 통해 '우주'가 만들어지던 것처럼,\n마음에 울림을 주는'예술'이 만들어지는 것처럼,\n'새로움'을 창조하는 일은 언제나 즐겁습니다.\n\n먼 훗날 제 작품들을 돌이켜 봤을 때 이런 감동을 창작~")
                .multilineTextAlignment(.center)
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
