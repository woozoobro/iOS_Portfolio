//
//  HeaderTapComponent.swift
//  SelfPortfolio
//
//  Created by 우주형 on 2023/03/03.
//

import SwiftUI

struct HeaderTapComponent: View {
    @Binding var showSkills: Bool
    @State var title: String
    
    var body: some View {
        HStack {
            Image(systemName: "list.bullet.rectangle.portrait.fill")
            Text(title)
            Image(systemName: "chevron.down")
                .rotationEffect(Angle(degrees: showSkills ? -180 : 0))
        }
        .font(.title)
        .foregroundColor(.blue)
    }
}

struct HeaderTapComponent_Previews: PreviewProvider {
    static var previews: some View {
        HeaderTapComponent(showSkills: .constant(true), title: "My Skills")
    }
}
