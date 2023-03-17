//
//  DiaryDateInputView.swift
//  EmotionDiary
//
//  Created by 우주형 on 2023/03/16.
//

import SwiftUI
//새로 생성버튼 -> 날짜 입력 -> 감정 입력 -> 일기 내용 입력 -> 저장
struct DiaryDateInputView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var vm: DiaryViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Start Date",
                           selection: $vm.date,
                           displayedComponents: [.date])
                .datePickerStyle(.graphical)
                .frame(width: 350)
                Spacer()
                
                NavigationLink {
                    DiaryMoodInputView(parrentDismiss: dismiss, vm: vm)
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
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}

struct DiaryDateInputView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DiaryDateInputView(vm: DiaryViewModel(diaries: .constant(MoodDiary.list)))
        }
    }
}
