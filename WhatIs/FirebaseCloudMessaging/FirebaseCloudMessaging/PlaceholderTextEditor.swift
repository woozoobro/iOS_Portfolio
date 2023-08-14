//
//  PlaceholderTextEditor.swift
//  Mandarin2
//
//  Created by 우주형 on 2023/04/03.
//

import SwiftUI

struct PlaceholderTextEditor: View {
    @Binding var text: String
    let placeholder: String
    @FocusState private var focused: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextField(placeholder, text: $text, axis: .vertical)
                .lineLimit(text.isEmpty ? 3 : 100, reservesSpace: text.isEmpty ? true : false)                
                .lineSpacing(4)
                .frame(maxWidth: .infinity)
                .focused($focused)
                .onAppear { focused = true }
        }
    }
}

struct PlaceholderTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderTextEditor(text: .constant(""), placeholder: "내용은 자세하게 작성할수록\n좋은 팀원을 만날 확률이 올라가요")
    }
}
