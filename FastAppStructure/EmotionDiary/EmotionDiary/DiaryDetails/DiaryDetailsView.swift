//
//  DiaryDetailsView.swift
//  EmotionDiary
//
//  Created by 우주형 on 2023/01/05.
//

import SwiftUI

struct DiaryDetailsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var diary: MoodDiary
    var body: some View {
        
        VStack {
            ScrollView {
                VStack(spacing: 50) {
                    Text(formattedDate(dateString: diary.date))
                        .font(.system(size: 30, weight: .bold))
                    Image(systemName: diary.mood.imageName)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .shadow(color: .black.opacity(0.2), radius: 10)
                        .frame(height: 80)
                    Text(diary.text)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                }
            }
            Spacer()
            HStack {
                Button {
                    print("Delete button tapped")
                } label: {
                    Image(systemName: "trash")
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                }.foregroundColor(colorScheme == .dark ? .white : .black)
                    .padding()
                Spacer()
            }
        }
    }
}

extension DiaryDetailsView {
    private func formattedDate(dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        let date = formatter.date(from: dateString)

        formatter.dateFormat = "EEE, MMM d, yyyy"
        return formatter.string(from: date!)
    }
}

struct DiaryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryDetailsView(diary: MoodDiary.list.first!)
    }
}
