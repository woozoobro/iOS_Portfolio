//
//  DiaryListView.swift
//  EmotionDiary
//
//  Created by 우주형 on 2023/03/14.
//

import SwiftUI

struct DiaryListView: View {
    @State var list: [MoodDiary] = MoodDiary.list
    private let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    
    var body: some View {
        LazyVGrid(columns: layout) {
            ForEach(list) { item in
                MoodDiaryCell(diary: item)
                    .frame(height: 50)
            }
        }
    }
}

struct DiaryListView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryListView()
    }
}
