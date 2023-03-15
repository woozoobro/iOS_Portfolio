//
//  MoodDiaryCell.swift
//  EmotionDiary
//
//  Created by 우주형 on 2023/03/15.
//

import SwiftUI

struct MoodDiaryCell: View {
    @State var diary: MoodDiary
    
    var body: some View {
        Image(systemName: diary.mood.imageName)
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 0)
    }
}

struct MoodDiaryCell_Previews: PreviewProvider {
    static var previews: some View {
        MoodDiaryCell(diary: MoodDiary.list[0])
    }
}
