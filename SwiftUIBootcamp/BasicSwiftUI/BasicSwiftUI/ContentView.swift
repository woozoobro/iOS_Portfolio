//
//  ContentView.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/07/11.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TextButton()
    }
}

//MARK: - 컴포넌트
struct TextButton: View {
    var body: some View {
        Text("버튼을 눌러주세요")
            .foregroundColor(.white)
            .font(.largeTitle)
            .frame(maxWidth: .infinity)
            .padding()
            .background(.blue)
            .cornerRadius(20)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
