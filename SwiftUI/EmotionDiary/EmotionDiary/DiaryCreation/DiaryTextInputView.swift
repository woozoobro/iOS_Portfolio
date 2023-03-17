//
//  DiaryTextInputView.swift
//  EmotionDiary
//
//  Created by 우주형 on 2023/03/16.
//

import SwiftUI

struct DiaryTextInputView: View {
    let parrentDismiss: DismissAction
    @ObservedObject var vm: DiaryViewModel
    @FocusState var focused: Bool
    
    var body: some View {
        VStack {
            TextEditor(text: $vm.text)
                .focused($focused)
                .border(.gray.opacity(0.2), width: 2)
                .padding()
            
            Button {
                guard !vm.text.isEmpty == true else { return }
                vm.completed()
                parrentDismiss()
            } label: {
                Text("Done")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.cornerRadius(30))
                    .padding()
            }

        }
        .onAppear {
            focused = true
        }
    }
}

struct DiaryTextInputView_Previews: PreviewProvider {
    @Environment(\.dismiss) static var dismiss2
    static var previews: some View {
        DiaryTextInputView(parrentDismiss: dismiss2, vm: DiaryViewModel(diaries: .constant(MoodDiary.list)))
    }
}
