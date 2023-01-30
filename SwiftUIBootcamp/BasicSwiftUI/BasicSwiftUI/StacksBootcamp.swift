//
//  StacksBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/15.
//

import SwiftUI

struct StacksBootcamp: View {
    // VStacks -> Vertical
    // HStacks -> Horizontal
    // ZStacks -> ZIndex (back to front)
    var body: some View {
        
        VStack(spacing: 50) {
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                    
                Text("1")
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            Text("1")
                .font(.title)
                .foregroundColor(.white)
                .background(
                    Circle()
                        .frame(width: 100, height: 100)
                )
        }
        
//        VStack(alignment: .leading, spacing: 20) {
//            Rectangle()
//                .fill(Color.green)
//                .frame(width: 200, height: 100)
//            Rectangle()
//                .fill(.orange)
//                .frame(width: 150, height: 100)
//            Rectangle()
//                .fill(.brown)
//                .frame(width: 100, height: 100)
//        }
//        HStack {
//            Rectangle()
//                .fill(Color.green)
//                .frame(width: 100, height: 100)
//            Rectangle()
//                .fill(.orange)
//                .frame(width: 100, height: 100)
//            Rectangle()
//                .fill(.brown)
//                .frame(width: 100, height: 100)
//        }
    }
}

struct StacksBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StacksBootcamp()
    }
}
