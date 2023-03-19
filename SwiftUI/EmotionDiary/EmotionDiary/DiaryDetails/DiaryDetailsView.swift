//
//  DiaryDetailsView.swift
//  EmotionDiary
//
//  Created by 우주형 on 2023/03/16.
//

import SwiftUI

struct DiaryDetailsView: View {
    @StateObject var vm: DiaryDetailsViewModel
//    let diary: MoodDiary
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(spacing: 40) {
                    Text(formattedDate(dateString: vm.diary.date))
                        .font(.largeTitle)
                        .bold()
                    
                    Image(systemName: vm.diary.mood.imageName)
                        .renderingMode(.original)
                        .resizable().scaledToFit()
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 0)
                        .frame(height: 100)
                        
                    Text(vm.diary.text)
                        .font(.title)
                        .fontWeight(.semibold)
                }
            }
            
            HStack {
                Button {
                    print("Delete Button Tapped")
                    vm.delete()
                } label: {
                    Image(systemName: "trash")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                        .padding(.leading, 30)
                }
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
        
        formatter.dateFormat = "yy년 MMM d일 EEE"
        formatter.locale = Locale(identifier: "ko")
        return formatter.string(from: date!)
    }
}

struct DiaryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryDetailsView(vm: DiaryDetailsViewModel(diaries: .constant(MoodDiary.list), diary: MoodDiary.list[0]))
    }
}