//
//  SkillHeader.swift
//  SelfPortfolio
//
//  Created by 우주형 on 2023/03/02.
//

import SwiftUI

struct SkillListHeader: View {
    @State var showSkills: Bool = false
    
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            
            HeaderTapComponent(showSkills: $showSkills, title: "My Skills")
            .onTapGesture {
                withAnimation(.spring()) {
                    showSkills.toggle()
                }
            }            
            
            LazyVGrid(columns: columns) {
                if showSkills {
                    ForEach(SkillModel.list) { skill in
                        SkillView(skillLogo: skill.imageName, skillName: skill.skillName)
                    }
                }
            }
            
        }
        .padding()
    }
}

struct SkillListHeader_Previews: PreviewProvider {
    static var previews: some View {
        SkillListHeader()
    }
}
