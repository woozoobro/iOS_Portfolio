//
//  StarTouchView.swift
//  StarRatingTest
//
//  Created by 우주형 on 2023/04/01.
//

import SwiftUI

struct StarTouchView: View {
    @State var touchedIndex: Int = 0
    var body: some View {
        HStack {
            ForEach(0..<5) { _ in
                Image(systemName: "star.fill")
            }
        }
        .font(.largeTitle)
        .overlay {
            Rectangle()
                .foregroundStyle(LinearGradient(colors: [Color.yellow, Color.orange, Color.red], startPoint: .bottomLeading, endPoint: .topTrailing))
                .clipped()
                
        }
        
        
        
    }
}

struct StarTouchView_Previews: PreviewProvider {
    static var previews: some View {
        StarTouchView()
    }
}
