//
//  ContentView.swift
//  TextFactor
//
//  Created by 우주형 on 2023/02/25.
//

//MARK: - 텍스트의 줄이 넘어갈 때 단어 단위가 아니라 글자 단위로 넘기고 싶을경우? -> 해결
import SwiftUI

struct ContentView: View {
    let text = "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세"
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text("120")
                    .font(.caption)
                
                Text(text.split(separator: "").joined(separator: "\u{200B}"))
                    .font(.title3)
            }
            
            Text(text.splitCharacter())
                .font(.system(size: 45))
        }
    }
}

// 스트링 단어별로 말고 캐릭터별로 나눠지게
extension String {
    func splitCharacter() -> String {
        return self.split(separator: "").joined(separator: "\u{200B}")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
