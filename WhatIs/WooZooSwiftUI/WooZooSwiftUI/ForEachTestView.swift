//
//  ForEachTestView.swift
//  WooZooSwiftUI
//
//  Created by 우주형 on 2023/07/12.
//

import SwiftUI

struct Card: Hashable {
    let name: String
    let hour: Int
    let content: String
}

extension Card {
    static let cardlist = [
        Card(name: "Steve", hour: 8, content: "초과근무중"),
        Card(name: "Kyle", hour: 7, content: "금요일이니 칼퇴"),
        Card(name: "Thomas", hour: 7, content: "나도 칼퇴")
    ]
}

struct ForEachTestView: View {
    @State var color: Color = .blue
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Card.cardlist, id: \.self) { card in
                    PostCellView(name: card.name, hour: card.hour, content: card.content)
                }
            }
            .padding()
        }
    }
}

struct PostCellView: View {
    let name: String
    let hour: Int
    let content: String
    
    var body: some View {
        HStack(alignment: .top) {
            Circle()
                .frame(width: 30, height: 30)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(name)
                        .font(.body)
                        .bold()
                    
                    Text("\(hour)시간")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                
                Text(content)
                    .font(.callout)
                    .multilineTextAlignment(.leading)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background {
            Color.white.cornerRadius(20)
                .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 0, y: 3)
        }
    }
}



struct ForEachTestView_Previews: PreviewProvider {
    static var previews: some View {
        ForEachTestView()
    }
}
