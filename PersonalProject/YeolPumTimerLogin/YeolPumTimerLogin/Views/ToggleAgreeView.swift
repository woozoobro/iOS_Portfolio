//
//  ToggleAgreeView.swift
//  YeolPumTimerLogin
//
//  Created by 우주형 on 2023/02/04.
//

import SwiftUI

struct ToggleAgreeView: View {
    @Binding var toggleCheck: Bool
    var body: some View {
        HStack {
            Image(systemName: toggleCheck ? "checkmark.square.fill" : "square")
                .foregroundColor(toggleCheck ? .orange : .primary)
                .onTapGesture {
                    withAnimation {
                        toggleCheck.toggle()
                    }
                }
            Text("모두 동의합니다.")
                .font(.title3)
                .fontWeight(.semibold)
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct ToggleAgreeView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleAgreeView(toggleCheck: .constant(false))
    }
}
