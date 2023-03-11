//
//  SkillView.swift
//  SelfPortfolio
//
//  Created by 우주형 on 2023/03/02.
//

import SwiftUI

struct SkillView: View {
    @State var skillLogo: String
    @State var skillName: String
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.gray.opacity(0.1))
                .frame(width: 100, height: 100)
                .shadow(color: Color.blue, radius: 3)
//                .overlay {
//                    VStack(spacing: 10) {
//                        Image(systemName: skillLogo)
//                        Text(skillName)
//                            .minimumScaleFactor(0.5)
//                            
//                    }
//                    .foregroundColor(Color.blue)
//                    .font(.title)
//                }
                
        }
    }
}

struct SkillView_Previews: PreviewProvider {
    static var previews: some View {
        SkillView(skillLogo: "swift", skillName: "Swift")
    }
}
