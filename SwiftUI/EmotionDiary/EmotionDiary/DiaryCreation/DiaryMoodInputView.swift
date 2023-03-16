//
//  DiaryMoodInputView.swift
//  EmotionDiary
//
//  Created by 우주형 on 2023/03/16.
//

import SwiftUI
// 선택할 감정들 표현
// 감정 선택시, 저장
struct DiaryMoodInputView: View {    
    let parrentDismiss: DismissAction
    @ObservedObject var vm: DiaryViewModel
    
    let moods: [Mood] = Mood.allCases
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(moods, id: \.self) { mood in
                    Button {
                        vm.mood = mood
                    } label: {
                        VStack {
                            Image(systemName: mood.imageName)
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFit()
                                .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: 0)
                                .padding()
                            Text(mood.name)
                                .foregroundColor(.gray)
                        }
                        .frame(height: 180)
                        .background(mood == vm.mood ? .gray.opacity(0.2) : .clear)
                        .cornerRadius(10)
                    }
                }
            }
            .padding()
            
            Spacer()
            NavigationLink {
                DiaryTextInputView(parrentDismiss: parrentDismiss, vm: vm)
            } label: {
                Text("Next")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.cornerRadius(30))
                    .padding()
            }
            Spacer()
        }
    }
}

struct DiaryMoodInputView_Previews: PreviewProvider {
    @Environment(\.dismiss) static var dismiss2
    static var previews: some View {
        DiaryMoodInputView(parrentDismiss: dismiss2, vm: DiaryViewModel())
    }
}
