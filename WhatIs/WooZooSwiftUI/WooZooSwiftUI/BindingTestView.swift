//
//  BindingTestView.swift
//  WooZooSwiftUI
//
//  Created by 우주형 on 2023/07/17.
//

import SwiftUI

/// State 그리고 Binding
/// 이거를 제일 많이 쓰게 됩니다
/// 언제? struct 같은 value 타입일 때
/// Value   vs Reference
/// StateObject, ObservableObject, ObservedObject, EnvironmentObject 


struct BindingTestView: View {
    @State var textFieldText: String = ""
    
    var body: some View {
        VStack(spacing: 30) {
            TextField("텍스트를 입력해주세요...", text: $textFieldText)
                .padding()
                .background(.gray.opacity(0.2))
        }
        
    }
}

struct BindingTestView_Previews: PreviewProvider {
    static var previews: some View {
        BindingTestView()
    }
}
