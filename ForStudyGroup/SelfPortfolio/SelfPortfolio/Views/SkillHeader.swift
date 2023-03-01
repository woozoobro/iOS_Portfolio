//
//  SkillHeader.swift
//  SelfPortfolio
//
//  Created by 우주형 on 2023/03/02.
//

import SwiftUI

struct SkillHeader: View {
    @State var showSkills: Bool = false
    
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            HStack {
                Image(systemName: "list.bullet.rectangle.portrait.fill")
                Text("My Skills")
                Image(systemName: "chevron.down")
                    .rotationEffect(Angle(degrees: showSkills ? -180 : 0))
            }
            .onTapGesture {
                withAnimation(.spring()) {
                    showSkills.toggle()
                }
            }
            .font(.title)
            .foregroundColor(.blue)
            
            
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

struct SkillHeader_Previews: PreviewProvider {
    static var previews: some View {
        SkillHeader()
    }
}
