//
//  ForumShimmerRowView.swift
//  FirebaseCloudMessaging
//
//  Created by 우주형 on 2023/08/10.
//

import SwiftUI


struct ForumShimmerRowView: View {
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                HStack(alignment: .top) {
                    ShimmerEffectBox()
                        .cornerRadius(18)
                        .frame(width: 36, height: 36)
                    VStack(alignment: .leading, spacing: 10) {
                        ShimmerEffectBox()
                            .cornerRadius(20)
                            .frame(width: 80, height: 16)
                        ShimmerEffectBox()
                            .cornerRadius(15)
                            .frame(width: 110, height: 25)
                        ShimmerEffectBox()
                            .cornerRadius(20)
                            .frame(width: 60, height: 20)
                    }
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding()
                Divider()
            }
            
        }
    }
}

struct ShimmerEffectBox: View {
    private var gradientColors = [
        Color(uiColor: UIColor.white),
        Color(uiColor: UIColor.systemGray6),
        Color.orange.opacity(0.2),
        Color(uiColor: UIColor.systemGray5)
    ]
    @State var startPoint: UnitPoint = .init(x: -1.8, y: -1.2)
    @State var endPoint: UnitPoint = .init(x: 0, y: -0.2)
    var body: some View {
        LinearGradient (colors: gradientColors,
                        startPoint: startPoint,
                        endPoint: endPoint)
        .onAppear {
            withAnimation (.easeInOut(duration: 0.7)
                .repeatForever (autoreverses: false)) {
                    startPoint = .init(x: 1, y: 1)
                    endPoint = .init(x: 2.2, y: 2.2)
                }
        }
    }
}


struct ForumShimmerRowView_Previews: PreviewProvider {
    static var previews: some View {
        ForumShimmerRowView()
    }
}
