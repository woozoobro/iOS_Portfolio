//
//  SkillModel.swift
//  SelfPortfolio
//
//  Created by 우주형 on 2023/03/02.
//

import Foundation

struct SkillModel: Identifiable {
    let id = UUID().uuidString
    let imageName: String
    let skillName: String
}

extension SkillModel {
    static let list: [SkillModel] = [
        SkillModel(imageName: "music.note.list", skillName: "Compose"),
        SkillModel(imageName: "video.fill", skillName: "Edit"),
        SkillModel(imageName: "swift", skillName: "Swift"),
    ]
}


